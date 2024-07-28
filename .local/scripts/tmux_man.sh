#!/bin/bash
exec man -k . | awk '{ print $2 " "  $1}' | sed 's/[()]//g'| fzf --preview='man {1} bat {2}' --border | xargs man
