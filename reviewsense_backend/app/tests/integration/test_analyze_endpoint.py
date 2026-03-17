import pytest
from httpx import AsyncClient
from unittest.mock import patch, AsyncMock

from app.schemas.analysis_response import AnalysisResponse


class TestAnalyzeEndpoint:
    """Integration tests for the /api/v1/reviews/analyze endpoint."""

    @pytest.mark.asyncio
    async def test_analyze_valid_review(self, client: AsyncClient):
        """Test with valid input, expecting successful analysis."""
        payload = {"review_text": "This product is absolutely fantastic! It exceeded my expectations."}

        response = await client.post("/api/v1/reviews/analyze", json=payload)

        assert response.status_code == 200
        data = response.json()
        # Check response structure matches AnalysisResponse
        assert "sentiment_label" in data
        assert "sentiment_score" in data
        assert "authenticity_label" in data
        assert "authenticity_score" in data
        assert "summary" in data

        # Validate types
        assert isinstance(data["sentiment_label"], str)
        assert isinstance(data["sentiment_score"], float)
        assert 0 <= data["sentiment_score"] <= 1
        assert isinstance(data["authenticity_score"], float)
        assert 0 <= data["authenticity_score"] <= 1

    @pytest.mark.asyncio
    async def test_analyze_review_too_short(self, client: AsyncClient):
        """Test with input shorter than 10 characters."""
        payload = {"review_text": "Short"}

        response = await client.post("/api/v1/reviews/analyze", json=payload)

        assert response.status_code == 422  # Validation error from Pydantic
        data = response.json()
        assert "detail" in data
        # Check that error mentions min length
        assert any("at least 10 characters" in err["msg"] for err in data["detail"])

    @pytest.mark.asyncio
    async def test_analyze_review_empty(self, client: AsyncClient):
        """Test with empty string."""
        payload = {"review_text": ""}

        response = await client.post("/api/v1/reviews/analyze", json=payload)

        assert response.status_code == 422
        data = response.json()
        assert "detail" in data

    @pytest.mark.asyncio
    async def test_analyze_missing_field(self, client: AsyncClient):
        """Test with missing review_text field."""
        payload = {}

        response = await client.post("/api/v1/reviews/analyze", json=payload)

        assert response.status_code == 422
        data = response.json()
        assert "detail" in data
        # Should indicate field is required
        assert any("field required" in err["msg"] for err in data["detail"])

    @pytest.mark.asyncio
    async def test_analyze_with_mocked_orchestrator(self, client: AsyncClient):
        """Test endpoint with mocked orchestrator to verify dependency injection."""
        # We can patch the get_orchestrator dependency to return a mock
        from app.api.v1.reviews import analyze

        mock_orchestrator = AsyncMock()
        mock_orchestrator.analyze.return_value = AnalysisResponse(
            sentiment_label="positive",
            sentiment_score=0.95,
            authenticity_score=0.85,
            authenticity_label="authentic",
            summary="Mocked summary",
        )

        async def mock_get_orchestrator():
            return mock_orchestrator

        # Override dependency for this test
        app = client._transport.app
        original_dep = app.dependency_overrides.get(analyze.get_orchestrator)
        app.dependency_overrides[analyze.get_orchestrator] = mock_get_orchestrator

        try:
            payload = {"review_text": "Great product!"}
            response = await client.post("/api/v1/reviews/analyze", json=payload)

            assert response.status_code == 200
            data = response.json()
            assert data["summary"] == "Mocked summary"
            mock_orchestrator.analyze.assert_awaited_once_with("Great product!")
        finally:
            # Restore original dependency
            if original_dep:
                app.dependency_overrides[analyze.get_orchestrator] = original_dep
            else:
                del app.dependency_overrides[analyze.get_orchestrator]