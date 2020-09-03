#!/bin/bash

stty -echo
while true; do
    curl -s "wttr.in/?F&q&lang=de"
    sleep 900
    clear
done
stty echo
