#!/bin/sh

# i use this script in my Xorg enviroment

# Set the output file name and path
output_file="/mnt/D/Mina/recordings/screencast_$(date +"%Y_%m_%d_%H_%M_%S").mkv"

# Set the screen size
screen_size="$(xdpyinfo | grep dimensions | awk '{print $2;}')"


# Record the screen with ffmpeg
ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default "$output_file" & 

# pkill -RTMIN+15 dwmblocks
# ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"

