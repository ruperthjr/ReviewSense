import logging
from typing import Annotated

from fastapi import Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.core.exceptions import AnalysisException, ModelLoadException, ValidationException
from app.ml.model_loader import model_loader
from app.repositories.analysis_repository import AnalysisRepository
from app.schemas.analysis_response import AnalysisResponse
from app.schemas.review_request import ReviewRequest
from app.services.analysis_orchestrator import AnalysisOrchestrator
from app.services.authenticity_service import AuthenticityService
from app.services.sentiment_service import SentimentService
from app.services.summary_service import SummaryService

logger = logging.getLogger(__name__)


async def get_orchestrator(
    db: Annotated[AsyncSession, Depends(get_db)],
) -> AnalysisOrchestrator:
    """
    Dependency that builds the orchestrator with all required services.
    Models are loaded from the singleton loader.
    """
    try:
        sentiment_model = model_loader.get_sentiment_model()
        authenticity_model = model_loader.get_authenticity_model()
    except Exception as e:
        logger.error(f"Failed to load models: {e}", exc_info=True)
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Machine learning models are not available",
        )

    sentiment_service = SentimentService(sentiment_model)
    authenticity_service = AuthenticityService(authenticity_model)
    summary_service = SummaryService()
    repository = AnalysisRepository(db)  # pass the session

    return AnalysisOrchestrator(
        sentiment_service=sentiment_service,
        authenticity_service=authenticity_service,
        summary_service=summary_service,
        repository=repository,
    )


async def analyze_review(
    request: ReviewRequest,
    orchestrator: Annotated[AnalysisOrchestrator, Depends(get_orchestrator)],
) -> AnalysisResponse:
    """
    Endpoint to analyze a single review.
    """
    try:
        result = await orchestrator.analyze(request.review_text)
        return result
    except (AnalysisException, ModelLoadException, ValidationException) as e:
        # These are already mapped to HTTP exceptions via global handlers
        raise
    except Exception as e:
        logger.error(f"Unexpected error in analyze endpoint: {e}", exc_info=True)
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="An unexpected error occurred",
        )