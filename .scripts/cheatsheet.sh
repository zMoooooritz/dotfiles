#!/bin/bash

max_lines=6
options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"
clines="$(echo -e "$options" | wc -l)"
clines=$(( $clines < $max_lines ? $clines : $max_lines ))

rofi_menu="rofi \
    -dmenu \
    -lines $clines \
    -hide-scrollbar \
    -theme solarized_alternate.rasi \
    -no-custom \
    -p Cheatsheet"

chosen="$(echo -e "$options" | $rofi_menu)"

[ $chosen -z ] || i3-msg exec "feh  --image-bg black -Z -. ~/.cheatsheets/$chosen*"

