#!/bin/sh
test=`pgrep ffmpeg`

[ -n "$test" ] && printf "Recording"  

