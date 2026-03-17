import logging
from typing import Dict, Any

logger = logging.getLogger(__name__)


class SummaryService:
    """
    Rule-based summary generator based on sentiment and authenticity.
    No external LLM needed.
    """

    def generate_summary(self, sentiment: Dict[str, Any], authenticity: Dict[str, Any]) -> str:
        """
        Generate a one-line summary from sentiment and authenticity results.

        Args:
            sentiment: dict with keys 'sentiment_label', 'sentiment_score'
            authenticity: dict with keys 'authenticity_label', 'authenticity_score'

        Returns:
            str: Summary sentence.
        """
        sent_label = sentiment["sentiment_label"]
        sent_score = sentiment["sentiment_score"]
        auth_label = authenticity["authenticity_label"]
        auth_score = authenticity["authenticity_score"]

        # Determine intensity modifier based on score
        if sent_score >= 0.8:
            intensity = "very"
        elif sent_score >= 0.6:
            intensity = "moderately"
        else:
            intensity = "somewhat"

        # Base summary parts
        if auth_label == "authentic":
            authenticity_phrase = "appears to be an authentic review"
        elif auth_label == "suspicious":
            authenticity_phrase = "shows some signs of being suspicious"
        else:  # fake
            authenticity_phrase = "is likely fake or deceptive"

        # Combine
        if sent_label == "positive":
            summary = f"The review is {intensity} positive and {authenticity_phrase}."
        elif sent_label == "negative":
            summary = f"The review is {intensity} negative and {authenticity_phrase}."
        else:  # neutral
            summary = f"The review is neutral in tone and {authenticity_phrase}."

        # Add confidence note for low authenticity scores
        if auth_score < 0.5:
            summary += " (low confidence in authenticity detection)"
        elif auth_score > 0.9:
            summary += " (high confidence)"

        return summary