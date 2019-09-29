#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
	if [ "$m" = "eDP1" ]; then
		MONITOR=$m polybar --reload top &
	else
		MONITOR=$m polybar --reload top_external &
	fi
done

#polybar top &
#polybar top_external &

echo "Topbars launched..."
