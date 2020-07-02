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

fugitive:
	ansible-playbook -i $(INVENTORY) --tags fugitive provision.yml

fzf:
	ansible-playbook -i $(INVENTORY) --tags fzf provision.yml

git:
	ansible-playbook -i $(INVENTORY) --tags git provision.yml

gitgutter:
	ansible-playbook -i $(INVENTORY) --tags gitgutter provision.yml

hostname:
	ansible-playbook -i $(INVENTORY) --tags hostname provision.yml

localvimrc:
	ansible-playbook -i $(INVENTORY) --tags localvimrc provision.yml

mutt:
	# Expects an ansible-vault file, mutt_secrets.yml, which should take the form:
	# MUTT_PERSONAL_PASSWORD: MY_PASSWORD
	# MUTT_REDHAT_PASSWORD: MY_PASSWORD
	ansible-playbook -i $(INVENTORY) --extra-vars=@/var/mapped/mutt_secrets.yml --vault-password-file get-vault-pass.sh --tags mutt provision.yml

nerdtree:
	ansible-playbook -i $(INVENTORY) --tags nerdtree provision.yml

networking:
	ansible-playbook -i $(INVENTORY) --tags networking provision.yml

nodejs:
	ansible-playbook -i $(INVENTORY) --tags nodejs provision.yml

notifications:
	ansible-playbook -i $(INVENTORY) --tags notifications provision.yml

pass:
	ansible-playbook -i $(INVENTORY) --tags pass provision.yml

rhubarb:
	ansible-playbook -i $(INVENTORY) --extra-vars=@/var/mapped/rhubarb_secrets.yml --vault-password-file get-vault-pass.sh --tags rhubarb provision.yml

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

vim:
	ansible-playbook -i $(INVENTORY) --tags vim provision.yml

vim_with_plugins:
	ansible-playbook -i $(INVENTORY) --tags vim_with_plugins provision.yml
