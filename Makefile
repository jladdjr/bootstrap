INVENTORY=inventory

all:
	ansible-playbook -i $(INVENTORY) provision.yml
alerts:
	ansible-playbook -i $(INVENTORY) --tags alerts provision.yml
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

ansible-builder:
	ansible-playbook -i $(INVENTORY) --tags ansible-builder provision.yml

bash:
	ansible-playbook -i $(INVENTORY) --tags bash provision.yml

blog:
	ansible-playbook -i $(INVENTORY) --tags blog provision.yml

bootstrap:
	ansible-playbook -i $(INVENTORY) --tags bootstrap provision.yml

docker:
	ansible-playbook -i $(INVENTORY) --tags docker provision.yml

elapsed_time:
	ansible-playbook -i $(INVENTORY) --tags elapsed_time provision.yml

emacs:
	ansible-playbook -i $(INVENTORY) --tags emacs provision.yml

fzf:
	ansible-playbook -i $(INVENTORY) --tags fzf provision.yml

gcloud:
	ansible-playbook -i $(INVENTORY) --tags gcloud provision.yml

git:
	ansible-playbook -i $(INVENTORY) --tags git provision.yml

hostname:
	ansible-playbook -i $(INVENTORY) --tags hostname provision.yml

networking:
	ansible-playbook -i $(INVENTORY) --tags networking provision.yml

nodejs:
	ansible-playbook -i $(INVENTORY) --tags nodejs provision.yml

notifications:
	ansible-playbook -i $(INVENTORY) --tags notifications provision.yml

pass:
	ansible-playbook -i $(INVENTORY) --tags pass provision.yml

python:
	ansible-playbook -i $(INVENTORY) --tags python provision.yml

podman:
	ansible-playbook -i $(INVENTORY) --tags podman provision.yml

solo:
	ansible-playbook -i $(INVENTORY) --tags solo provision.yml

system-packages:
	ansible-playbook -i $(INVENTORY) --tags system-packages provision.yml

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
