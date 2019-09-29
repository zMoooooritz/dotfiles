#!/bin/bash

if pidof "deadbeef" > /dev/null
then
	# deadbeef is running

	if [ "$1" == "toggleplay" ];
	then
		deadbeef --play-pause
	else
		TITLE=$(deadbeef --nowplaying "%t% - %a")
		
		if [ "$TITLE" == "nothing" ];
		then
			echo ""
		else
			echo "$TITLE"
		fi
	fi
else
    echo ""
fi
