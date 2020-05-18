#!/bin/bash

if xdotool search --classname "TODOLIST"; then
    if xdotool search --onlyvisible --classname "TODOLIST"; then
        i3-msg '[instance="TODOLIST"] move scratchpad;'
    else
        i3-msg '[instance="TODOLIST"] scratchpad show;'
    fi
else
    i3-msg exec "st -n 'TODOLIST' -g 150x50 -e nvim +edit note:todo"
fi
