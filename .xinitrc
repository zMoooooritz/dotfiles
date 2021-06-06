#!/bin/sh

xmodmap ~/.Xmodmap

exec i3 > ~/.i3log 2>&1
