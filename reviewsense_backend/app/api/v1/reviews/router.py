from fastapi import APIRouter

from app.api.v1.reviews import analyze

router = APIRouter()

# Include endpoints
router.add_api_route(
    "/analyze",
    analyze.analyze_review,
    methods=["POST"],
    response_model=analyze.AnalysisResponse,
    summary="Analyze a single review",
)