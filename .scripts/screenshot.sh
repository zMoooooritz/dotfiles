#!/bin/bash

name=$(date +'%Y-%m-%d_%H:%M:%S.png')
save_path="/home/moritz/Pictures/screenshots/"
combined=$save_path$name
file_num=$(ls $save_path | wc -l)

case $1 in
    "sel") scrot -l style=solid,width=3 -s -z -q 100 $combined ;;
    *) scrot -z -q 100 $combined ;;
esac

[ "$file_num" -lt "$(ls $save_path | wc -l)" ] && notify-send "Screenshot" "Your screenshot has been saved!" --icon=simplescreenrecorder-idle
