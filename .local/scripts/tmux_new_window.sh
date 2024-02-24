#!/bin/sh

command=$1
TERMINAL="$TERMINAL"
# echo $TERM

xdotool key Alt+1
create_tmux_window(){
    [ -z "$command" ] && tmux neww || tmux neww "$command" 
    xdotool key Alt+1
}

if pidof -x "$TERMINAL" > /dev/null; then
    if pidof -x "tmux" > /dev/null; then
        create_tmux_window 
    else
        tmux && create_tmux_window 
    fi

else 
    if pidof -x "$TERMINAL" > /dev/null; then
        $TERMINAL -e tmux attach && create_tmux_window 
    else
        $TERMINAL -e tmux && create_tmux_window 
    fi
fi

# xdotool key Alt+1

