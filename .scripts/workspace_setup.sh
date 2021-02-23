#!/usr/bin/env bash

apps=(st brave thunderbird nemo telegram-desktop)

for ws in "${!apps[@]}"
do
    i3-msg "workspace $((ws + 1)); append_layout /home/moritz/.config/i3/workspace-$((ws + 1)).json"
    i3-msg "exec --no-startup-id ${apps[$ws]}"
done

i3-msg "workspace 1"
