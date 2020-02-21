#!/bin//bash

# $1 is the streaming service
# $2 is the optional quality modifier

service=""
quality="best"

if [ "$#" -eq 0 ]; then
    echo "Missing arguments"
    exit 1
elif [ "$#" -eq 1 ]; then
    service=$1
elif [ "$#" -eq 2 ]; then
    service=$1
    quality=$2
fi

streamlink $service $quality

