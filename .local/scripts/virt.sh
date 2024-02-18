#!/bin/sh
#
# IsoImages=$(ls /mnt/D/OSs/)

# get all disk images
DiskImages=$(ls ~/vms/)

diskImage=$(echo  "$DiskImages" | dmenu -fn "$dmenufont" -i -p "Choose a Disk Image:")

command="qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2-ovmf/x64/OVMF.fd -boot menu=on -drive file=vms/"$diskImage" -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on "

eval "$command"


# qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2-ovmf/x64/OVMF.fd -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 
# qemu-system-x86_64 -enable-kvm -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void_linux.img -m 3G -cpu host -smp 4 -vga qxl -display sdl,gl=on

