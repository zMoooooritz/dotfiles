#!/bin/bash

options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"

chosen="$(echo -e "$options" | dmenu -b -i -p "Cheatsheet:")"

[ -z $chosen ] || i3-msg exec "feh  --image-bg black -Z -. ~/.cheatsheets/$chosen*"
