#!/bin/bash

hyprctl dispatch workspace 1

# st running
if pidof -x "st" > /dev/null; then
    # tmux already running
    if pidof -x "tmux" > /dev/null; then
        tmux neww 
    else
        tmux
    fi

else 

    if pidof -x "tmux" > /dev/null; then
        st -e tmux attach 
    else
        st -e tmux
    fi
fi
