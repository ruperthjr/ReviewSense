from pydantic import BaseModel, Field


class ReviewRequest(BaseModel):
    """
    Request schema for a single review analysis.
    """

    review_text: str = Field(
        ...,
        min_length=10,
        max_length=2000,
        description="The text of the review to analyze",
    )