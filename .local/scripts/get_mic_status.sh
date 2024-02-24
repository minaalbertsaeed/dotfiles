#!/bin/sh
status=$(pamixer --default-source --get-mute)

[ $status = "true" ] && printf "Mic: off"
