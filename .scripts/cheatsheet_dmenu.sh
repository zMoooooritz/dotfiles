#!/bin/bash

options="$(ls ~/.cheatsheets | sed 's/_cheatsheet.*//g')"

chosen="$(echo -e "$options" | dmenu -b -i -p "Cheatsheet:")"

size=$(identify -format '%wx%h' "~/.cheatsheets/$chosen*")

#TODO
# maximale größe auf Bildschirm festlegen
# bestimmen welche Achse den Rand zuerste erreicht
# bestimmen der entsprechenden geometry für das sxiv window

[ -z $chosen ] || i3-msg exec "sxiv -b -N CHEATSHEET ~/.cheatsheets/$chosen*"
# mglw. option "-s f" einfügen
