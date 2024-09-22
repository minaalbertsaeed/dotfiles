#!/bin/dash
greenclip print | dmenu -i -l 15 -p "clipboard"  | xclip -sel clip

focused_window_name=$(xdotool getwindowname $(xdotool getactivewindow))
 
case "$focused_window_name" in
    *"Brave"*) 
        xdotool key Ctrl+v
    ;;
    *"st"*) 
        xdotool key Ctrl+Shift+p
    ;;
    *) 
    ;;
esac
