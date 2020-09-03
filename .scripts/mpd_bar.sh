#!/bin/bash

# falls funkionalität so vollständig ist etwas kompakter / effizienter schreiben

if [ $(pidof mpd) > /dev/null ];
then
    # ncmpcpp is open

    if [ "$1" == "toggleplay" ];
    then
        mpc -q toggle
    elif [ -z "$(mpc current)" ];
    then
        echo ""
    else
        file=$(mpc --format %file% | head -n 1)
        name=$(mpc --format %name% | head -n 1)

        if [[ "$file" == *"http"* ]];
        then
            title="$name"
        else
            title=$(mpc --format "[[%title% -] %artist%]" | head -n 1)
        fi

        echo "$title"
    fi
else
    echo ""
fi
