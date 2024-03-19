#!/bin/bash

# destination
#!/bin/bash

# Define an array of paths
#!/bin/bash
DEstination="~/repos/dotfiles/"
# Define an array of paths
paths_list=(
    "~/.local/scripts/"
    "~/.bashrc/"
    "~/.bash_profile/"
    "~/.xinitrc/"
    "~/src/"
)

configs_to_backup=(
    "~/.config/lf"
    "~/.config/dunst"
    "~/.config/hypr"
    "~/.config/kitty"
    "~/.config/alacritty"
    "~/.config/joshuto"
    "~/.config/neofetch"
    "~/.config/loadkeysrc"
    "~/.config/rofi"
    "~/.config/nvim"
    "~/.config/tmux"
    "~/.config/waybar"
    "~/.config/zathura"
    "~/.config/mimeapps.list"
    "~/.config/screenkey.json"

)
# Iterate over paths and print them
for path in "${paths_list[@]}"; do
    eval expanded_path=$path
    # echo "$expanded_path"
done

for path in "${configs_to_backup[@]}"; do
    eval expanded_path="mv $path "
    # echo "$expanded_path"
done

