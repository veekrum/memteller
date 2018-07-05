#!/bin/bash
#set -xe

NAME=$USER
cd ~/Downloads
git clone git@github.com:veekrum/memteller.git

cd memteller
chmod 755 *.sh

line="*/30 * * * * export DISPLAY=:0 && cd /home/$NAME/Downloads && ./memteller.sh > /tmp/cronerror.log 2>&1"
(/usr/bin/crontab -u $NAME -l; echo "$line" ) | /usr/bin/crontab -u $NAME -
