all:
	ansible-playbook -i inventory provision.yml

bash:
	ansible-playbook -i inventory --tags bash provision.yml
git:
	ansible-playbook -i inventory --tags git provision.yml

tmux:
	ansible-playbook -i inventory --tags tmux provision.yml
