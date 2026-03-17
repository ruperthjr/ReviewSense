# ReviewSense Backend

Review analysis API: sentiment detection, authenticity scoring, and summary generation.

## Features

- Analysis using HuggingFace RoBERTa model
- Authenticity detection with LightGBM and handcrafted features
- Rule‑based one‑line summary generator
- Async FastAPI + SQLAlchemy 2.0 + PostgreSQL
- Structured JSON logging, request ID tracking
- Dockerized development and production setup

## Prerequisites

- Python 3.11+
- Poetry (for local development)
- Docker & Docker Compose (optional)

## Quick Start (Local)

1. Clone the repository and install dependencies:

```bash
poetry install
```

2. Copy the example environment file and adjust variables (e.g., database URL):

```bash
cp .env.example .env
# Edit .env as needed
```

3. Start a PostgreSQL instance (locally or with Docker):

```bash
docker-compose up -d postgres
```

4. Run database migrations (if any). Currently, models are created via SQLAlchemy metadata.

5. Start the API:

```bash
make run
```

Visit [http://localhost:8000/api/docs](http://localhost:8000/api/docs) for interactive documentation.

## Running with Docker

```bash
make docker-up   # builds and starts all services
make docker-down # stops containers
```

The API will be available at [http://localhost:8000](http://localhost:8000).

## Testing

```bash
make test
```

Tests use an in‑memory SQLite database and mock models.

## API Usage

**Endpoint:** `POST /api/v1/reviews/analyze`

**Request body:**

```json
{
  "review_text": "This product is absolutely amazing! I highly recommend it to everyone."
}
```

**Response:**

```json
{
  "sentiment_label": "positive",
  "sentiment_score": 0.98,
  "authenticity_score": 0.72,
  "authenticity_label": "authentic",
  "summary": "The review is very positive and appears to be an authentic review."
}
```
