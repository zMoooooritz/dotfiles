#!/bin/bash

icon='/home/moritz/.config/i3/icons/icon.png'
tmpbg='/tmp/i3lock.png'

scrot -z "$tmpbg"

convert "$tmpbg" -brightness-contrast -20x-20 -blur "0x5" "$icon" -gravity center -composite -matte "$tmpbg"

# Pause Spotify-Playback
if pidof "spotify" > /dev/null
then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
fi

# Pause cmus-Playback
if pidof "cmus" > /dev/null
then
	cmus-remote --pause-playback
fi

# Pause cmus-Playback
if pidof "mpd" > /dev/null
then
	mpc pause
fi

i3lock -u -t -i $tmpbg

if [ -z "$1" ];
then
	time=300;
else
	time="$1";
fi

sleep "$time"; pidof i3lock && systemctl suspend

rm $tmpbg
