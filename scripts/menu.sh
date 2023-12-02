#!/bin/bash


choice=$(echo -e "lf\nthunar" | dmenu -fn "$dmenufont" )

if [[ "$choice" = "lf" ]]; then
    st -e lf 
elif [[ "$choice" = "thunar" ]]; then
    thunar
fi

