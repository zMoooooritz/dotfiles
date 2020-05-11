#!/bin/bash

options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"
clines="$(echo -e "$options" | wc -l)"

rofi_menu="rofi \
    -dmenu \
    -lines $clines \
    -hide-scrollbar \
    -theme solarized_alternate.rasi \
    -no-custom \
    -p Cheatsheet"

chosen="$(echo -e "$options" | $rofi_menu)"

[ $chosen -z ] || i3-msg exec "feh  --image-bg black -Z -. ~/.cheatsheets/$chosen*"

