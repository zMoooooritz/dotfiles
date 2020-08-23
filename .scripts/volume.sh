#!/bin/bash

vol_default="80"
vol_step="${2:-5}"

# set the sink id accordingly
SINK=1

case "$1" in
    inc|up) pactl set-sink-volume $SINK +$vol_step% ;;
    dec|down) pactl set-sink-volume $SINK -$vol_step% ;;
    toggle) pactl set-sink-mute $SINK toggle ;;
    reset) pactl set-sink-volume $SINK $vol_default% ;;
    *) ;;
esac

str=$(pamixer --get-volume)
$(pamixer --get-mute) && str+="!"
echo $str > /tmp/volpipe
