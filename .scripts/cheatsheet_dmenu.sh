#!/bin/bash

options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"

chosen="$(echo -e "$options" | dmenu -b -i -p "Cheatsheet:")"

[ -z $chosen ] || i3-msg exec "sxiv -b -g 1000x800 -N CHEATSHEET ~/.cheatsheets/$chosen*"
