.PHONY: setup install lock dev test docker-build docker-up docker-down clean

# Environment Variables
PYTHON = python3
PIPENV = pipenv

setup: ## Initialize Python virtual environment with Pipenv
	pip install pipenv
	$(PIPENV) --python 3.10

install: ## Install tracked dependencies from Pipfile
	$(PIPENV) install --dev

lock: ## Lock active dependencies into Pipfile.lock
	$(PIPENV) lock

dev: ## Launch the application locally in development mode
	$(PIPENV) run python app.py

test: ## Run the automated test suite with pytest
	$(PIPENV) run pytest

docker-build: ## Build the Docker containers
	docker compose build

docker-up: ## Boot the multi-container configuration
	docker compose up -d

docker-down: ## Tear down the container services
	docker compose down

clean: ## Purge local runtime caches and compilation files
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
