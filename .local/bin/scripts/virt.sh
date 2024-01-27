#!/bin/bash
#
# IsoImages=$(ls /mnt/D/OSs/)

# get all disk images
DiskImages=$(ls ~/vms/)

# isoImage=$(echo -e "$IsoImages" | dmenu -fn "$dmenufont" -i -p "Choose an Iso Image:")
diskImage=$(echo -e "$DiskImages" | rofi -dmenu  -p "Choose a Disk Image:")

command="qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=vms/"$diskImage" -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on "

eval "$command"


# qemu-system-x86_64 -enable-kvm -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=vms/test.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 
