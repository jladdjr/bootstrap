#!/usr/bin/env bash

# Copied from
# https://opensource.com/article/17/10/backing-your-machines-borg
# by Christopher Aedo
#
# who originally copied it from the Borg quick start docs at
# https://borgbackup.readthedocs.io/en/stable/quickstart.html

#REPOSITORY=borg@jeeves:/var/services/homes/borg/repo
REPOSITORY=ssh://borg@jeeves:2918/var/services/homes/borg/repo

#Bail if borg is already running, maybe previous run didn't finish
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit
fi

# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='FIXME'
# or this to ask an external program to supply the passphrase:
# export BORG_PASSCOMMAND='pass show backup'

# Backup all of /home and /var/www except a few
# excluded directories
borg create -p -v --stats                       \
    -e /home/jim/Downloads                      \
    -e /home/jim/backups/20230710_revolution_refresh \
    -e /home/jim/.mozilla                       \
    -e /home/jim/.config                        \
    -e /home/jim/audacity                       \
    -e /home/jim/.cache                         \
    -e /home/jim/.emacs.d/straight              \
    -e /home/jim/skip_backup                    \
    $REPOSITORY::'{hostname}2-{now:%Y-%m-%d}'   \
    /home/jim

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}2-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
