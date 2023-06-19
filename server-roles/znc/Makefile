all: secrets
	ansible-playbook -i inventory -e @secrets.yml provision.yml
	rm secrets.yml

secrets:
	pass show playbooks/bootstrap/znc-server > secrets.yml
