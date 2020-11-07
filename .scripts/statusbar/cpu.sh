#!/bin/sh

LABEL=""

case "$1" in
    show)
        ;;
    *)
        USAGE=$(grep 'cpu ' /proc/stat | awk '{cpu_usage=($2+$4)*100/($2+$4+$5)}
        END {printf "%0.1f%", cpu_usage}')
        echo "$USAGE"
        ;;
esac
