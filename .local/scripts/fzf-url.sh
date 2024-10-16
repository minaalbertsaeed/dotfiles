#!/bin/bash

open_url() {
    for url in "$@" ; do
        if hash xdg-open &>/dev/null; then
            nohup xdg-open "$url" &>/dev/null &
        elif hash open &>/dev/null; then
            nohup open "$url" &>/dev/null &
        elif [[ -n $BROWSER ]]; then
            nohup "$BROWSER" "$url" &>/dev/null &
        fi
    done 
    xdotool key Alt+2
}

pane_content="$(tmux capture-pane -J -p -e -S -)"

urls=$(echo "$pane_content" |grep -oE '(https?|ftp|file):/?//[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]')
wwws=$(echo "$pane_content" |grep -oE '(http?s://)?www\.[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}(/\S+)*' | grep -vE '^https?://' |sed 's/^\(.*\)$/http:\/\/\1/')
ips=$(echo "$pane_content" |grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{1,5})?(/\S+)*' |sed 's/^\(.*\)$/http:\/\/\1/')
gits=$(echo "$pane_content" |grep -oE '(ssh://)?git@\S*' | sed 's/:/\//g' | sed 's/^\(ssh\/\/\/\)\{0,1\}git@\(.*\)$/https:\/\/\2/')
gh=$(echo "$pane_content" |grep -oE "['\"]([_A-Za-z0-9-]*/[_.A-Za-z0-9-]*)['\"]" | sed "s/['\"]//g" | sed 's#.#https://github.com/&#')

# if [[ $# -ge 1 && "$1" != '' ]]; then
#     extras=$(echo "$pane_content" |eval "$1")
# fi

items=$(printf '%s\n' "${urls[@]}" "${wwws[@]}" "${gh[@]}" "${ips[@]}" "${gits[@]}" "${extras[@]}" |
    grep -v '^$' |
    sort -u |
    nl -w3 -s '  '
)

[ -z "$items" ] && tmux display 'tmux-fzf-url: no URLs found' && exit
selected_urls=$(echo "$items" | awk '{print $2}' | fzf)

echo $selected_urls | xclip -selection clipboard

notify-send $selected_urls


[ -z "$selected_urls" ] && exit 
open_url "$selected_urls"
