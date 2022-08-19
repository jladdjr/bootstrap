#!/bin/bash

USB_DIR=/media/jim/ALPHA
HOME_DIR=/home/jim

# ssh
# add --info=progress2 to see verbose output
#rsync -avz ${HOME_DIR}/.ssh ${USB_DIR}

# bootstrap
rsync -avz ${HOME_DIR}/git/bootstrap ${USB_DIR}

# pass
rsync -avz ${HOME_DIR}/.password-store ${USB_DIR}

# bah
rsync -avz ${HOME_DIR}/.bah ${USB_DIR}
