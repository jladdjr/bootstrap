INVENTORY=inventory

all:
	ansible-playbook -i $(INVENTORY) provision.yml
ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision.yml
minikube:
	ansible-playbook -i $(INVENTORY) --tags minikube provision.yml
