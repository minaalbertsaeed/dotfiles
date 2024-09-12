#!/bin/sh
DOTFILES="$HOME/repos/dotfiles"
dirs=(  
        ".config/neofetch/"
        ".config/nvim/"
        ".config/dunst/"
        ".config/lf/"
        ".config/loadkeysrc/"
        ".config/mpv/"
        ".config/nvim/"
        ".config/sxhkd/"
        ".config/tmux/"
        ".config/zathura/"
        ".config/mpv/"
        ".config/rofi/"
        ".local/scripts/"
     )
files=(
        ".local/share/pkglist.txt"
        ".local/share/foreign_pkglist.txt"
        ".config/screenkey.json"
        ".config/mimeapps.list"
        ".config/greenclip.toml"
        ".bashrc"
        ".bash_profile"
      )
         
#ln -s ~/repos/dotfiles/.config/neofetch ~/.config/neofetch
for dir in "${dirs[@]}"; do
    rm -rf $HOME/$dir
    mkdir $HOME/$dir
    echo "--> Executing ln -s $DOTFILES/$dir $HOME/$dir"
    ln -s $DOTFILES/$dir $HOME/$dir
done

for file in "${files[@]}"; do
    rm -rf $HOME/$file
    echo "--> Executing ln -s $DOTFILES/$file $HOME/$file"
    echo "ln -s $DOTFILES/$file $HOME/$file"
done
