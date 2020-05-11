#!/bin/bash
name=$(date +'%Y-%m-%d_%H:%M:%S.png')
save_path="/home/moritz/Pictures/screenshots/"
combined=$save_path$name
scrot -z -q 100 $combined
notify-send "Screenshot" "Your screenshot has been saved!" --icon=simplescreenrecorder-idle
exit 0
