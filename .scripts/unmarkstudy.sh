#!/usr/bin/env bash

[ -z $1 ] && echo "missing filename" && exit 0
! [ -f $1 ] && echo "file [$1] does not exist" && exit 0
[ "${1##*.}" != "pdf" ] && echo "only pdf files are allowed" && exit 0

tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)

magick -density 300 $1 -quality 100 -alpha remove "$tmp_dir/page_%04d.jpg"
magick mogrify -path "$tmp_dir" -strokewidth 0 -fill "#ffffff" -draw "rectangle 810,3320 1670,3440" "$tmp_dir/*.jpg"
magick -quality 100 -page a4 "$tmp_dir/*.jpg" "$(pwd)/unmark_$1"

rm -rf $tmp_dir
