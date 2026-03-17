import logging
from typing import Dict, Any

from app.ml.authenticity_model import AuthenticityModel
from app.core.exceptions import AnalysisException

logger = logging.getLogger(__name__)


class AuthenticityService:
    """
    Service that uses the authenticity model and maps score to label.
    """

    def __init__(self, model: AuthenticityModel):
        self.model = model

    def analyze(self, text: str) -> Dict[str, Any]:
        """
        Analyze authenticity of the review text.

        Returns:
            dict: {
                "authenticity_score": float (0-1),
                "authenticity_label": str
            }
        """
        try:
            result = self.model.predict(text)
            return {
                "authenticity_score": result["score"],
                "authenticity_label": result["label"],
            }
        except Exception as e:
            logger.error(f"Authenticity analysis failed: {e}", exc_info=True)
            raise AnalysisException(f"Authenticity analysis error: {e}")