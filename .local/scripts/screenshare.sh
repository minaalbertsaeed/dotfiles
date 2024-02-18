#!/bin/bash

# Set the output directory
output_dir="/mnt/D/Mina/recordings"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Generate the output filename with the current date
current_date=$(date +"%Y-%m-%d_%H-%M-%S")
output_file="$output_dir/recorded_video_$current_date.mp4"

start_recording() {
    echo "Starting recording..."
    wf-recorder -a -f  "$output_file" -g "$(slurp)"
}

stop_recording() {
    echo "Stopping recording..."
    pkill -f wf-recorder
}

process_name="wf-recorder"

if pgrep -x "$process_name" > /dev/null; then
    choice=$(echo -e "stop recording" | rofi -dmenu  -p "Choose action: ")

    if [ "$choice" = "stop recording" ]; then
            stop_recording
    fi

else
    start_recording
fi
exit 0

