import pytest
from unittest.mock import Mock, patch

from app.services.sentiment_service import SentimentService
from app.ml.sentiment_model import SentimentModel


class TestSentimentService:
    """Unit tests for SentimentService."""

    @pytest.fixture
    def mock_sentiment_model(self):
        model = Mock(spec=SentimentModel)
        return model

    @pytest.fixture
    def service(self, mock_sentiment_model):
        return SentimentService(mock_sentiment_model)

    def test_analyze_positive(self, service, mock_sentiment_model):
        # Mock model prediction for positive
        mock_sentiment_model.predict.return_value = {"label": "positive", "score": 0.95}

        result = service.analyze("This product is amazing!")

        assert result["sentiment_label"] == "positive"
        assert result["sentiment_score"] == 0.95
        mock_sentiment_model.predict.assert_called_once_with("This product is amazing!")

    def test_analyze_neutral(self, service, mock_sentiment_model):
        mock_sentiment_model.predict.return_value = {"label": "neutral", "score": 0.72}

        result = service.analyze("It's okay, nothing special.")

        assert result["sentiment_label"] == "neutral"
        assert result["sentiment_score"] == 0.72

    def test_analyze_negative(self, service, mock_sentiment_model):
        mock_sentiment_model.predict.return_value = {"label": "negative", "score": 0.88}

        result = service.analyze("Terrible product, broke after one use.")

        assert result["sentiment_label"] == "negative"
        assert result["sentiment_score"] == 0.88

    def test_analyze_handles_model_error(self, service, mock_sentiment_model):
        mock_sentiment_model.predict.side_effect = Exception("Model failure")

        with pytest.raises(Exception) as excinfo:
            service.analyze("Some text")
        assert "Model failure" in str(excinfo.value)