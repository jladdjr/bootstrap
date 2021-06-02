# host prerequisites

# NFS troubleshooting

On a Fedora 34 host, need to update the firewall rules to allow nfs shared folders
https://42notes.wordpress.com/2015/04/30/notes-on-nfs-firewalld-selinux/

```
firewall-cmd --list-all  (shows all zones)
sudo firewall-cmd --zone FedoraWorkstation --change-interface vboxnet0
sudo firewall-cmd --zone FedoraWorkstation --permanent --add-service nfs
sudo firewall-cmd --zone FedoraWorkstation --permanent --add-service rpc-bind
sudo firewall-cmd --zone FedoraWorkstation --permanent --add-service mountd
sudo firewall-cmd --zone FedoraWorkstation --permanent --add-port 2049/udp
sudo firewall-cmd --reload
```

# ssh-agent configuration

In order to launch ssh-agent when opening a new session, add the following to ~/.bash_profile:

```
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
```
