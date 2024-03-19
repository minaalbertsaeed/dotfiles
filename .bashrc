

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd 
stty -ixon
HISTSIZE=-1
HISTFILESIZE=-1

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -la'
alias grep='grep --color=auto'
alias cs='clear'

# Pacman Aliases
alias i='sudo pacman -S'
alias r='sudo pacman -Rns'
alias q='sudo pacman -Qs'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Ss'

alias za='zathura'
alias vim='nvim'
alias lf='lfub'
alias fi='find | fzf | xargs -r xdg-open'
# alias llf='lfub -config .config/lf_for_dwm/lf/lfrc'
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias pickcolor='xcolor -s'
# alias freee='~/.local/bin/free'
alias jo='joshuto'


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

fzf_history(){
    bash -c "$(cat ~/.bash_history | fzf --height=40%)"
}

bind -m emacs-standard -x '"\C-r": fzf_history'
bind -m vi-command -x '"\C-r": fzf_history'
bind -m vi-insert -x '"\C-r": fzf_history'

export PS1="\[\e[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] > "

set -o vi

