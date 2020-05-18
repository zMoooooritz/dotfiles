#!/bin/bash

[ -z $1 ] && echo "missing directory name" && exit 0
[ -d $1 ] && echo "directory does exist already" && exit 0
[ -f "$1.zip" ] && echo "target zip-file does exist already" && exit 0

mkdir $1

cp -r "Abgaben_Tut_4/." $1
cp -r "Abgaben_Tut_5/." $1

zip -r "$1.zip" $1 2>&1 | pv -lep -s $(find $1 | wc -l) > /dev/null
