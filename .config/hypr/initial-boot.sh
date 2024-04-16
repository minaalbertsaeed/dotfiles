#!/bin/bash
#
# Variables
scriptsDir=$HOME/.config/hypr/scripts
wallpaper=$HOME/Pictures/wallpapers/Fantasy-Landscape.png

swww="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"

# Check if a marker file exists.
if [ ! -f ~/.config/hypr/.initial_startup_done ]; then

    # Initialize pywal and wallpaper
	if [ -f "$wallpaper" ]; then
		# wal -i $wallpaper -s -t > /dev/null 
		swww init && $swww $wallpaper $effect
	fi
     
    # Create a marker file to indicate that the script has been executed.
    touch ~/.config/hypr/.initial_startup_done

    exit
fi
