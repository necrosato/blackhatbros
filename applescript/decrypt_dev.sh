#!/bin/bash
PASS="630c4eac2642b0562b2f20548b0ae450"
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

AFOLDS=(`ls ${DPATH}`)
AFN=${#AFOLDS[@]}

for (( i=0; i<${AFN}; i++));
do
    echo "${AFOLDS[i]}"
    ENC=(`ls ${DPATH}/*/*.enc`)
done
    



#openssl enc -aes-256-cbc -d -in file.txt.enc -out file.txt -k $PASS
