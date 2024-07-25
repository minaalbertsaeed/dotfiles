#!/bin/sh

set --  .conifg/neofetch \
        .conifg/nvim \
        .conifg/btop \
        .conifg/dunst \
        .conifg/lf \
        .conifg/loadkeysrc \
        .conifg/mpv \
        .conifg/nvim \
        .conifg/sxhkd \
        .conifg/tmux \
        .conifg/zathura \
        .conifg/mpv \
        .conifg/screenkey.json \
        .conifg/mimeapps.list \
        .conifg/greenclip.toml \
        .conifg/rofi \
        .bashrc \
        .bash_profile \
        .local/scripts \

# ln -s ~/repos/dotfiles/.config/neofetch ~/.config/neofetch
for program in "$@"; do
    path=$HOME/"$program"
    if [ -L "$path" ]; then
        echo "The symbolic link exists."
    else
        echo "ln -s $DOTFILES/"$program" $HOME/"$program""
    fi
done
