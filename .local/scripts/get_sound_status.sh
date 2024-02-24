#!/bin/sh
muted_or_not=$(pactl list sinks | grep -A 10 'Sink #' | grep 'Mute:' | awk '{print $2}')

[ $muted_or_not = "yes" ] && printf "MUTED"
[ $muted_or_not = "no" ] && printf "%s" "$(pactl list sinks | grep -A 10 'Sink #' | grep 'Volume:' | grep -v 'Base' | awk '{print $5}' )" 

