sudo loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export REPOS="$HOME/repos"
export dmenufont="JetBrains Mono Nerd Font:size=10"    
export TERMINAL="st"
export TERM="st"
export CM_LAUNCHER="dmenu"
export CM_DIR="$HOME/.cache/clipmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export PATH="$PATH:$HOME.local/bin/:/home/mina/repos/tmuxifier/bin"

[ $(tty) = "/dev/tty1" ] && startx


