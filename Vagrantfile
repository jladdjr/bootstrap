# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "generic/fedora33"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "5000"
    vb.cpus = "2"
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "ESP",
                  "--vendorid", "0x10c4", "--productid", "0xea60"]
  end

  config.ssh.forward_agent = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end

  config.vm.network "forwarded_port", guest: 8888, host: 8888  # jupyter
  config.vm.network "forwarded_port", guest: 8013, host: 8013  # awx/tower
  config.vm.network "forwarded_port", guest: 8043, host: 8043  # awx/tower
  config.vm.network "forwarded_port", guest: 3001, host: 3001  # awx-pf/tower

  config.ssh.forward_x11 = true
  config.ssh.username = 'jim'

  # https://www.vagrantup.com/docs/synced-folders/basic_usage.html
  config.vm.synced_folder "../mapped", "/var/mapped",
      owner: "jim", group: "vagrant"
end

__END__

# Required Vagrant Plugins

# https://github.com/sprotheroe/vagrant-disksize
# note:
# * only works with virtualbox
# * disk size can only be increased
vagrant plugin install vagrant-disksize

# Expanding disk size after first boot

(assumes vagrant-disksize was installed before calling `vagrant up` for first time)

Add the following in the `Vagrant.configure(2) ..` block:
   config.disksize.size = '45GB'

1. Log into vm
2. `sudo cfdisk /dev/sda`
    * Select Resize
    * Accept 'New size: 45G'
    * Select Write, type Yes
    * Select Quit
3. `sudo xfs_growfs /`
4. `df -h | grep sda1` should confirm new size

Resources:

* [Known issue with xfs_{info,growfs} /dev/sda1](https://access.redhat.com/solutions/3940331)
* [xfs file system](https://en.wikipedia.org/wiki/XFS)

# Using ssh-agent

On the host machine, add (default) keys:

$ ssh-add
$ ssh-add -l (or ssh-add -L to show public key

If ssh-agent is not already running inside the vm, run:

$ eval $(ssh-agent)

This will:
1. start ssh-agent, and
2. source ssh-agent env vars

# Bootstrapping new vm

- uncomment `config.ssh.username` in Vagrantfile
- useradd jim; passwd jim
- copy vagrant's authorized_keys file to jim home dir
- add jim to sudoers

Note: `vagrant ssh -p` will let you log in using your own keys
instead of vagrant's.

# How to install guest additions (to enable shared folders)

Although generic/fedora33 comes with guest additions
you will need to update it if you updaet the kernel
(e.g. w/ `dnf update`).


## Overview
- cannot mount folder from host to guest without guest additions
- when installing guest additions:
  - kernel header files must be present and must match kernel version
  - VirtualBox guest addition script must be compatible with kernel version
    (so, important to update VirtualBox before attempting to install guest additions)
- vagrant community has plugin to address this (which may be able to be used
  in place of the following steps). See `Vagrant plugin` section below.

## Installing guest additions on CentOS 8 VirtualBox

Update VirtualBox to make sure we have latest version of VirtualBox guest utils

In vm:
# dnf upgrade
# dnf groupinstall -y "Development Tools"
# dnf update kernel          # may not be needed after doing
# dnf update kernel-devel    # `dnf upgrade`
(power down vm)

In VirtualBox GUI:
- Update VirtualBox
- With vm powered down..
- Add cdrom device (leave drive empty)
- Power on vm (vagrant up)
- Select vm, click Show. In VirtualBox VM menu,
  select Devices -> Insert Guest Additions CD image..

In vm (if cdrom not already mounted):
# mkdir -p /media/cdrom
# mount /dev/cdrom /media/cdrom

# uname -a (get kernel version)
# rpm -q kernel-devel (confirm matches kernel version)

# dnf remove virtualbox-guest-additions (or rpm -e --nodeps ... if you need to)

# cd /media/cdrom
# dnf install -y gcc make perl elfutils-libelf-devel bzip2 (required by VBoxLinuxAdditions.run)
# ./VBoxLinuxAdditions.run  (latest version used: VirtualBox Guest Additions 6.0.22 w/
                                                  Version 6.0.22 r137980 (Qt5.6.3))

# restart vm
$ vagrant reload

Towards the end of the vm booting up, should see:
    ==> default: Machine booted and ready!
    ==> default: Checking for guest additions in VM...
    ==> default: Rsyncing folder: /Users/jim/Vagrant/centos8/ => /vagrant
    ==> default: Mounting shared folders...
        default: /var/mapped => /Users/jim/Vagrant/mapped

In vm, should now see:
* /var/mapped, with files owned by jim:vagrant

## Something to try in the future

### Vagrant plugin

http://jarrettmeyer.com/2016/02/12/vagrant-tip-virtualbox-guest-additions

Installs vagrant-vbguest which seems to automatically install the latest
version of guest additions when you run `vagrant up`.

