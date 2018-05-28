# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "10000"
    vb.cpus = "5"
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end

  config.vm.network "forwarded_port", guest: 8043, host: 8043  # awx/tower
  config.vm.network "forwarded_port", guest: 80, host: 8080    # pom - prod
  config.vm.network "forwarded_port", guest: 8000, host: 8001  # pom - test

  config.ssh.forward_x11 = true

  # https://www.vagrantup.com/docs/synced-folders/basic_usage.html
  config.vm.synced_folder "../mapped", "/home/vagrant/mapped"
end

__END__

# How to install guest additions (to enable shared folders)
https://wiki.centos.org/HowTos/Virtualization/VirtualBox/CentOSguest

## Overview
- cannot mount folder from host to guest without guest additions
- centos/7 box does not come with guest additions by default
- when installing guest additions:
  - kernel header files must be present and must match kernel version
    (so, good idea to update kernel first, then install kernel header files)
  - VirtualBox guest addition script must be compatible with kernel version
    (so, important to update VirtualBox before attempting to install guest additions)
- apparently, when the kernel updates, the existing guest additions may no longer work?
- vagrant community has plugin to address this (which may be able to be used
  in place of the following steps). See `Vagrant plugin` section below.

## Installing guest additions on CentOS 7 VirtualBox

Update VirtualBox to make sure we have latest version of VirtualBox guest utils

In vm:
# yum install dkms
# yum update kernel
# yum install kernel-devel
(power down vm)

In VirtualBox GUI:
- With vm powered down..
- Add cdrom device (leave drive empty)
- Power on vm
- Select vm, click Show. In VirtualBox VM menu,
  select Devices -> Insert Guest Additions CD image..

In vm:
# mkdir -p /mount/cdrom
# mount /dev/cdrom /mount/cdrom

# uname -a (get kernel version)
# rpm -q kernel-devel (confirm matches kernel version)

# cd /mount/cdrom
# ./VBoxLinuxAdditions.run

## Something to try in the future

### geerlingguy/centos7

https://app.vagrantup.com/geerlingguy/boxes/centos7

It looks like this comes with guest additions installed.
That said, it's not an official image and it's not technically
vanialla CentOS..

### Vagrant plugin

http://jarrettmeyer.com/2016/02/12/vagrant-tip-virtualbox-guest-additions

Installs vagrant-vbguest which seems to automatically install the latest
version of guest additions when you run `vagrant up`.

