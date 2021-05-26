# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "fedora/34-cloud-base"
  #config.disksize.size = '60GB'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "5000"
    vb.cpus = "2"
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "ESP",
                  "--vendorid", "0x10c4", "--productid", "0xea60"]
    vb.customize ['usbfilter', 'add', '1', '--target', :id, '--name', 'SOLO',
                  '--vendorid', '0x0483', '--productid', '0xa2ca']
    #vb.customize ['usbfilter', 'add', '2', '--target', :id, '--name', 'yubikey',
    #              '--vendorid', '0x1050', '--productid', '0x0407']
  end

  config.ssh.forward_agent = true

  #config.vm.provision "ansible" do |ansible|
  #  ansible.playbook = "provision.yml"
  #end

  # be sure to add firewall rules on the guest / vm for any open ports
  # temporary:
  # - firewall-cmd --add-port=9000/tcp
  #
  # permanent
  # - firewall-cmd --permanent --add-port=9000/tcp
  # - firewall-cmd --reload

  config.vm.network "private_network", ip: "192.168.10.42"
  config.vm.network "forwarded_port", guest: 8888, host: 8888  # jupyter
  config.vm.network "forwarded_port", guest: 8013, host: 8013  # awx/tower
  config.vm.network "forwarded_port", guest: 8043, host: 8043  # awx/tower
  config.vm.network "forwarded_port", guest: 3001, host: 3001  # awx-pf/tower
  config.vm.network "forwarded_port", guest: 8000, host: 8000  # iwilldo
  config.vm.network "forwarded_port", guest: 9000, host: 9000  # pluto-destroyer
  config.vm.network "forwarded_port", guest: 9200, host: 9200  # elasticsearch
  config.vm.network "forwarded_port", guest: 9300, host: 9300  # elasticsearch
  config.vm.network "forwarded_port", guest: 8085, host: 8085  # logstash
  config.vm.network "forwarded_port", guest: 5601, host: 5601  # kibana

  config.ssh.forward_x11 = true
  config.ssh.username = 'jim'

  # https://www.vagrantup.com/docs/synced-folders/basic_usage.html
  # note: requires private network (defined here - see private_network)
  #       also, guest additions must be in sync with kernel version
  #       otherwise may see quirky issues with mapped folder permissions
  config.vm.synced_folder "../mapped", "/var/mapped", type: "nfs"

end

__END__

# Update Vagrant, Fedora Box

- **WAIT** to update MacOS.
- **VERIFY** virtualbox, vagrant support any new versions before installing.
- https://www.virtualbox.org/wiki/Downloads
- https://www.vagrantup.com/downloads
- vagrant box update --box generic/fedora33

# Required Vagrant Plugins

# https://github.com/sprotheroe/vagrant-disksize
# note:
# * only works with virtualbox
# * disk size can only be increased
vagrant plugin install vagrant-disksize

# Expanding disk size after first boot
# Last successfully used this process with:
# macOS Catalina, Version 10.15.7
# Fedora release 33 (Thirty Three) - 5.9.13-200.fc33.x86_64
# VirtualBox Version 6.1.16 r140961 (Qt5.6.3)
# Vagrant 2.2.14
# vagrant-disksize (0.1.3, global)
(assumes vagrant-disksize was installed before calling `vagrant up` for first time)

Add the following in the `Vagrant.configure(2) ..` block:
   config.disksize.size = '45GB'

1. Log into vm
2. `sudo cfdisk /dev/sda` <--------- I found this step unneccesary
    * Select Resize
    * Accept 'New size: 45G'
    * Select Write, type Yes
    * Select Quit
3. Run lvextend
    # lvdisplay (to look up logical volume path)
    # lvextend -L +40G /dev/fedora_fedora33/root
3. `sudo xfs_growfs /`
4. `df -h | grep '/dev/mapper/fedora_fedora33-root'` should confirm new size

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
    ==> default: Exporting NFS shared folders...
    ==> default: Preparing to edit /etc/exports. Administrator privileges will be required...
    Password: <enter host password>
    ==> default: Mounting NFS shared folders...

In vm, should now see:
* /var/mapped, with files owned by jim:vagrant

## Something to try in the future

### Vagrant plugin

http://jarrettmeyer.com/2016/02/12/vagrant-tip-virtualbox-guest-additions

Installs vagrant-vbguest which seems to automatically install the latest
version of guest additions when you run `vagrant up`.

