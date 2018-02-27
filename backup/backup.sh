#!/bin/bash

DATE=`date +%Y-%m-%d_%H-%M-%S`

sudo mkdir /mnt/$DATE

sudo rsync -aAX --info=progress2 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /mnt/$DATE
