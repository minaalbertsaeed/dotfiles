#!/bin/bash

# Set the output directory
output_dir="recordings"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Generate the output filename with the current date
current_date=$(date +"%Y-%m-%d_%H-%M-%S")
output_file="$output_dir/recorded_video_$current_date.mp4"

start_recording() {
    echo "Starting recording..."
    wf-recorder -f  "$output_file" -g "$(slurp)"
}

stop_recording() {
    echo "Stopping recording..."
    pkill -f wf-recorder
}

case "$1" in
    start)
        start_recording
        ;;
    stop)
        stop_recording
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0

