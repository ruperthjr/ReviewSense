import pytest
from unittest.mock import Mock, patch

from app.services.authenticity_service import AuthenticityService
from app.ml.authenticity_model import AuthenticityModel


class TestAuthenticityService:
    """Unit tests for AuthenticityService."""

    @pytest.fixture
    def mock_authenticity_model(self):
        model = Mock(spec=AuthenticityModel)
        return model

    @pytest.fixture
    def service(self, mock_authenticity_model):
        return AuthenticityService(mock_authenticity_model)

    def test_analyze_authentic(self, service, mock_authenticity_model):
        mock_authenticity_model.predict.return_value = {"score": 0.85, "label": "authentic"}

        result = service.analyze("This is a detailed genuine review with specific feedback.")

        assert result["authenticity_score"] == 0.85
        assert result["authenticity_label"] == "authentic"

    def test_analyze_suspicious(self, service, mock_authenticity_model):
        mock_authenticity_model.predict.return_value = {"score": 0.45, "label": "suspicious"}

        result = service.analyze("Great product! Highly recommend!")

        assert result["authenticity_score"] == 0.45
        assert result["authenticity_label"] == "suspicious"

    def test_analyze_fake(self, service, mock_authenticity_model):
        mock_authenticity_model.predict.return_value = {"score": 0.15, "label": "fake"}

        result = service.analyze("This is the best product ever! I love it! Five stars!")

        assert result["authenticity_score"] == 0.15
        assert result["authenticity_label"] == "fake"

    def test_analyze_handles_model_error(self, service, mock_authenticity_model):
        mock_authenticity_model.predict.side_effect = Exception("Model failure")

        with pytest.raises(Exception) as excinfo:
            service.analyze("Some text")
        assert "Model failure" in str(excinfo.value)