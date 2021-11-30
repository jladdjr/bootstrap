all:
	ansible-playbook -i inventory provision.yml

# see also fzf (which enables ctrl-t hotkey for searching for files)
ag:
	ansible-playbook -i inventory --tags ag provision.yml

bash:
	ansible-playbook -i inventory --tags bash provision.yml

emacs:
	ansible-playbook -i inventory --tags emacs provision.yml

fzf:
	ansible-playbook -i inventory --tags fzf provision.yml

git:
	ansible-playbook -i inventory --tags git provision.yml

pass:
	ansible-playbook -i inventory --tags pass provision.yml

system-repos:
	ansible-playbook -i inventory --tags system_repos provision.yml

tmux:
	ansible-playbook -i inventory --tags tmux provision.yml
