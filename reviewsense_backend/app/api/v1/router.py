from fastapi import APIRouter

from app.api.v1.reviews import router as reviews_router

router = APIRouter()

# Include all sub-routers
router.include_router(reviews_router, prefix="/reviews", tags=["reviews"])