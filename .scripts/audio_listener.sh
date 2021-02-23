#!/usr/bin/env bash

mkfifo /tmp/volpipe
tail -f /tmp/volpipe | xob &
#sink_id=$(pacmd list-sinks | grep "*" | tr -d "\n" | tail -c 1)
#pactl subscribe | grep --line-buffered "remove" | xargs -n1 ~/.scripts/audio_update.sh
pactl subscribe | grep --line-buffered "remove"

