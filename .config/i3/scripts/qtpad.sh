#!/bin/bash

if pgrep "qtpad" > /dev/null
then
	killall qtpad
	i3-msg exec qtpad
else
	i3-msg exec qtpad
fi
