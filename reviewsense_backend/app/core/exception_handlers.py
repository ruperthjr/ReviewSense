import logging
from typing import Union

from fastapi import Request
from fastapi.responses import JSONResponse

from app.core.exceptions import AnalysisException, ModelLoadException, ValidationException

logger = logging.getLogger(__name__)


async def analysis_exception_handler(
    request: Request, exc: AnalysisException
) -> JSONResponse:
    logger.error(f"AnalysisException: {exc.message}", exc_info=True)
    return JSONResponse(
        status_code=500,
        content={"detail": "Analysis service error", "message": exc.message},
    )


async def model_load_exception_handler(
    request: Request, exc: ModelLoadException
) -> JSONResponse:
    logger.error(f"ModelLoadException: {exc.message}", exc_info=True)
    return JSONResponse(
        status_code=503,
        content={"detail": "Model unavailable", "message": exc.message},
    )


async def validation_exception_handler(
    request: Request, exc: ValidationException
) -> JSONResponse:
    logger.warning(f"ValidationException: {exc.message}")
    return JSONResponse(
        status_code=400,
        content={"detail": "Validation error", "message": exc.message},
    )