INVENTORY=inventory

ag:
	ansible-playbook -i $(INVENTORY) --tags ag provision.yml

ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision.yml

ansible-engineering:
	ansible-playbook -i $(INVENTORY) --tags ansible-engineering provision.yml

ansible-runner:
	ansible-playbook -i $(INVENTORY) --tags runner provision.yml

awx:
	ansible-playbook -i $(INVENTORY) --tags awx provision.yml

bash:
	ansible-playbook -i $(INVENTORY) --tags bash provision.yml

bootstrap:
	ansible-playbook -i $(INVENTORY) --tags bootstrap provision.yml

emacs:
	ansible-playbook -i $(INVENTORY) --tags emacs provision.yml

fzf:
	ansible-playbook -i $(INVENTORY) --tags fzf provision.yml

git:
	ansible-playbook -i $(INVENTORY) --tags git provision.yml

hostname:
	ansible-playbook -i $(INVENTORY) --tags hostname provision.yml

mutt:
	# Expects an ansible-vault file, mutt_secrets.yml, which should take the form:
	# MUTT_PERSONAL_PASSWORD: MY_PASSWORD
	# MUTT_REDHAT_PASSWORD: MY_PASSWORD
	ansible-playbook -i $(INVENTORY) --extra-vars=@/var/mapped/mutt_secrets.yml --vault-password-file get-vault-pass.sh --tags mutt provision.yml

networking:
	ansible-playbook -i $(INVENTORY) --tags networking provision.yml

nodejs:
	ansible-playbook -i $(INVENTORY) --tags nodejs provision.yml

notifications:
	ansible-playbook -i $(INVENTORY) --tags notifications provision.yml

pass:
	ansible-playbook -i $(INVENTORY) --tags pass provision.yml

podman:
	ansible-playbook -i $(INVENTORY) --tags podman provision.yml

solo:
	ansible-playbook -i $(INVENTORY) --tags solo provision.yml

timezone:
	ansible-playbook -i $(INVENTORY) --tags timezone provision.yml

tmux:
	ansible-playbook -i $(INVENTORY) --tags tmux provision.yml

tmux-focus-events:
	ansible-playbook -i $(INVENTORY) --tags tmux-focus-events provision.yml

tower:
	ansible-playbook -i $(INVENTORY) --tags tower provision.yml

tower-packaging:
	ansible-playbook -i $(INVENTORY) --tags tower-packaging provision.yml

tower-qa:
	ansible-playbook -i $(INVENTORY) --tags tower-qa provision.yml
