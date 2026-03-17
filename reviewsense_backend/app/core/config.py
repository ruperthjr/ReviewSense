from typing import List

from pydantic import Field, field_validator
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    """
    Application settings loaded from environment variables.
    """

    DATABASE_URL: str = Field(..., description="PostgreSQL async DSN")
    HOST: str = Field("0.0.0.0", description="Bind host")
    PORT: int = Field(8000, description="Bind port")
    ENVIRONMENT: str = Field("development", description="Runtime environment")
    ALLOWED_ORIGINS: List[str] = Field(
        default=["http://localhost:3000"], description="CORS allowed origins"
    )

    @field_validator("ALLOWED_ORIGINS", mode="before")
    @classmethod
    def parse_allowed_origins(cls, v):
        if isinstance(v, str):
            return [origin.strip() for origin in v.split(",") if origin.strip()]
        return v

    class Config:
        env_file = ".env"
        case_sensitive = False


settings = Settings()