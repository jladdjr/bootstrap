#!/usr/bin/bash

minikube start --force-systemd=true \
               --install-addons=true \
               --addons=ingress \
               --cni=flannel \
               --cpus=4 \
               --memory=8g \
               --kubernetes-version=stable \
               --mount \
               --mount-string="/home/jim/git/awx:/awx_devel"
