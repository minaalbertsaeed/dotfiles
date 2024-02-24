#!/bin/sh

# Outputting choices to rofi in dmenu mode
choice=$(echo "exit\npoweroff\nreboot\nsuspend\nlogout" | dmenu -i -fn "$dmenufont" -p "Choose action: ")

[ $choice = "exit" ] && exit 
[ $choice = "poweroff" ] && poweroff
[ $choice = "reboot" ] && reboot
[ $choice = "suspend" ] && systemctl suspend
# [ $choice = "hibernate" ] && systemctl hibernate
[ $choice = "logout" ] && loginctl terminate-user "$USER" 
