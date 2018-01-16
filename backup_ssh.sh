#!/bin/bash

DATE=`date +%Y-%m-%d_%H-%M-%S`
REMOTE_IP="192.168.1.21"
REMOTE_USER="mustafa"
REMOTE_DIR="/Data/Public/backup"

ssh $REMOTE_USER@$REMOTE_IP "mkdir $REMOTE_DIR/$DATE"

sudo rsync -aAX --info=progress2 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} -e ssh / $REMOTE_USER@$REMOTE_IP:$REMOTE_DIR/$DATE
