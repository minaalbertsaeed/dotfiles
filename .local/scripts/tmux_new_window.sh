#!/bin/sh

command=$1

create_tmux_window(){
    [ -z "$command" ] && tmux neww || tmux neww "$command" 
    # xdotool key Alt+1
}

if pidof -x "st" > /dev/null; then

    if pidof -x "tmux" > /dev/null; then
        create_tmux_window 
    else
        tmux && create_tmux_window 
 
    fi

else 
    if pidof -x "tmux" > /dev/null; then
        st -e tmux attach && create_tmux_window 
    else
        st -e tmux && create_tmux_window 
    fi
fi

xdotool key Alt+1

