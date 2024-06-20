#!/bin/bash

USB_DIR=/media/jim/GOKIT
HOME_DIR=/home/jim

# ssh
# add --info=progress2 to see verbose output
#rsync -avz ${HOME_DIR}/.ssh ${USB_DIR}

# bootstrap
rsync -avz ${HOME_DIR}/git/bootstrap/.git ${USB_DIR}/bootstrap.git

# pass
rsync -avz ${HOME_DIR}/.password-store/.git ${USB_DIR}/password-store.git

# bah
rsync -avz ${HOME_DIR}/.bah/.git ${USB_DIR}/bah.git
