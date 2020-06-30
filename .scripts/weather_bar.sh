#!/bin/bash

weatherreport="/home/moritz/.local/share/weather/report"
weatherscript="/home/moritz/.scripts/weather.py"

# das hier mal noch etwas shöner machen und relative Pfade verwenden
if [ "$1" == "overview" ]; then
    if ! xdotool search --classname "WTTRINFO"; then
        i3-msg exec "st -n 'WTTRINFO' -g 125x38 -e sh -c 'curl wttr.in/?F&lang=de && read junk'"
    fi
    exit 0
fi

! [ -f $weatherreport ] && echo "weather report file does not exist" && exit 0

change_date=$(stat -c %y $weatherreport | cut -d' ' -f1)

change_time=$(stat -c %y $weatherreport | cut -d' ' -f2)
change_time=${change_time%.*}
change_time=${change_time//:}

diff=$(($(date '+%H%M%S') - change_time))

[[ $change_date != "$(date '+%Y-%m-%d')" || $diff < 500 ]] ||
    python "/home/moritz/.scripts/weather.py" > $weatherreport

cat $weatherreport
