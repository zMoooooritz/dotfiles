#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo $m
    if [ "$m" = "DP-2" ]; then
        MONITOR=$m polybar --reload main &
    elif [ "$m" = "HDMI-1" ]; then
        echo "test"
        MONITOR=$m polybar --reload second &
    else
        MONITOR=$m polybar --reload top_external &
    fi
done

#polybar top &
#polybar top_external &

echo "Topbars launched..."
