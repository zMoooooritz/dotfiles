#!/bin/bash

if pidof "spotify" > /dev/null
then
	if [ "$1" == "playpause" ];
	then
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
	elif [ "$1" == "stop" ]
	then
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
	elif [ "$1" == "next" ]
	then
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next	
	elif [ "$1" == "prev" ]
	then
		dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
	fi
fi

if pidof "cmus" > /dev/null
then
	if [ "$1" == "playpause" ];
	then
		cmus-remote --pause
	elif [ "$1" == "stop" ]
	then
		cmus-remote --stop
	elif [ "$1" == "next" ]
	then
		cmus-remote --next
	elif [ "$1" == "prev" ]
	then
		cmus-remote --prev
	fi
fi

