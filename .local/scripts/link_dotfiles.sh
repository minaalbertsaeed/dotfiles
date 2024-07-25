#!/bin/sh

set --  .config/neofetch \
        .config/nvim \
        .config/btop \
        .config/dunst \
        .config/lf \
        .config/loadkeysrc \
        .config/mpv \
        .config/nvim \
        .config/sxhkd \
        .config/tmux \
        .config/zathura \
        .config/mpv \
        .config/screenkey.json \
        .config/mimeapps.list \
        .config/greenclip.toml \
        .config/rofi \
        .local/scripts \
        .local/share/pkglist.txt \
        .local/share/foreign_pkglist.txt \
        .bashrc \
        .bash_profile \

# ln -s ~/repos/dotfiles/.config/neofetch ~/.config/neofetch
for program in "$@"; do
    path=$HOME/"$program"
    if [ -L "$path" ]; then
        echo "The symbolic link exists."
    else
        ln -s $DOTFILES/"$program" $HOME/"$program"
    fi
done
