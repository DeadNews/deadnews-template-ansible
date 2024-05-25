.PHONY: all clean test
.ONESHELL:

ping:
	poetry run ansible-playbook playbooks/ping.yml
