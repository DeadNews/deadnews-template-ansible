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

test-ci:
	poetry run pytest --molecule roles -m docker

test-docker_app:
	pushd roles/docker_app && poetry run molecule test --all; popd

test-grafana_loki:
	pushd roles/grafana_loki && poetry run molecule test --all; popd
