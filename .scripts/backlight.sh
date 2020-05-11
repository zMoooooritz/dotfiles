#!/bin/bash

bl_max=$(</sys/class/backlight/intel_backlight/max_brightness)

bl_level_default="80"
bl_level_step="${2:-5}"

bl_level_step=$((bl_level_step*bl_max/100))
bl_level_default=$((bl_level_default*bl_max/100))

bl_current=$(</sys/class/backlight/intel_backlight/brightness)

case "$1" in
    inc|up) ((bl_current+=bl_level_step));;
    dec|down) ((bl_current-=bl_level_step)) ;;
    reset) ((bl_current=bl_level_default)) ;;
esac

[ $bl_current -le 0 ] && bl_current="0"
[ $bl_current -ge $bl_max ] && bl_current=$bl_max

echo $bl_current > /sys/class/backlight/intel_backlight/brightness
