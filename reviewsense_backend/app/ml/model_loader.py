import logging
from functools import lru_cache
from typing import Optional

import lightgbm as lgb
from transformers import pipeline

from app.core.config import settings
from app.core.exceptions import ModelLoadException
from app.ml.sentiment_model import SentimentModel
from app.ml.authenticity_model import AuthenticityModel

logger = logging.getLogger(__name__)


class ModelLoader:
    """
    Singleton model loader that loads and caches ML models.
    """

    _instance: Optional["ModelLoader"] = None
    _sentiment_model: Optional[SentimentModel] = None
    _authenticity_model: Optional[AuthenticityModel] = None

    def __new__(cls) -> "ModelLoader":
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def load_sentiment_model(self) -> SentimentModel:
        """Load the HuggingFace sentiment model."""
        if self._sentiment_model is not None:
            return self._sentiment_model

        try:
            logger.info("Loading sentiment model...")
            # Use the specified model from HuggingFace
            model_name = "cardiffnlp/twitter-roberta-base-sentiment-latest"
            sentiment_pipeline = pipeline(
                "sentiment-analysis",
                model=model_name,
                tokenizer=model_name,
                device=-1,  # CPU; set to 0 for GPU if available
            )
            self._sentiment_model = SentimentModel(sentiment_pipeline)
            logger.info("Sentiment model loaded successfully.")
            return self._sentiment_model
        except Exception as e:
            logger.error(f"Failed to load sentiment model: {e}", exc_info=True)
            raise ModelLoadException(f"Sentiment model loading failed: {e}")

    def load_authenticity_model(self) -> AuthenticityModel:
        """Load the LightGBM authenticity model from a pre-trained file."""
        if self._authenticity_model is not None:
            return self._authenticity_model

        try:
            logger.info("Loading authenticity model...")
            # Path to the pre-trained LightGBM model file
            model_path = "models/authenticity_model.txt"  # You can override via settings
            booster = lgb.Booster(model_file=model_path)
            self._authenticity_model = AuthenticityModel(booster)
            logger.info("Authenticity model loaded successfully.")
            return self._authenticity_model
        except Exception as e:
            logger.error(f"Failed to load authenticity model: {e}", exc_info=True)
            raise ModelLoadException(f"Authenticity model loading failed: {e}")

    def get_sentiment_model(self) -> SentimentModel:
        """Get the cached sentiment model, loading it if necessary."""
        if self._sentiment_model is None:
            self.load_sentiment_model()
        return self._sentiment_model

    def get_authenticity_model(self) -> AuthenticityModel:
        """Get the cached authenticity model, loading it if necessary."""
        if self._authenticity_model is None:
            self.load_authenticity_model()
        return self._authenticity_model


# Global singleton instance
model_loader = ModelLoader()