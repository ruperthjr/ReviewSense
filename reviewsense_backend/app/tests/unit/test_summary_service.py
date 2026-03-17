import pytest
from app.services.summary_service import SummaryService


class TestSummaryService:
    """Unit tests for SummaryService."""

    @pytest.fixture
    def service(self):
        return SummaryService()

    @pytest.mark.parametrize(
        "sentiment_label,sentiment_score,auth_label,auth_score,expected_phrase",
        [
            ("positive", 0.95, "authentic", 0.9, "very positive and appears to be an authentic review"),
            ("positive", 0.65, "suspicious", 0.45, "moderately positive and shows some signs of being suspicious"),
            ("positive", 0.3, "fake", 0.2, "somewhat positive and is likely fake or deceptive"),
            ("negative", 0.85, "authentic", 0.85, "very negative and appears to be an authentic review"),
            ("neutral", 0.7, "authentic", 0.8, "neutral in tone and appears to be an authentic review"),
        ],
    )
    def test_generate_summary_variations(self, service, sentiment_label, sentiment_score, auth_label, auth_score, expected_phrase):
        sentiment = {"sentiment_label": sentiment_label, "sentiment_score": sentiment_score}
        authenticity = {"authenticity_label": auth_label, "authenticity_score": auth_score}
        summary = service.generate_summary(sentiment, authenticity)
        assert expected_phrase in summary

    def test_low_authenticity_confidence_adds_note(self, service):
        sentiment = {"sentiment_label": "positive", "sentiment_score": 0.9}
        authenticity = {"authenticity_label": "suspicious", "authenticity_score": 0.4}
        summary = service.generate_summary(sentiment, authenticity)
        assert "(low confidence in authenticity detection)" in summary

    def test_high_authenticity_confidence_adds_note(self, service):
        sentiment = {"sentiment_label": "positive", "sentiment_score": 0.9}
        authenticity = {"authenticity_label": "authentic", "authenticity_score": 0.95}
        summary = service.generate_summary(sentiment, authenticity)
        assert "(high confidence)" in summary