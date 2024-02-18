sudo loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export dmenufont="JetBrains Mono Nerd Font:size=10"    
export TERMINAL="st"
export CM_LAUNCHER=dmenu
export CM_DIR="/home/mina/.cache/clipmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export PATH="$PATH:/home/mina/.local/bin/:/home/mina/.cargo/bin"

[ $(tty) = "/dev/tty1" ] && startx

