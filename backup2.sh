#!/bin/bash

if [ "$1" != "def" ]; then
  echo -n "Folder on remote server for backup: "
  read FOLDER
  echo -n "SSH user: "
  read USER
  echo -n "Server ip: "
  read SERVER
  echo -n "$USER:$SERVER/$FOLDER Start script? (y/n) "
  if [ "$FLAG" != "y" ]; then
    echo 'exit'
    exit 0
  fi
else
  FOLDER=""
  USER=""
  SERVER=""
fi

DATE=$(date +%m.%Y)
LDIR=$(pwd)

#ssh-keygen -o -a 100 -t ed25519 если нужно добавить ключи
#ssh-copy-id $USER@$SERVER

TAR_COMMAND="tar -cf $FOLDER-$DATE.tar $FOLDER"
RM_COMMAND="rm $FOLDER-$DATE.tar"

echo -n "Archiving.. "
ssh $USER@$SERVER "$TAR_COMMAND; exit"
echo -n "Copy archive.. "
scp $USER@$SERVER:$FOLDER-$DATE.tar $LDIR
echo -n "Delete archive from $FOLDER"
ssh $USER@$SERVER "$RM_COMMAND; exit"
