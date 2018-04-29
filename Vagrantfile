# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6000"
    vb.cpus = "2"
  end
  config.vm.network "forwarded_port", guest: 8043, host: 8043  # awx/tower
  config.vm.network "forwarded_port", guest: 80, host: 8080    # pom - prod
  config.vm.network "forwarded_port", guest: 8000, host: 8001  # pom - test
  config.ssh.forward_x11 = true
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
