#!/bin/bash

sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist


## Reference
## https://wiki.archlinux.org/index.php/reflector

## Examples

## Verbosely rate and sort the five most recently synchronized mirrors by download speed, and overwrite the file /etc/pacman.d/mirrorlist:
# reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist


## Select the 200 most recently synchronized HTTP or HTTPS mirrors, sort them by download speed, and overwrite the file /etc/pacman.d/mirrorlist:
# reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist


## Select the HTTPS mirrors synchronized within the last 12 hours and located in the US, sort them by download speed, and overwrite the file /etc/pacman.d/mirrorlist:
# reflector --country 'United States' --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

