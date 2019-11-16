#!/bin/bash
name=$(date +'%Y-%m-%d_%H:%M:%S.png')
save_path="/home/moritz/Pictures/screenshots/"
combined=$save_path$name
echo "$save_path$name"
scrot -z -q 100 ~/$name && \
mv ~/$name $save_path$name && \
xclip -selection clipboard -t image/png -i "$combined" && \
#zenity --info --width="280" --height=20 --title "Screenshot" --timeout=1 --text "Your screenshot has been saved in \n $save_path" &>/dev/null && \
notify-send "Screenshot" "Your screenshot has been saved in \n $save_path" --icon=simplescreenrecorder-idle
exit 0
