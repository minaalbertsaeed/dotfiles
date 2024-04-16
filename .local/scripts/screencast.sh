#!/bin/bash

# i use this script in my Xorg enviroment

# Set the output file name and path
output_file="/mnt/D/Mina/recordings/screencast_$(date +"%Y_%m_%d_%H_%M_%S").mkv"

# Set the screen size
start_recording() {
    screen_size="$(xdpyinfo | grep dimensions | awk '{print $2;}')"
    echo "Starting recording..."
    ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default "$output_file"
}

stop_recording() {
    echo "Stopping recording..."
    killall ffmpeg
    pkill -RTMIN+15 dwmblocks
}

process_name="ffmpeg"

if pgrep -x "$process_name" > /dev/null; then
    choice=$(printf "Yes\nNo" | dmenu -i -fn "$dmenufont" -p "Stop Recording ?")

    if [ "$choice" = "Yes" ]; then
            # pkill -RTMIN+15 dwmblocks
            stop_recording  
            # pkill -RTMIN+15 dwmblocks
    fi

else
    start_recording &
fi

echo "$screen_size"
echo "$screen_size"
echo "$screen_size"
echo "$screen_size"
echo "$screen_size"
# Record the screen with ffmpeg

pkill -RTMIN+15 dwmblocks
# ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"

