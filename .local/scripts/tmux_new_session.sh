#!/bin/bash
dirs="$(find $HOME -type d | tr ' ' '\n')"
dir=$(echo "$dirs" | fzf)
session_name=$(basename $dir)
if [ -z "$dir" ]; then 
    exit 1
else
    tmux new-session -d -s "$session_name" -c "$dir" && tmux switch-client -t "$session_name" 
fi






