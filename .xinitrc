dbus-update-activation-environment --all
setxkbmap -layout us,ara -variant ,digits -option grp:ctrl_space_toggle caps:escape
# xrandr --setprovideroutputsource modesetting NVIDIA-0 & 
sxhkd & 
picom &
xwallpaper --zoom $(find $HOME/Pictures/wallpapers -type f | shuf -n 1)
greenclip daemon & 
dwmblocks & 
dwm
