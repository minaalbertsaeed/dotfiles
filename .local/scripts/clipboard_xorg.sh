#!/bin/sh
greenclip print | dmenu -i -l 20 -p clipboard | xargs -r -d'\n' -I '{}' greenclip print '{}'
