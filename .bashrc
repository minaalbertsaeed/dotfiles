shopt -s autocd 
shopt -s histappend
stty -ixon
stty quit '^q'
HISTSIZE=100000000
HISTFILESIZE=100000000
HISTFILE=~/.bash_history
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
HISTCONTROL=ignoredups

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cs='clear'
alias du='du -sh'
alias vim='nvim'


# Pacman Aliases
alias i='sudo pacman -S'
alias r='sudo pacman -Rns'
alias q='sudo pacman -Qs'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Si'

# yay Aliases
alias yi='yay -S'
alias ycc='yay -Scc'
alias yq='yay -Qs'
alias yu='yay -Syu'
alias ys='yay -Ss'

alias lf='lfub'
alias fi='find | fzf --header="Jump to location" --preview="bat -f {}" --border| xargs -r xdg-open'
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'


alias dot='cd $REPOS/dotfiles/'
alias pkgs='tmux neww "nvim $HOME/.local/share/pkglist.txt" '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

fzf_history(){
    local selected_command=$(tac ~/.bash_history | fzf --height=40% --border)
    READLINE_LINE="${READLINE_LINE:+$READLINE_LINE }$selected_command"
    READLINE_POINT=${#READLINE_LINE}
}

fzf_cd() {
    local selected_dir=$(find "$HOME" -type d | fzf --height=50% --border)
    cd "$selected_dir" && echo "cd $selected_dir"
}  

bind -m emacs-standard -x '"\C-r": fzf_history'
bind -m vi-command -x '"\C-r": fzf_history'
bind -m vi-insert -x '"\C-r": fzf_history'

bind -m emacs-standard -x '"\C-o": fzf_cd'
bind -m vi-command -x '"\C-o": fzf_cd'
bind -m vi-insert -x '"\C-o": fzf_cd'

export PS1="\n\[\e[32m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[37m\] \n❯❯ "

set -o vi
