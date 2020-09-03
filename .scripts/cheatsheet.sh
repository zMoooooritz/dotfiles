#!/bin/bash

max_lines=6
options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"
clines="$(echo -e "$options" | wc -l)"
clines=$(( $clines < $max_lines ? $clines : $max_lines ))

rofi_menu="rofi \
    -dmenu \
    -lines 45 \
    -hide-scrollbar \
    -theme DarkBlue.rasi \
    -no-custom \
    -location 1 \
    -width 20 \
    -yoffset 40 \
    -xoffset 5 \
    -p Cheatsheet"

chosen="$(echo -e "$options" | $rofi_menu)"

[ $chosen -z ] || i3-msg exec "sxiv -b -g 1000x800 -N CHEATSHEET ~/.cheatsheets/$chosen*"

