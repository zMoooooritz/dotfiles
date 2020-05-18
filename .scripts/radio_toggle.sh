#!/bin/bash

if xdotool search --classname "RADIOPLAYER"; then
    if xdotool search --onlyvisible --classname "RADIOPLAYER"; then
        i3-msg '[instance="RADIOPLAYER"] move scratchpad;'
    else
        i3-msg '[instance="RADIOPLAYER"] scratchpad show;'
    fi
else
    i3-msg exec "st -n 'RADIOPLAYER' -g 150x50 -e cmus"
fi
