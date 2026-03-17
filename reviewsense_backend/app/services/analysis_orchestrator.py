import asyncio
import logging
from typing import Dict, Any

from app.core.exceptions import AnalysisException
from app.repositories.analysis_repository import AnalysisRepository
from app.services.sentiment_service import SentimentService
from app.services.authenticity_service import AuthenticityService
from app.services.summary_service import SummaryService
from app.schemas.analysis_response import AnalysisResponse

logger = logging.getLogger(__name__)


class AnalysisOrchestrator:
    """
    Orchestrates the full analysis pipeline:
    - Sentiment analysis
    - Authenticity analysis
    - Summary generation
    - Persistence of results
    """

    def __init__(
        self,
        sentiment_service: SentimentService,
        authenticity_service: AuthenticityService,
        summary_service: SummaryService,
        repository: AnalysisRepository,
    ):
        self.sentiment_service = sentiment_service
        self.authenticity_service = authenticity_service
        self.summary_service = summary_service
        self.repository = repository

    async def analyze(self, review_text: str) -> AnalysisResponse:
        """
        Perform full analysis on a review.

        Returns:
            AnalysisResponse with all fields.
        """
        try:
            # Run sentiment and authenticity analysis concurrently in threads
            # (since model inference is CPU-bound)
            sentiment_task = asyncio.to_thread(self.sentiment_service.analyze, review_text)
            authenticity_task = asyncio.to_thread(self.authenticity_service.analyze, review_text)

            sentiment_result, authenticity_result = await asyncio.gather(
                sentiment_task, authenticity_task
            )

            # Generate summary using the results
            summary = self.summary_service.generate_summary(
                sentiment_result, authenticity_result
            )

            # Assemble final response
            response = AnalysisResponse(
                sentiment_label=sentiment_result["sentiment_label"],
                sentiment_score=sentiment_result["sentiment_score"],
                authenticity_score=authenticity_result["authenticity_score"],
                authenticity_label=authenticity_result["authenticity_label"],
                summary=summary,
            )

            # Save to database (repository already has session)
            await self.repository.create_analysis_record(
                review_text=review_text,
                sentiment_label=response.sentiment_label,
                sentiment_score=response.sentiment_score,
                authenticity_score=response.authenticity_score,
                authenticity_label=response.authenticity_label,
                summary=summary,
            )

            return response

        except Exception as e:
            logger.error(f"Analysis orchestration failed: {e}", exc_info=True)
            raise AnalysisException(f"Analysis failed: {e}")