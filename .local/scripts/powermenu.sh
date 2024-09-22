#!/bin/sh

# Outputting choices to rofi in dmenu mode
if pgrep -x "Hyprland" > /dev/null; then
    choice=$(printf "suspend\npoweroff\nreboot\nlogout" | ~/.config/rofi/scripts/launcher_t1 )
else
    choice=$(printf "suspend\npoweroff\nreboot\nlogout" | dmenu -i -p "Choose action: ")
fi

[ "$choice" = "exit"  ] && exit 
[ "$choice" = "poweroff" ] && doas poweroff
[ "$choice" = "reboot" ] && doas reboot
[ "$choice" = "suspend" ] && doas systemctl suspend
[ "$choice" = "logout" ] && doas loginctl terminate-user "$USER" 
