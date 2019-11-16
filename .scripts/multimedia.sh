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

if pidof "deadbeef" > /dev/null
then
	if [ "$1" == "playpause" ];
	then
		deadbeef --play-pause
	elif [ "$1" == "stop" ]
	then
		deadbeef --stop
	elif [ "$1" == "next" ]
	then
		deadbeef --next
	elif [ "$1" == "prev" ]
	then
		deadbeef --prev
	fi
fi

