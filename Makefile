INVENTORY=inventory

mail:
	ansible-playbook -i $(INVENTORY) --vault-password-file get-vault-pass.sh --tags mutt provision.yml

bootstrap:
	ansible-playbook -i $(INVENTORY) --tags bootstrap provision.yml
