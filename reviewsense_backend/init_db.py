import asyncio
from app.db.base import Base
from app.core.database import engine
# Import models so they are registered with Base.metadata
from app.db.models import AnalysisRecord

async def init_db():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    print("Tables created successfully")

asyncio.run(init_db())
