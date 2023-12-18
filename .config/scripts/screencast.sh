#!/bin/bash

# Set the output file name and path
output_file="screencast_$(date +"%Y%m%d_%H%M%S").mkv"

# Set the screen size
screen_size="$(xdpyinfo | grep dimensions | awk '{print $2;}')"

touch /tmp/record 
# Record the screen with ffmpeg
ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default "$output_file"
# ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"
#

echo "Recording finished. Output saved to: $output_file"


