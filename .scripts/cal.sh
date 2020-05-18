#!/bin/bash

[ -z $1 ] && echo $(date '+%H:%M:%S %d.%m.%Y') && exit

month=$(date '+%m')
year=$(date '+%Y')

case $1 in
    "cur") cdate=$(date '+  %a, %d. %b. %Y  ') ;;
    "next")
        [ month == 12 ] && month=1 && year=$((year+1)) || month=$((month+1))
        cdate=$(cal $month $year | head -n 1) ;;
esac

clines=6
[[ $(cal -m $month $year | sed -n '8p') == *"3"* ]] && clines=7
[[ $(cal -m $month $year | sed -n '7p') == *"2"* ]] || clines=5

cal -m --color=always $month $year \
    | sed 's/\x1b\[[7;]*m/\<b\>\<u\>/g' \
    | sed 's/\x1b\[[27;]*m/\<\/u\>\<\/b\>/g' \
    | head -$((clines+1)) \
    | tail -n +2 \
    | rofi \
    -dmenu \
    -markup-rows \
    -font "Monospace 12" \
    -hide-scrollbar \
    -location 3 -m -1 \
    -lines $clines \
    -yoffset 35 -xoffset -5 \
    -width -23 \
    -theme solarized_alternate.rasi \
    -no-custom \
    -p "$cdate" > /dev/null

