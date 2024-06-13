.PHONY: all clean default install update checks pc lint test

default: checks

install:
	pre-commit install
	poetry install --sync --no-root
	poetry run ansible-galaxy install -r requirements.yml

update:
	poetry up --latest
	poetry run galaxy-update requirements.yml

checks: pc

pc:
	pre-commit run -a

lint:
	poetry run ansible-lint

test:
	poetry run pytest

test-ci:
	poetry run pytest -rP --molecule roles -m docker -p no:warnings

test-%:
	pushd roles/$* && poetry run molecule test -s $*; popd

test-vg-%:
	pushd roles/$* && poetry run molecule test -s $*_vagrant; popd
