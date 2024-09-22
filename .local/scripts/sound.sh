#!/bin/sh
op=$1
[ $op = "=" ] && amixer set Master toggle 
[ $op = "-" ] && amixer set Master 5%- 
[ $op = "+" ] && amixer set Master 5%+ 
pkill -RTMIN+20 dwmblocks 

