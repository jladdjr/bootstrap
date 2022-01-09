all:
	ansible-playbook -i inventory provision.yml

secrets:
	pass show playbooks/bootstrap/debian-host > secrets.yml

irssi: secrets
	ansible-playbook -i inventory --tags irssi -e @secrets.yml provision.yml
	rm secrets.yml

plover:
	ansible-playbook -i inventory --tags plover provision.yml
