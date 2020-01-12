#!/bin/bash

FOLDER="test"
USER="user"
SERVER="server"
LOCAL_DIR="/home/"
DATE=$(date +%m.%Y)

#ssh-keygen -o -a 100 -t ed25519 если нужно добавить ключи
#ssh-copy-id $USER@$SERVER

TAR_COMMAND="tar -cf $FOLDER-$DATE.tar $FOLDER"
RM_COMMAND="rm $FOLDER-$DATE.tar"

echo "Архивирование"
ssh $USER@$SERVER "$TAR_COMMAND; exit"
echo "Копирование"
scp $USER@$SERVER:$FOLDER-$DATE.tar $LOCAL_DIR
echo "Удаление архива с сервера"
ssh $USER@$SERVER "$RM_COMMAND; exit"
