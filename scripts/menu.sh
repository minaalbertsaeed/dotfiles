#!/bin/bash


choice=$(echo -e "lf\nthunar" | dmenu -fn "$dmenufont" )

if [[ "$choice" = "lf" ]]; then
    st -e lf -config .config/lf_for_dwm/lf/lfrc
elif [[ "$choice" = "thunar" ]]; then
    thunar
fi

