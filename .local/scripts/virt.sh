#!/bin/sh
#
# IsoImages=$(ls /mnt/D/OSs/)

# get all disk images
DiskImages=$(ls ~/vms/)

diskImage=$(echo  "$DiskImages" | dmenu -fn "$dmenufont" -i -p "Choose a Disk Image:")

qemu-system-x86_64 \
    -enable-kvm \
    -bios /usr/share/edk2-ovmf/x64/OVMF.fd \
    -boot menu=on \
    -drive file=vms/"$diskImage" \
    -m 2G \
    -cpu host \
    -smp 4 \
    -vga virtio \
    -display sdl,gl=on \
    -chardev socket,path=/tmp/port1,server=on,wait=off,id=port1-char \
    -device virtio-serial \
    -device virtserialport,id=port1,chardev=port1-char,name=mina-ssh \
    -net user,hostfwd=tcp::10022-:22 \
    -net nic \
# qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2-ovmf/x64/OVMF.fd -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 

