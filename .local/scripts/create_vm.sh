#!/bin/sh

iso_images=" $(ls -l /home/mina/hdd/D/IsoImages/ | awk '{print $9}')"

echo "$iso_images" 

printf "$selected_iso\n"

selected_format=$(echo "" | dmenu -i -fn "$dmenufont" -p "Enter your format: ")

printf "$selected_format\n"
selected_format=$(echo "" | dmenu -i -fn "$dmenufont" -p "Enter your format: ")

printf "$selected_format\n"
# echo $selected_iso
