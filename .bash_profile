sudo loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export DISCORD="equibop"
export BROWSER="brave"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export dmenufont="JetBrains Mono Nerd Font:size=10"    
export TERMINAL="st"
export TERM="st"
export CM_LAUNCHER="dmenu"
export CM_DIR="$HOME/.cache/clipmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.local/bin/:$HOME/repos/tmuxifier/bin"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#ffffff,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#0ad85e,hl+:#0ad85e,info:#afaf87,marker:#87ff00
  --color=prompt:#ffffff,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="❯❯ "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

[ $(tty) = "/dev/tty1" ] && startx


