INVENTORY=inventory

all:
	ansible-playbook -i $(INVENTORY) provision_host.yml
ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision_host.yml
minikube:
	ansible-playbook -i $(INVENTORY) --tags minikube provision_host.yml
