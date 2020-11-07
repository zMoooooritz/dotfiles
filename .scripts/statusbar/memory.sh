#!/bin/sh

LABEL=""

case "$1" in
    show)
        ;;
    *)
        echo "$(free -h --si | awk '/^Mem:/ {print substr($3, 1, length($3)-1) "/" $2}')"
        ;;
esac
