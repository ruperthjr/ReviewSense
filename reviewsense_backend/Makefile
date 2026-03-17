.PHONY: help install run test docker-build docker-up docker-down clean

help:
	@echo "Available commands:"
	@echo "  install       Install dependencies using Poetry"
	@echo "  run           Run the FastAPI app with uvicorn (dev)"
	@echo "  test          Run tests with pytest"
	@echo "  docker-build  Build the Docker image"
	@echo "  docker-up     Start all services with docker-compose"
	@echo "  docker-down   Stop all services"
	@echo "  clean         Remove __pycache__, .pytest_cache, etc."

install:
	poetry install

run:
	poetry run uvicorn app.main:app --reload

test:
	poetry run pytest --cov=app --cov-report=term-missing

docker-build:
	docker build -t reviewsense-backend .

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete