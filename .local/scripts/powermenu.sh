#!/bin/sh

# Outputting choices to rofi in dmenu mode
if pgrep -x "Hyprland" > /dev/null; then
    choice=$(printf "exit\npoweroff\nreboot\nsuspend\nlogout" | ~/.config/rofi/scripts/launcher_t1 )
else
    choice=$(printf "exit\npoweroff\nreboot\nsuspend\nlogout" | dmenu -i -fn "$dmenufont" -p "Choose action: ")
fi

[ "$choice" = "exit"  ] && exit 
[ "$choice" = "poweroff" ] && doas poweroff
[ "$choice" = "reboot" ] && doas reboot
[ "$choice" = "suspend" ] && doas systemctl suspend
[ "$choice" = "logout" ] && doas loginctl terminate-user "$USER" 
