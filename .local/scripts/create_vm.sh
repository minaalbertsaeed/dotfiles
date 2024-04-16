#!/bin/sh

iso_images=" $(ls -l /home/mina/hdd/D/IsoImages/ | awk '{print $9}')"
selected_iso=$(echo "$iso_images" | dmenu -i -fn "$dmenufont" -p "Choose an Iso Image: ")
# echo $selected_iso
