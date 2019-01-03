INVENTORY=inventory

ag:
	ansible-playbook -i $(INVENTORY) --tags ag provision.yml

ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision.yml

bash:
	ansible-playbook -i $(INVENTORY) --tags bash provision.yml

bootstrap:
	ansible-playbook -i $(INVENTORY) --tags bootstrap provision.yml

fugitive:
	ansible-playbook -i $(INVENTORY) --tags fugitive provision.yml

fzf:
	ansible-playbook -i $(INVENTORY) --tags fzf provision.yml

git:
	ansible-playbook -i $(INVENTORY) --tags git provision.yml

mutt:
	# Expects an ansible-vault file, mutt_secrets.yml, which should take the form:
	# MUTT_PERSONAL_PASSWORD: MY_PASSWORD
	# MUTT_REDHAT_PASSWORD: MY_PASSWORD
	ansible-playbook -i $(INVENTORY) --extra-vars=@~/mapped/mutt_secrets.yml --vault-password-file get-vault-pass.sh --tags mutt provision.yml

nerdtree:
	ansible-playbook -i $(INVENTORY) --tags nerdtree provision.yml

networking:
	ansible-playbook -i $(INVENTORY) --tags networking provision.yml

nodejs:
	ansible-playbook -i $(INVENTORY) --tags nodejs provision.yml

pass:
	ansible-playbook -i $(INVENTORY) --tags pass provision.yml

timezone:
	ansible-playbook -i $(INVENTORY) --tags timezone provision.yml

tmux:
	ansible-playbook -i $(INVENTORY) --tags tmux provision.yml

tmux-focus-events:
	ansible-playbook -i $(INVENTORY) --tags tmux-focus-events provision.yml

tower-qa:
	ansible-playbook -i $(INVENTORY) --tags tower-qa provision.yml

vim:
	ansible-playbook -i $(INVENTORY) --tags vim provision.yml

vim_with_plugins:
	ansible-playbook -i $(INVENTORY) --tags vim_with_plugins provision.yml
