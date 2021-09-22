INVENTORY=inventory

all:
	ansible-playbook -i $(INVENTORY) provision_awx_on_minikube.yml
ansible:
	ansible-playbook -i $(INVENTORY) --tags ansible provision_awx_on_minikube.yml
minikube:
	ansible-playbook -i $(INVENTORY) --tags minikube provision_awx_on_minikube.yml
