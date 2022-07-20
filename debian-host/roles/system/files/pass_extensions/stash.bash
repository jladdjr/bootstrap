#!/bin/bash

original_file=$1
encoded_file=$1.b64

/usr/bin/base64 $original_file > $encoded_file

password_path=digital/$(/usr/bin/basename $original_file)

# `-m` allows us to pipe in value to be stashed
pass insert -f -m $password_path < ${encoded_file} &> /dev/null

rm $encoded_file

