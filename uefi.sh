#!/bin/bash

efibootmgr -c -d /dev/sda -p 1 -l /EFI/syslinux/syslinux.efi -L "Syslinux"
