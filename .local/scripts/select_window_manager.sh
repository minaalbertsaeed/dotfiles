#!/bin/bash
echo "1 --> for Hyprland"
echo "2 --> for dwm"
printf "Enter 1 or 2: "; read choice

[[ "$choice" = "1" ]] && Hyprland
[[ "$choice" = "2" ]] && startx
