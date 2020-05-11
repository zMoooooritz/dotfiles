#!/bin/bash

# Normal Laptop-Screen
INTERN="HDMI-1"

# VGA Output
VGA="VGA"

DISPEX=true

PrintUsage() {
cat << EOI
Usage:
	screen < modes | connected | intern | extern | clone | extend > < none (defaults to HDMI) | HDMI | VGA >
EOI
}

res=$(xrandr -q | grep ' connected' | grep '$VGA' | wc -l)

if [ "$2" == "HDMI" ];
then
	if [ "$(xrandr -q | grep ' connected' | grep $HDMI | wc -l)" == "0" ];
	then
		echo "No Connection at $HDMI"
		exit
	fi
	EXTERN=$HDMI
elif [ "$2" == "VGA" ]
then
	if [ "$(xrandr -q | grep ' connected' | grep -v $INTERN  | grep $VGA | wc -l)" == "0" ];
	then
		echo "No Connection at $VGA"
		exit
	fi
	EXTERN=$VGA
else
	if [ "$(xrandr -q | grep ' connected' | grep $HDMI | wc -l)" == "1" ];
	then
		EXTERN=$HDMI
	elif [ "$(xrandr -q | grep ' connected' | grep -v $INTERN  | grep $VGA | wc -l)" == "1" ]
	then
		EXTERN=$VGA
	else
		EXTERN=$HDMI
		DISPEX=false
	fi
fi

if [ "$1" == "extern" ] || [ "$1" == "clone" ] || [ "$1" == "extend" ];
then
	if [ "$DISPEX" == false ];
	then
		echo "Missing Connection to second output"
		exit
	fi
fi

case $1 in
	modes)
		xrandr -q
		;;
	connected)
		xrandr -q | grep " connected"
		;;
	intern)
		xrandr --output $INTERN --auto --output $EXTERN --off
		i3-msg restart || true
		;;
	extern)
		xrandr --output $INTERN --off --output $EXTERN --auto
		i3-msg restart || true
		;;
	clone)
		CLONERES=`xrandr --query | awk '/^ *[0-9]*x[0-9]*/{ print $1 }' | sort -n | uniq -d | tail -1`
		xrandr --output $INTERN --mode $CLONERES --output $EXTERN --mode $CLONERES
		i3-msg restart || true
		;;
	extend)
		xrandr --output $INTERN --primary  --auto --output $EXTERN --auto --right-of $INTERN
		i3-msg restart || true
		;;
	*)
		PrintUsage
		;;
esac
