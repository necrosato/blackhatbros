#!/bin/bash
PRIVKEY=~/Documents/CIS/433project/applescript/id_rsa
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


find ./* -iname "*.ichat.enc" | while read f
do    
    KEY=keys/$(basename "${f%.*}").key
    openssl rsautl -decrypt -ssl -inkey "${PRIVKEY}" -in "${KEY}.enc" -out "${KEY}" #decrypt key
    openssl enc -aes-256-cbc -d -in "${f}" -out "${f%.*}" -k file:"${KEY}"
    rm "$KEY" #delete plaintext key
    rm "${KEY}.enc" #delete encrypted key
    rm "${f}" #delete encrypted archive
done

