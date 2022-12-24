#!/bin/bash

pass git fetch jeeves
pass git rebase jeeves/main
pass git push --force-with-lease jeeves revolution
pass git push --force-with-lease jeeves revolution:main
