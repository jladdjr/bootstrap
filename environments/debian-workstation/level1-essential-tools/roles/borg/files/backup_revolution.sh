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
export BORG_PASSPHRASE='JLADD_BORG_PASSPHRASE'
# or this to ask an external program to supply the passphrase:
# export BORG_PASSCOMMAND='pass show backup'

# Backup all of /home and /var/www except a few
# excluded directories
borg create -p -v --stats                       \
    $REPOSITORY::'{hostname}2-{now:%Y-%m-%d}'    \
    /home/jim/.bah                              \
    /home/jim/.bash_history                     \
    /home/jim/org                               \
    /home/jim/latex                             \
    /home/jim/ledger                            \
    /home/jim/books                             \
    /home/jim/.chomp                            \
    /home/jim/.config                           \
    /home/jim/backup                            \
    /home/jim/gimp                              \
    /home/jim/.plover_ninja                     \
    /home/jim/git/meds                          \
    /home/jim/git/house                         \
    /home/jim/git/8up-zine                      \
    /home/jim/git/short_stories                 \
    /home/jim/git/brothers_ladd_game/           \
    /home/jim/git/quarterly_goals/              \

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}2-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
