#!/bin/bash

USB_DIR=/media/jim/GOKIT
HOME_DIR=/home/jim

# ssh
# add --info=progress2 to see verbose output
rsync -avz --delete ${HOME_DIR}/.ssh ${USB_DIR}

# bootstrap
cd ${USB_DIR}/bootstrap
git pull -f

# pass
cd ${USB_DIR}/.password-store
git pull -f ${HOME_DIR}/.password-store

# bah
cd ${USB_DIR}/bah/.password-store
git pull -f ${HOME_DIR}/.bah/.password-store
