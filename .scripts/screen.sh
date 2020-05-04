#!/bin/bash

# Normal Laptop-Screen
INTERN="eDP-1"

# EXTERN Output
EXTERN="HDMI-1"

PrintUsage() {
cat << EOI
Usage:
    screen < modes | connected | intern | extern | clone | extend > < none (defaults to HDMI) | HDMI | VGA >
EOI
}

if [ "$1" == "extern" ] || [ "$1" == "clone" ] || [ "$1" == "extend" ]; then
    [ $(xrandr -q | grep -c " connected") == 1 ] && echo "Missing Connection to second output" && exit 0
fi

case $2 in
    "HDMI")
        [ $(xrandr -q | grep -c "HDMI-1 connected") == 0 ] && echo "No Connection at HDMI-1" && exit 0
        EXTERN="HDMI-1" ;;
    "VGA")
        [ $(xrandr -q | grep -c "VGA connected") == 0 ] && echo "No Connection at VGA" && exit 0
        EXTERN="VGA" ;;
    "")
        [ $(xrandr -q | grep -c "VGA connected") == 1 ] && EXTERN="VGA"
        [ $(xrandr -q | grep -c "HDMI-1 connected") == 1 ] && EXTERN="HDMI-1"
        ;;
    *)
        echo "No Connection at $2" && exit 0 ;;
esac

case $1 in
    modes) xrandr -q ;;
    connected) xrandr -q | grep " connected" ;;
    intern)
        xrandr --output $INTERN --auto --output $EXTERN --off
        ~/.scripts/i3restart.sh ;;
    extern)
        xrandr --output $INTERN --off --output $EXTERN --auto
        ~/.scripts/i3restart.sh ;;
    clone)
        CLONERES=`xrandr --query | awk '/^ *[0-9]*x[0-9]*/{ print $1 }' | sort -n | uniq -d | tail -1`
        xrandr --output $INTERN --mode $CLONERES --output $EXTERN --mode $CLONERES
        ~/.scripts/i3restart.sh ;;
    extend)
        xrandr --output $INTERN --primary  --auto --output $EXTERN --auto --right-of $INTERN
        ~/.scripts/i3restart.sh ;;
    *)
        PrintUsage
        ;;
esac
