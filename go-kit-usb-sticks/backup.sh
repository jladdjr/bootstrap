#!/bin/bash

set -x

rsync -avz --delete --info=progress2 /home/jim/.password-store /media/jim/ALPHA/
rsync -avz --delete --info=progress2 /home/jim/git/bootstrap /media/jim/ALPHA
rsync -avz --delete --info=progress2 /home/jim/.ssh /media/jim/ALPHA/

