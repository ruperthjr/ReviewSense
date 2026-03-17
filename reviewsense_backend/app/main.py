import logging
from contextlib import asynccontextmanager
from typing import AsyncGenerator

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from app.api.v1.router import router as api_v1_router
from app.core.config import settings
from app.core.database import engine
from app.core.exception_handlers import (
    analysis_exception_handler,
    model_load_exception_handler,
    validation_exception_handler,
)
from app.core.exceptions import AnalysisException, ModelLoadException, ValidationException
from app.core.logging import setup_logging
from app.core.middleware import RequestIDMiddleware, TimingMiddleware

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncGenerator:
    """
    Lifespan context manager for startup and shutdown events.
    """
    # Startup
    setup_logging()
    logger.info("Starting up ReviewSense API...")
    # Optional: preload ML models here if needed
    yield
    # Shutdown
    logger.info("Shutting down ReviewSense API...")
    await engine.dispose()


def create_app() -> FastAPI:
    """
    Application factory.
    """
    app = FastAPI(
        title="ReviewSense API",
        version="1.0.0",
        lifespan=lifespan,
        docs_url="/api/docs" if settings.ENVIRONMENT != "production" else None,
        redoc_url=None,
    )

    # CORS
    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.ALLOWED_ORIGINS,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # Custom middlewares
    app.add_middleware(RequestIDMiddleware)
    app.add_middleware(TimingMiddleware)

    # Exception handlers
    app.add_exception_handler(AnalysisException, analysis_exception_handler)
    app.add_exception_handler(ModelLoadException, model_load_exception_handler)
    app.add_exception_handler(ValidationException, validation_exception_handler)

    # Health check endpoint
    @app.get("/health", tags=["Health"])
    async def health_check() -> JSONResponse:
        return JSONResponse(content={"status": "ok"})

    # API routers
    app.include_router(api_v1_router, prefix="/api/v1")

    return app


app = create_app()