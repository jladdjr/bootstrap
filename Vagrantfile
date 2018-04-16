# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  config.ssh.forward_x11 = true
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "bootstrap.yml"
  end
end
