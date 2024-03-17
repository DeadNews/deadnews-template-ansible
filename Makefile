.PHONY: all clean default install update checks pc lint test

default: checks

install:
	pre-commit install
	poetry install --sync --no-root
	poetry run ansible-galaxy install -r requirements.yml

update:
	poetry up --latest

checks: pc

pc:
	pre-commit run -a

lint:
	poetry run ansible-lint

test:
	poetry run pytest

test-ci:
	poetry run pytest -n auto --forked --molecule roles -m docker -p no:warnings

test-docker_app:
	pushd roles/docker_app && poetry run molecule test --all; popd

test-traefik:
	pushd roles/traefik && poetry run molecule test --all; popd

test-grafana_loki:
	pushd roles/grafana_loki && poetry run molecule test --all; popd
