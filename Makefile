.PHONY: all clean test checks

install-all: install pc-install

install:
	poetry install --no-root --sync
	poetry run ansible-galaxy install -r requirements.yml

pc-install:
	pre-commit install

update-latest:
	poetry up --latest

checks: pc-run

pc-run:
	pre-commit run -a

lint:
	poetry run ansible-lint

test:
	poetry run pytest

test-grafana-loki:
	pushd roles/grafana && poetry run molecule test -s loki; popd
