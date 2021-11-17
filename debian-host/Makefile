all:
	ansible-playbook -i inventory provision.yml

bash:
	ansible-playbook -i inventory --tags bash provision.yml

emacs:
	ansible-playbook -i inventory --tags emacs provision.yml

git:
	ansible-playbook -i inventory --tags git provision.yml

pass:
	ansible-playbook -i inventory --tags pass provision.yml

tmux:
	ansible-playbook -i inventory --tags tmux provision.yml
