#!/bin/bash
mkdir ~/Library/LaunchAgents
mkdir ~/.msgprotect/
cp ./control.plist ~/Library/LaunchAgents
cp ./control.applescript ~/.msgprotect
cp ./uninstall.sh ~/.msgprotect
cp ./encrypt.sh ~/.msgprotect
cp ./decrypt.sh ~/.msgprotect
ssh-keygen -f ~/.msgprotect/id_rsa -q -N ""
