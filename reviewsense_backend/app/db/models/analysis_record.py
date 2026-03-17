import uuid
from datetime import datetime, timezone

from sqlalchemy import DateTime, Float, String, Text
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base


class AnalysisRecord(Base):
    __tablename__ = "analysis_records"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), primary_key=True, default=uuid.uuid4
    )
    review_text: Mapped[str] = mapped_column(Text, nullable=False)
    sentiment_label: Mapped[str] = mapped_column(String(50), nullable=False)
    sentiment_score: Mapped[float] = mapped_column(Float, nullable=False)
    authenticity_score: Mapped[float] = mapped_column(Float, nullable=False)
    authenticity_label: Mapped[str] = mapped_column(String(50), nullable=False)
    summary: Mapped[str] = mapped_column(Text, nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), default=lambda: datetime.now(timezone.utc)
    )