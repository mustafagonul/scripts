#!/bin/bash

sudo qemu-system-x86_64 --enable-kvm -smp 2 -m 4G -soundhw all -drive file=/dev/sdb,format=raw,if=virtio


