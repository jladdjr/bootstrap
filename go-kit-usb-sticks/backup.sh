#!/bin/bash

set -x

USB_DIR=/media/jim/GOKIT
HOME_DIR=/home/jim

# ssh
# add --info=progress2 to see verbose output
rsync -avz --delete ${HOME_DIR}/.ssh ${USB_DIR}

# bootstrap (update bare repo)
cd ${USB_DIR}/bootstrap.git
git fetch ${HOME_DIR}/git/bootstrap/.git devel:devel

# pass (update bare repo)
cd ${USB_DIR}/password-store.git
git fetch ${HOME_DIR}/.password-store/.git monolith:monolith

# bah
# cd ${USB_DIR}/bah/.password-store
# git pull -f ${HOME_DIR}/.bah/.password-store

################################################
# How to convert regular git repo to bare repo #
################################################
# https://stackoverflow.com/questions/2199897/how-to-convert-a-normal-git-repository-to-a-bare-one

# tldr:
# - Rename .git folder inside regular git repo to repo.git
# - Move repo.git up a folder
# - Remove original repo's folder
# - cd in repo.git and run 'git config --bool core.bare true'
