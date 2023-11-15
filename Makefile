install:
	poetry install --no-root --sync
	poetry run ansible-galaxy install -r requirements.yml

poetry-up:
	poetry up --latest

pre-commit-up:
	pre-commit autoupdate

pre-commit-run:
	pre-commit run -a

lint:
	poetry run ansible-lint

tests:
	poetry run pytest
