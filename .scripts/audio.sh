#!/usr/bin/env bash

HEADSET_KEY="HyperX"
WEBCAM_KEY="OrbiCam"
SPEAKER_KEY="Starship/Matisse"

change_sink_and_source() {
    [ -z $1 ] && return
    [ -z $2 ] && return
    source_name=$1
    sink_name=$2
    source_id=$(pamixer --list-sources | grep "input.*${source_name}" | cut -c1)
    pactl set-default-source $source_id
    sink_id=$(pamixer --list-sinks | grep "${sink_name}" | cut -c1)
    pactl set-default-sink $sink_id
}

case $1 in
    "h"|"H"|"headset")
        change_sink_and_source $HEADSET_KEY $HEADSET_KEY
        ;;
    "n"|"N"|"w"|"w"|"normal")
        change_sink_and_source $WEBCAM_KEY $SPEAKER_KEY
        ;;
    "t"|"toggle")
        active_sink=$(pacmd list-sinks | grep "*" | tr -d "\n" | tail -c 1)
        headset_sink=$(pamixer --list-sinks | grep "${HEADSET_KEY}" | cut -c1)
        if [ $active_sink == $headset_sink ]
        then
            change_sink_and_source $WEBCAM_KEY $SPEAKER_KEY
        else
            change_sink_and_source $HEADSET_KEY $HEADSET_KEY
        fi
        ;;
    *)
        change_sink_and_source
        ;;
esac

