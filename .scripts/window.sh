#!/bin/bash

id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

if [[ $id == "0x0" ]]; then
    echo ""
    return
fi

name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
class=$(xprop -id $id | awk '/WM_CLASS/' | cut -d'"' -f2)
class2=$(xprop -id $id | awk '/WM_CLASS/' | cut -d'"' -f4)

declare -a name_apps=("Telegram" "vimiv")

declare -a class_upper=("discord" "skype" "spotify" "shutter")

declare -a class_full_upper=("gimp" "obs")

# TODO apps to fix
# mpv

if [[ $id == "xprop: error"* ]]; then
    # empty workspace
    title=""
elif [[ $name == *"()" ]]; then
    # cmus
    title="cmus"
elif [[ $class2 = "firefox" ]]; then
    # firefox
    title="Mozilla Firefox"
elif [[ $name =~ "Mozilla Thunderbird" ]]; then
    # thunderbird
    title="Mozilla Thunderbird"
elif [[ $name =~ "Tor Browser" ]]; then
    title="Tor Browser"
elif [[ $name =~ "streamlink" ]]; then
    title="streamlink"
elif [[ $class2 =~ "mpv" ]]; then
    title="mpv - $name"
elif [[ $class == "nemo" ]]; then
    # nemo
    [[ $class == "" ]] && title="Nemo" || title="Nemo - $name"
elif [[ $class == "gnome-terminal" ]]; then
    # nemo
    title="Termite"
elif [[ ${name_apps[@]} =~ "$(echo $name | cut -d' ' -f1)" ]]; then
    # whatever you want to do when arr contains value
    title="$name"
elif [[ ${class_upper[@]} =~ "$class" ]]; then
    # whatever you want to do when arr contains value
    title="$(tr '[:lower:]' '[:upper:]' <<< ${class:0:1})${class:1}"
elif [[ ${class_full_upper[@]} =~ "$class" ]]; then
    # whatever you want to do when arr contains value
    title="${class^^}"
elif [[ $class == *"termite" ]]; then
    # termite
    nm=$(echo $name | cut -d' ' -f2)
    if [[ ${nm:0:1} == "~" || ${nm:0:1} == "/" ]]; then
        title="Termite - $nm"
    else
        title="$name"
    fi
else
    title="$class"
fi

echo "$title"

