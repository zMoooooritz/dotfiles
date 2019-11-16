#!/bin//bash

# $1 is the streaming service
# $2 is the streame or an identifier
# $3 is the optional quility modifier

player="-p mpv"
service=""
identifier=""
quality=""

if [ "$#" -ge 2 ];
then
	case "$1" in
	yt|youtube)
		service="youtube.com"
		;;
	tw|twitch)
		service="twitch.tv"
		;;
	*)
		service=$1
		;;
	esac

	identifier=$2
	if [ "$#" -ge 3 ];
	then
		quality=$3
	else
		quality="best"
	fi
	
	streamlink $player $service"/"$identifier $quality
else
	echo "Illegal number of arguments"
fi

