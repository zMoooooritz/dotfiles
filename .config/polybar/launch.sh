#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    {%@@ if profile == "eta" @@%}
    if [ "$m" = "DP-2" ]; then
        MONITOR=$m polybar --reload main &
    {%@@ elif profile == "pi" @@%}
    if [ "$m" = "eDP-1" ]; then
        MONITOR=$m polybar --reload main &
    {%@@ endif @@%}
    else
        MONITOR=$m polybar --reload second &
    fi
done

echo "Topbars launched..."
