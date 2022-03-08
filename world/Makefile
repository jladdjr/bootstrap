secrets:
	pass show playbooks/world > secrets.yml

all: secrets
	ansible-playbook -i inventory -e @secrets.yml provision.yml
	rm secrets.yml

borg: secrets
	ansible-playbook -i inventory -e @secrets.yml --tags borg provision.yml
	rm secrets.yml

emacs:
	ansible-playbook -i inventory --tags emacs provision.yml

plover:
	ansible-playbook -i inventory --tags plover provision.yml

