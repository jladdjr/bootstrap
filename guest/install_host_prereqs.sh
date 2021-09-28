#!/usr/bin/bash

# prepares host (rhel 8.4) to support running fedora-34 vagrant vm

# rhel registration
sudo subscription-manager service-level --set="Self-Support"
sudo subscription-manager usage --set="Development/Test"
sudo subscription-manager attach

# ansible
sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo dnf install -y ansible

# virtualbox

sudo dnf -y install wget
cd /tmp
wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo mv virtualbox.repo /etc/yum.repos.d/
sudo dnf install -y VirtualBox-6.1

# vagrant
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vagrant

# create shared folder directory
mkdir -p ~/Vagrant/mapped
touch ~/Vagrant/mapped/__shared_folder__

# tell firewalld to allow nfs traffic (used for vm's mapped folder)
# https://42notes.wordpress.com/2015/04/30/notes-on-nfs-firewalld-selinux/
sudo firewall-cmd --zone public --change-interface vboxnet0
sudo firewall-cmd --zone public --permanent --add-service nfs
sudo firewall-cmd --zone public --permanent --add-service rpc-bind
sudo firewall-cmd --zone public --permanent --add-service mountd
sudo firewall-cmd --zone public --permanent --add-port 2049/udp
sudo firewall-cmd --reload
