#!/bin/bash
#
# IsoImages=$(ls /mnt/D/OSs/)

# get all disk images
DiskImages=$(ls ~/vms/)

# isoImage=$(echo -e "$IsoImages" | dmenu -fn "$dmenufont" -i -p "Choose an Iso Image:")
diskImage=$(echo -e "$DiskImages" | dmenu -fn "$dmenufont" -i -p "Choose a Disk Image:")

command="qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=vms/"$diskImage" -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on "

eval "$command"

