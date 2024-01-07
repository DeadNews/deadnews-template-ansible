.PHONY: ping

ping:
	poetry run ansible-playbook playbooks/ping.yml
