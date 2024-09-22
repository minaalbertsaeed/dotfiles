#!/bin/bash

# i use this script in my Xorg enviroment

# Set the output file name and path
output_file="$HOME/hdd/D/Mina/recordings/screencast_$(date +"%Y_%m_%d_%H_%M_%S").mkv"

# Set the screen size
start_recording() {
    # Use slop to get the geometry for the region to be recorded
    geometry=$(slop -f "%x %y %w %h")
    
    # Parse the geometry
    read -r x y width height <<< "$geometry"

    echo "Starting recording..."
    
    # Run ffmpeg with the selected region
    ffmpeg -f x11grab -video_size "${width}x${height}" -i :0.0+$x,$y \
           -f pulse -ac 2 -i alsa_output.pci-0000_05_00.6.analog-stereo.monitor \
           "$output_file" &
    pkill -RTMIN+22 dwmblocks

}

stop_recording() {
    echo "Stopping recording..."
    pkill ffmpeg
    pkill dwmblocks && dwmblocks & disown
}
process_name="ffmpeg"

if pgrep -x "$process_name" > /dev/null; then
    choice=$(printf "Yes\nNo" | dmenu -i -p "Stop Recording ?")

    if [ "$choice" = "Yes" ]; then
            stop_recording  
            exit 1
    fi
fi

start_recording


# pkill -RTMIN+22 dwmblocks
# ffmpeg -f x11grab -s "$screen_size" -i :0.0 -f alsa -i default -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"
