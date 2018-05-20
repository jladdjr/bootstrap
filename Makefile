INVENTORY=inventory

mail:
	ansible-playbook -i $(INVENTORY) --vault-password-file get-vault-pass.sh --tags mutt provision.yml
