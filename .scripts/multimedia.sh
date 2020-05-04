#!/bin/bash

if pidof "spotify" > /dev/null
then
    case "$1" in
        "playpause") dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause ;;
        "stop")      dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause ;;
        "next")      dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next ;;
        "prev")      dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous ;;
    esac
fi

if pidof "cmus" > /dev/null
then
    case "$1" in
        "playpause") cmus-remote --pause ;;
        "stop")      cmus-remote --stop ;;
        "next")      cmus-remote --next ;;
        "prev")      cmus-remote --prev ;;
    esac
fi

