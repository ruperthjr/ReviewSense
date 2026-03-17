import logging
from typing import Dict, Any

from app.ml.sentiment_model import SentimentModel
from app.core.exceptions import AnalysisException

logger = logging.getLogger(__name__)


class SentimentService:
    """
    Service that uses the sentiment model and returns normalized output.
    """

    def __init__(self, model: SentimentModel):
        self.model = model

    def analyze(self, text: str) -> Dict[str, Any]:
        """
        Analyze sentiment of the review text.

        Returns:
            dict: {
                "sentiment_label": str,
                "sentiment_score": float (0-1)
            }
        """
        try:
            result = self.model.predict(text)
            # The model already returns label and score (0-1)
            return {
                "sentiment_label": result["label"],
                "sentiment_score": result["score"],
            }
        except Exception as e:
            logger.error(f"Sentiment analysis failed: {e}", exc_info=True)
            raise AnalysisException(f"Sentiment analysis error: {e}")