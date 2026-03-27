#!/usr/bin/env python3
"""Secure password generator - Ayoub Ghodhbane"""
import secrets
import string
import sys

def generate_password(length=16, use_special=True):
    chars = string.ascii_letters + string.digits
    if use_special:
        chars += string.punctuation
    while True:
        password = ''.join(secrets.choice(chars) for _ in range(length))
        if (any(c.islower() for c in password)
            and any(c.isupper() for c in password)
            and any(c.isdigit() for c in password)):
            if not use_special or any(c in string.punctuation for c in password):
                return password

if __name__ == '__main__':
    length = int(sys.argv[1]) if len(sys.argv) > 1 else 16
    count = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    print(f'Generating {count} passwords (length: {length}):')
    for i in range(count):
        print(f'  {i+1}. {generate_password(length)}')