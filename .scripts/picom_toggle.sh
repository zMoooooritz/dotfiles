#!/bin/bash

if pgrep -x "picom" > /dev/null
then
    killall picom
else
    i3-msg exec "picom --config ~/.config/picom/picom.conf"
fi
