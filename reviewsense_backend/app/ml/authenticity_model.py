import logging
import math
import re
from typing import Dict, Any, List

import lightgbm as lgb
import numpy as np

logger = logging.getLogger(__name__)


class AuthenticityModel:
    """
    Authenticity model using LightGBM with handcrafted features.
    Predicts probability of a review being authentic.
    """

    def __init__(self, booster: lgb.Booster):
        self.booster = booster
        # Thresholds for label assignment
        self.authentic_threshold = 0.7   # probability > 0.7 -> authentic
        self.fake_threshold = 0.3        # probability < 0.3 -> fake
        # List of generic phrases that might indicate fake reviews
        self.generic_phrases = [
            "great product", "very good", "excellent", "highly recommend",
            "not worth", "waste of money", "bad quality", "poor",
            "i love it", "i hate it", "best ever", "worst ever",
            "five stars", "one star", "would buy again", "would not buy again",
            "as described", "fast shipping", "came quickly",
        ]

    def _extract_features(self, text: str) -> List[float]:
        """
        Extract handcrafted features from text.
        Returns a list of floats in the order expected by the LightGBM model.
        """
        text_lower = text.lower()
        words = text.split()
        sentences = re.split(r'[.!?]+', text)
        sentences = [s.strip() for s in sentences if s.strip()]

        # Feature 1: Text length (number of characters)
        text_len = len(text)

        # Feature 2: Punctuation ratio (count of punctuation chars / text length)
        punct_count = sum(1 for c in text if c in "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")
        punct_ratio = punct_count / max(text_len, 1)

        # Feature 3: Capitalization ratio (count of uppercase letters / text length)
        capital_count = sum(1 for c in text if c.isupper())
        capital_ratio = capital_count / max(text_len, 1)

        # Feature 4: Number of exclamation marks
        exclamation_count = text.count("!")

        # Feature 5: Presence of generic phrases (count of matches)
        generic_phrase_count = 0
        for phrase in self.generic_phrases:
            if phrase in text_lower:
                generic_phrase_count += 1

        # Feature 6: Average word length
        avg_word_length = sum(len(w) for w in words) / max(len(words), 1)

        # Feature 7: Number of sentences
        num_sentences = len(sentences)

        # Feature 8: Contains numbers? (binary)
        has_numbers = 1 if any(c.isdigit() for c in text) else 0

        # Assemble feature vector (must match training order)
        features = [
            text_len,
            punct_ratio,
            capital_ratio,
            exclamation_count,
            generic_phrase_count,
            avg_word_length,
            num_sentences,
            has_numbers,
        ]
        return features

    def predict(self, text: str) -> Dict[str, Any]:
        """
        Predict authenticity score and label.

        Args:
            text: Review text.

        Returns:
            dict: {
                "score": float (probability of being authentic, 0-1),
                "label": "authentic" | "suspicious" | "fake"
            }
        """
        if not text or not isinstance(text, str):
            raise ValueError("Input text must be a non-empty string")

        try:
            features = self._extract_features(text)
            # Convert to numpy array of shape (1, n_features)
            X = np.array(features).reshape(1, -1)

            # Predict raw score (log odds) and convert to probability
            # LightGBM Booster.predict returns raw scores by default; to get probabilities,
            # we can use `raw_score=False` if the model was trained with objective 'binary'.
            # For simplicity, we assume raw scores are logits and apply sigmoid.
            raw_score = self.booster.predict(X, raw_score=True)[0]
            prob = 1.0 / (1.0 + math.exp(-raw_score))

            # Determine label based on thresholds
            if prob >= self.authentic_threshold:
                label = "authentic"
            elif prob <= self.fake_threshold:
                label = "fake"
            else:
                label = "suspicious"

            return {"score": prob, "label": label}
        except Exception as e:
            logger.error(f"Authenticity prediction failed: {e}", exc_info=True)
            raise