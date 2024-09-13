#!/bin/sh
DOTFILES="$HOME/repos/dotfiles"
dirs=(  
        ".config/fastfetch"
        ".config/nvim"
        ".config/dunst"
        ".config/lf"
        ".config/loadkeysrc"
        ".config/mpv"
        ".config/nvim"
        ".config/sxhkd"
        ".config/tmux"
        ".config/zathura"
        ".config/mpv"
        ".config/rofi"
        ".local/scripts"
        ".local/bin"
     )
files=(
        ".local/share/pkglist.txt"
        ".local/share/foreign_pkglist.txt"
        ".config/screenkey.json"
        ".config/mimeapps.list"
        ".config/greenclip.toml"
        ".bashrc"
        ".bash_profile"
        ".xinitrc"
      )
         
#ln -s ~/repos/dotfiles/.config/fastfetch ~/.config/fastfetch
for dir in "${dirs[@]}"; do
    echo "--> Executing rm -rf "$HOME/$dir""
    rm -rf "$HOME/$dir"
    echo "--> Executing ln -s $DOTFILES/$dir $HOME/$dir"
    ln -s $DOTFILES/$dir $HOME/$dir
    echo ""
done

for file in "${files[@]}"; do
    echo "--> Executing rm -rf $HOME/$file"
    rm -rf "$HOME/$file"
    echo "--> Executing ln -s $DOTFILES/$file $HOME/$file"
    ln -s $DOTFILES/$file $HOME/$file
done
