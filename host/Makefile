INVENTORY=inventory

all:
	ansible-playbook -i $(INVENTORY) provision.yml
minikube:
	ansible-playbook -i $(INVENTORY) --tags minikube provision.yml
