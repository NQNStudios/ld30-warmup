#!/bin/sh

FRAMES="*.jpg"
FILES="files.txt"
VIDEO="screenlapse.avi"

if [ -e "$FRAMES" ]; then
    rm "$FRAMES"
fi

if [ -e "$FILES" ]; then 
    rm "$FILES"
fi

if [ -e "$VIDEO" ]; then
    rm "$VIDEO5"
fi
