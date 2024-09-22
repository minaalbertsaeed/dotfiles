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
alias vim='nvim'
alias neo='fastfetch'
alias t='tmux'


# Pacman Aliases
alias i='doas pacman -S'
alias r='doas pacman -Rns'
alias q='doas pacman -Qs'
alias u='doas pacman -Syu'
alias s='doas pacman -Ss'

# yay Aliases
alias yi='yay -S'
alias ycc='yay -Scc'
alias yq='yay -Qs'
alias yu='yay -Syu'
alias ys='yay -Ss'

alias lf='lfub'
 
goto(){
    local file=$(find . | fzf --reverse --header="Jump to location" --border --height=50% )
    [ -d "$file" ] && cd $file || cd $(dirname "$file")
}

alias ff=goto
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias dot='cd $REPOS/dotfiles/'
alias pkgs='tmux neww "nvim $HOME/.local/share/pkglist.txt" '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

fzf_history(){
    local selected_command=$(tac ~/.bash_history | fzf --reverse --height=40% --border)
    READLINE_LINE="${READLINE_LINE:+$READLINE_LINE }$selected_command"
    READLINE_POINT=${#READLINE_LINE}
}

fzf_dir() {
    local selected_dir=$(find "$HOME" -type d | fzf --reverse --height=50% --border)
    cd "$selected_dir" && echo "cd $selected_dir"
}  

bind -m emacs-standard -x '"\C-r": fzf_history'
bind -m vi-command -x '"\C-r": fzf_history'
bind -m vi-insert -x '"\C-r": fzf_history'

bind -m emacs-standard -x '"\C-o": fzf_dir'
bind -m vi-command -x '"\C-o": fzf_dir'
bind -m vi-insert -x '"\C-o": fzf_dir'

export PS1="\n\[\e[32m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[37m\] \n❯❯ "

set -o vi
