all: secrets
	ansible-playbook -i inventory -e @secrets.yml provision.yml
	rm secrets.yml

secrets:
	pass show playbooks/bootstrap/debian-host > secrets.yml

# see also fzf (which enables ctrl-t hotkey for searching for files)
ag:
	ansible-playbook -i inventory --tags ag provision.yml

bash:
	ansible-playbook -i inventory --tags bash provision.yml

brave:
	ansible-playbook -i inventory --tags brave provision.yml

creature_comforts:
	ansible-playbook -i inventory --tags creature_comforts provision.yml

fzf:
	ansible-playbook -i inventory --tags fzf provision.yml

general_creature_comforts:
	ansible-playbook -i inventory --tags general_creature_comforts provision.yml

general_dev_tools:
	ansible-playbook -i inventory --tags general_dev_tools provision.yml

general_system_config:
	ansible-playbook -i inventory --tags general_system_config provision.yml

git:
	ansible-playbook -i inventory --tags git provision.yml

hostnames:
	ansible-playbook -i inventory --tags hostnames provision.yml

i3:
	ansible-playbook -i inventory --tags screenshots,redshift,i3,system76 provision.yml

irssi: secrets
	ansible-playbook -i inventory --tags irssi -e @secrets.yml provision.yml
	rm secrets.yml

joplin:
	ansible-playbook -i inventory --tags joplin provision.yml

latex:
	ansible-playbook -i inventory --tags latex provision.yml

pass:
	ansible-playbook -i inventory --tags pass provision.yml

pass_extensions:
	ansible-playbook -i inventory --tags pass_extensions provision.yml

plover:
	ansible-playbook -i inventory --tags plover provision.yml

redshift:
	ansible-playbook -i inventory --tags redshift provision.yml

screenshots:
	ansible-playbook -i inventory --tags screenshots provision.yml

system-repos:
	ansible-playbook -i inventory --tags system_repos provision.yml

system76:
	ansible-playbook -i inventory --tags system76 provision.yml

taskwarrior:
	ansible-playbook -i inventory --tags taskwarrior provision.yml

tech_writing:
	ansible-playbook -i inventory --tags tech_writing provision.yml

timezone:
	ansible-playbook -i inventory --tags timezone provision.yml

tmux:
	ansible-playbook -i inventory --tags tmux provision.yml

keyboard:
	ansible-playbook -i inventory --tags keyboard provision.yml
