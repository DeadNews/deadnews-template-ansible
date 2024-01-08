.PHONY: all clean test

ping:
	poetry run ansible-playbook playbooks/ping.yml
