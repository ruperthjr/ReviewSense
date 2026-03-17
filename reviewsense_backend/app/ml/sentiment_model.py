import logging
from typing import Dict, Any

from transformers import Pipeline

logger = logging.getLogger(__name__)


class SentimentModel:
    """
    Wrapper for HuggingFace sentiment analysis pipeline.
    Maps model outputs to positive/neutral/negative with confidence scores.
    """

    def __init__(self, pipeline: Pipeline):
        self.pipeline = pipeline
        # Label mapping based on model card:
        # LABEL_0: negative, LABEL_1: neutral, LABEL_2: positive
        self.label_map = {
            "LABEL_0": "negative",
            "LABEL_1": "neutral",
            "LABEL_2": "positive",
        }

    def predict(self, text: str) -> Dict[str, Any]:
        """
        Predict sentiment for a given text.

        Args:
            text: Review text (max length handled by model tokenizer).

        Returns:
            dict: {
                "label": "positive"|"neutral"|"negative",
                "score": float (confidence between 0 and 1)
            }
        """
        if not text or not isinstance(text, str):
            raise ValueError("Input text must be a non-empty string")

        try:
            # Truncate if too long (pipeline handles it, but we can log)
            if len(text) > 512:  # approximate token limit
                logger.warning(f"Text length {len(text)} > 512, will be truncated by tokenizer")

            result = self.pipeline(text)[0]  # returns list with single dict
            # result format: {'label': 'LABEL_0', 'score': 0.99}
            raw_label = result["label"]
            score = result["score"]

            # Map to human-readable label
            label = self.label_map.get(raw_label, "neutral")
            return {"label": label, "score": score}
        except Exception as e:
            logger.error(f"Sentiment prediction failed: {e}", exc_info=True)
            raise