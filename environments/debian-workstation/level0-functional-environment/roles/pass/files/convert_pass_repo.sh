#!/bin/bash

# Rename bare repo folder to .git
cd ~/.password-store
mv password-store.git .git

# Disable bare repo setting
cd .git
sed -i 's/bare = true/bare = false/' config

# Restore files in full repo
cd ..
git reset --hard HEAD
