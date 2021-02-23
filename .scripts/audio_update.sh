#!/usr/bin/env bash

str=$(pamixer --get-volume)
$(pamixer --get-mute) && str+="!"
echo $str > /tmp/volpipe

