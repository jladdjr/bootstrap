INVENTORY=inventory

ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision.yml

bash:
	ansible-playbook -i $(INVENTORY) --tags bash provision.yml

bootstrap:
	ansible-playbook -i $(INVENTORY) --tags bootstrap provision.yml

mail:
	# Expects an ansible-vault file, mutt_secrets.yml, which should take the form:
	# MUTT_PERSONAL_PASSWORD: MY_PASSWORD
	# MUTT_REDHAT_PASSWORD: MY_PASSWORD
	ansible-playbook -i $(INVENTORY) --extra-vars=@/home/vagrant/mapped/mutt_secrets.yml --vault-password-file get-vault-pass.sh --tags mutt provision.yml

vim:
	ansible-playbook -i $(INVENTORY) --tags vim provision.yml
