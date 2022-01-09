#!/bin/bash

password_path=$1
tmp_file=$(basename $1 | sed 's/\(.*\)_/\1\./')

# decrypt file
pass show digital/$1 | base64 --decode > $tmp_file
echo "decrypted file to $tmp_file"
read -p "Press Enter when finished.."

# update encrypted file if changed
echo "Has the file changed?"
read changed
if [[ "$changed" = y* ]]; then
	pass stash $tmp_file
fi

rm $tmp_file



