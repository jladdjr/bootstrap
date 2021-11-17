all:
	ansible-playbook -i inventory provision.yml

git:
	ansible-playbook -i inventory --tags git provision.yml

tmux:
	ansible-playbook -i inventory --tags tmux provision.yml
