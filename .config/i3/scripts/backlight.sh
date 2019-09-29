#!/bin/bash

bl_level_default="80"
bl_level_step="$2"

if [ $1 == 1 ]; then
	xbacklight -inc $bl_level_step
elif [ $1 == 2 ]; then
	xbacklight -dec $bl_level_step
elif [ $1 == 3 ]; then
	xbacklight -set $bl_level_default
else
	sleep 1
fi
