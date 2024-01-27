
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias cs='clear'

# Pacman Package Manager Aliases
alias i='sudo pacman -S'
alias r='sudo pacman -R'
alias q='sudo pacman -Q'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Ss'
alias za='zathura'
alias vim='nvim'
alias lf='lfub'
alias llf='lfub -config .config/lf_for_dwm/lf/lfrc'
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias pickcolor='xcolor -s'
alias freee='~/.local/bin/scripts/free.sh'
# alias discord='WebCord-4.6.1-x64.AppImage'
export EDITOR="nvim"
export XDG_SESSION_TYPE=wayland
export dmenufont="JetBrains Mono Nerd Font:size=10"    
export TERMINAL="st"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export PATH="$PATH:/home/mina/.local/bin/:/home/mina/.cargo/bin"
# export PATH="$HOME/.local/bin:$PATH"
PS1='\[\e[32m\]\w \[\e[0m\]>\[\e[0m\] '

set -o vi

