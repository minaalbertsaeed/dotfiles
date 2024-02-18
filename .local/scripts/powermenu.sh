#!/bin/sh

# Outputting choices to rofi in dmenu mode
# if
choice=$(echo "exit\npoweroff\nreboot\nsuspend\nhibernate\nlogout" | dmenu -fn "$dmenufont" -p "Choose action: ")

["$choice" = "exit"] && exit 
[ "$choice" = "poweroff" ] && poweroff
[ "$choice" = "reboot" ] && reboot
[ "$choice" = "suspend" ] && systemctl suspend
[ "$choice" = "hibernate" ] && systemctl hibernate
[ "$choice" = "logout" ] && loginctl terminate-user "$USER" 
