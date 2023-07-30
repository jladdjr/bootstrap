# First Steps

Welcome to your new Debian 12 system!

## You need sudo

1. Switch to root with `su -` (remember, you don't have sudo yet)
2. `visudo` isn't in the default path, so run `/usr/sbin/visudo`
3. To make things easier, use `export EDITOR=vim` first.

## Install bootstrapping requirements

Now install the basic utilities needed to proceed with boostrapping:
`bash ./install_requirements.sh`
