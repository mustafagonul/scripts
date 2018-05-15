#!/bin/bash

# Delete system packages installed by pacman
sudo rm /var/cache/pacman/pkg/*

# Delete user packages installed by pacaur
sudo rm -R $HOME/.cache/pacaur/*

