doas loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export BROWSER="brave"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export PDFVIEWER="sioyek"
export dmenufont="Iosevka Term Nerd Font :style=Medium:size=11"    
export TERMINAL="st"
export TERM="st"
export TERM_PROGRAM="st"
export CM_LAUNCHER="dmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH="$PATH:$HOME/.local/bin/"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#ffffff,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#89B4FA,hl+:#89B4FA,info:#afaf87,marker:#87ff00
  --color=pointer:#89B4FA
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

[ $(tty) = "/dev/tty1" ] && startx


