#!/bin/bash

[ -z $1 ] && exit

if xdotool search --classname "$1"; then
    if xdotool search --onlyvisible --classname "$1"; then
        i3-msg "[instance=$1] move scratchpad;"
    else
        i3-msg "[instance=$1] scratchpad show;"
    fi
    exit
fi

case $1 in
    "TODOLIST") i3-msg exec "st -n $1 -g 150x50 -e nvim +edit note:todo" ;;
    "RADIOPLAYER") i3-msg exec "st -n $1 -g 150x50 -e cmus" ;;
    "CALENDAR") i3-msg exec "st -n $1 -g 150x50 -e calcurse" ;;
    *) ;;
esac
