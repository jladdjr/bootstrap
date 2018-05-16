# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6000"
    vb.cpus = "3"
  end

  config.vm.network "forwarded_port", guest: 8043, host: 8043  # awx/tower
  config.vm.network "forwarded_port", guest: 80, host: 8080    # pom - prod
  config.vm.network "forwarded_port", guest: 8000, host: 8001  # pom - test

  # https://wiki.centos.org/HowTos/Virtualization/VirtualBox/CentOSguest
  #
  # ## Overview ##
  # - cannot mount folder from host to guest without guest additions
  # - centos/7 box does not come with guest additions by default
  # - when installing guest additions:
  #   - kernel header files must be present and must match kernel version
  #     (so, good idea to update kernel first, then install kernel header files)
  #   - VirtualBox guest addition script must be compatible with kernel version
  #     (so, important to update VirtualBox before attempting to install guest additions)
  # - apparently, when the kernel updates, the existing guest additions may no longer work?
  # - vagrant community has plugin to address this (which may be able to be used
  #   in place of the following steps):
  #
  # Vagrant plugin:
  # - vagrant plugin install vagrant-vbguest
  #   http://jarrettmeyer.com/2016/02/12/vagrant-tip-virtualbox-guest-additions
  #
  # ## Installing guest additions on CentOS 7 VirtualBox ##
  #
  # Update VirtualBox to make sure we have latest version of VirtualBox guest utils
  #
  # In VirtualBox GUI:
  # - Power down vm
  # - Add cdrom device (leave drive empty)
  # - Power on vm
  # - Select vm, click Show. In VirtualBox VM menu,
  #   select Devices -> Insert Guest Additions CD image..
  #
  # In vm:
  # (as root)
  # mkdir -p /mount/cdrom
  # mount /dev/cdrom /mount/cdrom
  #
  # yum install dkms
  # yum update kernel
  # yum install kernel-devel
  # reboot
  # uname -a (get kernel version)
  # rpm -q kernel-devel (confirm matches kernel version)
  #
  # cd /mount/cdrom
  # ./VBoxLinuxAdditions.run
  # Note version of VirtualBox Guest Additions being installed

  # https://www.vagrantup.com/docs/synced-folders/basic_usage.html
  config.vm.synced_folder "../mapped", "/home/vagrant/mapped"

  config.ssh.forward_x11 = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
