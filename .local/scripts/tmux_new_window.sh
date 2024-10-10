#!/bin/dash
command=$1
TERMINAL="$TERMINAL"

move_2_temrinal_tag(){
    xdotool key Alt+1
}

create_tmux_window(){
    current_path=$(tmux display -p '#{pane_current_path}')
    [ -z "$command" ] && tmux neww -c $current_path || tmux neww -c current_path "$command" 
}

if pidof -x "$TERMINAL" > /dev/null; then
    if pidof -x "tmux" > /dev/null; then
        move_2_temrinal_tag
        create_tmux_window 
    else
        move_2_temrinal_tag
        tmux && create_tmux_window 
    fi

else 
    if pidof -x "tmux" > /dev/null; then
        move_2_temrinal_tag
        $TERMINAL -e tmux attach &&  create_tmux_window
    else
        move_2_temrinal_tag
        $TERMINAL -e tmux && create_tmux_window 
    fi
fi


