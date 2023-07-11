#!/usr/bin/env python3

import sys
from os import urandom


test_file = 'blackhole.jpg'
encrypted_file = 'blackhole.encrypted'
pad_file = 'pad.bin'

# open original file
with open(test_file, 'rb') as f:
    bytes = f.read()

# create pad
pad = urandom(len(bytes))
with open(pad_file, 'wb') as f:
    f.write(pad)

# create encrypted file
with open(encrypted_file, 'wb') as f:
    int_data = int.from_bytes(bytes, sys.byteorder)
    int_pad = int.from_bytes(pad, sys.byteorder)
    int_enc = int_data ^ int_pad
    bytes_enc = int_enc.to_bytes(len(bytes), sys.byteorder)
    f.write(bytes_enc)
