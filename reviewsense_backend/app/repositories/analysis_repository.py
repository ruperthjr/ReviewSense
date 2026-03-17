import logging
from typing import List, Optional
from uuid import UUID

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.db.models.analysis_record import AnalysisRecord

logger = logging.getLogger(__name__)


class AnalysisRepository:
    """
    Repository for analysis records.
    """

    def __init__(self, session: AsyncSession):
        self.session = session

    async def create_analysis_record(
        self,
        review_text: str,
        sentiment_label: str,
        sentiment_score: float,
        authenticity_score: float,
        authenticity_label: str,
        summary: str,
    ) -> AnalysisRecord:
        """
        Create a new analysis record in the database.
        """
        record = AnalysisRecord(
            review_text=review_text,
            sentiment_label=sentiment_label,
            sentiment_score=sentiment_score,
            authenticity_score=authenticity_score,
            authenticity_label=authenticity_label,
            summary=summary,
        )
        self.session.add(record)
        await self.session.commit()
        await self.session.refresh(record)
        logger.info(f"Created analysis record with id {record.id}")
        return record

    async def get_analysis_record_by_id(
        self, record_id: UUID
    ) -> Optional[AnalysisRecord]:
        """
        Retrieve a single analysis record by ID.
        """
        result = await self.session.execute(
            select(AnalysisRecord).where(AnalysisRecord.id == record_id)
        )
        return result.scalar_one_or_none()

    async def get_all_analysis_records(
        self, skip: int = 0, limit: int = 100
    ) -> List[AnalysisRecord]:
        """
        Retrieve all analysis records with pagination.
        """
        result = await self.session.execute(
            select(AnalysisRecord).order_by(AnalysisRecord.created_at.desc()).offset(skip).limit(limit)
        )
        return list(result.scalars().all())