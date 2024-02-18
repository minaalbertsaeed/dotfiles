#!/bin/sh

filename="$1"
extension="${filename#*.}"

if [ "$extension" = "zip" ]; then
    unzip "$filename"
elif [ "$extension" = "tar.gz" ]; then
    tar -xzvf "$filename"
elif [ "$extension" = "tar.bz2" ]; then
    tar -xjvf "$filename"
elif [ "$extension" = "tar" ]; then
    tar -xvf "$filename"
fi

