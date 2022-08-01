#!/bin/bash

USB_DIR=/media/jim/ALPHA
HOME_DIR=/home/jim

# ssh
# add --info=progress2 to see verbose output
rsync -avz --delete ${HOME_DIR}/.ssh ${USB_DIR}

# bootstrap
cd ${USB_DIR}/bootstrap
git pull ${HOME_DIR}/git/bootstrap

# pass
cd ${USB_DIR}/.password-store
git pull ${HOME_DIR}/.password-store
