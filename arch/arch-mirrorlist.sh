#!/bin/bash

set -x

cd /etc/pacman.d/

if [[ -f mirrorlist.pacnew ]]; then
  echo "/etc/pacman.d/mirrorlist.pacnew exists!"
  
  sudo rm mirrorlist
  sudo cp mirrorlist.pacnew mirrorlist
  sudo sed -i 's/^#Server/Server/' mirrorlist
fi

