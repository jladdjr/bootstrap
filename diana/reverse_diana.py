#!/usr/bin/env python3

import sys
from os import urandom


encrypted_file = 'blackhole.encrypted'
pad_file = 'pad.bin'
decrypted_file = 'blackhole_decrypted.jpg'

# open encrypted file
with open(encrypted_file, 'rb') as f:
    bytes = f.read()

# get pad
pad = urandom(len(bytes))
with open(pad_file, 'rb') as f:
    pad = f.read()

# decrypt file
with open(decrypted_file, 'wb') as f:
    int_data = int.from_bytes(bytes, sys.byteorder)
    int_pad = int.from_bytes(pad, sys.byteorder)
    int_decrypted = int_data ^ int_pad
    bytes_decrypted = int_decrypted.to_bytes(len(bytes), sys.byteorder)
    f.write(bytes_decrypted)
