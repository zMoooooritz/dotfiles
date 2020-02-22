#!/bin/bash

if [ $(pidof "cmus") > /dev/null ] && [ $(cmus-remote -Q | grep title | wc -l) -gt 0 ];
then
    # cmus is running and not stopped

    if [ "$1" == "toggleplay" ];
    then
        cmus-remote --pause
    else
        file=$(cmus-remote -Q | grep file | cut -c 6-)
        title=$(cmus-remote -Q | grep title | cut -c 11-)
        artist=$(cmus-remote -Q | grep artist | cut -c 12-)

        if [[ "$file" == *"http"* ]];
        then
            TITLE="$title"
        else
            TITLE="$title - $artist"
        fi

        echo "$TITLE"
    fi
else
    echo ""
fi
