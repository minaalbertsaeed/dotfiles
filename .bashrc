
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
# alias vi='vim'
alias vim='nvim'
alias lf='lfub'
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias intel='/mnt/D/badApps/idea-IU-233.11799.300/bin/idea.sh'
alias pickcolor='xcolor -s'
export EDITOR="nvim"
export dmenufont="JetBrains Mono Nerd Font:size=10"    
export TERMINAL="st"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:/home/mina/.local/bin/"
# export PATH="$HOME/.local/bin:$PATH"
PS1='\[\e[32m\]\w \[\e[0m\]>\[\e[0m\] '

set -o vi

