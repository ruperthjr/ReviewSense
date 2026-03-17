from pydantic import BaseModel, Field


class AnalysisResponse(BaseModel):
    """
    Response schema containing analysis results.
    """

    sentiment_label: str = Field(..., description="Positive, Neutral, or Negative")
    sentiment_score: float = Field(
        ..., ge=0.0, le=1.0, description="Confidence score for sentiment"
    )
    authenticity_score: float = Field(
        ..., ge=0.0, le=1.0, description="Likelihood of being authentic (0=fake, 1=real)"
    )
    authenticity_label: str = Field(
        ..., description="Authentic or Fake"
    )
    summary: str = Field(..., description="Generated summary of the review")