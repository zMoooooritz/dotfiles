#!/bin/bash

id_path="/home/moritz/.local/share/window/id"
name_path="/home/moritz/.local/share/window/name"

id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

[[ $id == "0x0" ]] && echo "" && exit 0

! [ -f $id_path ] && echo "id file does not exist" && exit 0
! [ -f $name_path ] && echo "name file does not exist" && exit 0

name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)

# check if the window changed
read old_id < $id_path
read old_name < $name_path
[[ $id$name == $old_id ]] && echo $old_name && exit 0
echo $id$name > $id_path

[ $(xrandr -q | grep -c " connected") -gt 1 ] &&
    output="$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2): "

class=$(xprop -id $id | awk '/WM_CLASS/' | cut -d'"' -f2)
class2=$(xprop -id $id | awk '/WM_CLASS/' | cut -d'"' -f4)

declare -a name_apps=("Telegram" "vimiv")
declare -a class_upper=("discord" "skype" "spotify" "shutter")
declare -a class_full_upper=("gimp" "obs")

# TODO apps to fix

if [[ $id == "xprop: error"* ]]; then
    # empty workspace
    title=""
elif [[ $name == *"()" ]]; then
    title="cmus"
elif [[ $class2 = "firefox" ]]; then
    title="Mozilla Firefox"
elif [[ $class2 == "Thunderbird" ]]; then
    title="Mozilla Thunderbird"
elif [[ $name =~ "Tor Browser" ]]; then
    title="Tor Browser"
elif [[ $name =~ "streamlink" ]]; then
    title="streamlink"
elif [[ $class2 =~ "mpv" ]]; then
    title="mpv - ${name% - mpv}"
elif [[ $class2 =~ "Zathura" ]]; then
    title="Zathura - $name"
elif [[ $class =~ "libreoffice" ]]; then
    file=${name%-*}
    app=${name: -(${#name} - ${#file} - 2)}
    title="$app - $file"
elif [[ $class == "nemo" ]]; then
    [[ $class == "" ]] && title="Nemo" || title="Nemo - $name"
elif [[ $class =~ "microsoft teams" ]]; then
    title="Microsoft Teams"
elif [[ ${name_apps[@]} =~ "$(echo $name | cut -d' ' -f1)" ]]; then
    # whatever you want to do when arr contains value
    title="$name"
elif [[ ${class_upper[@]} =~ "$class" ]]; then
    # whatever you want to do when arr contains value
    title="$(tr '[:lower:]' '[:upper:]' <<< ${class:0:1})${class:1}"
elif [[ ${class_full_upper[@]} =~ "$class" ]]; then
    # whatever you want to do when arr contains value
    title="${class^^}"
elif [[ $class == "st" ]]; then
    s_name=${name##..*/}
    title="st - $s_name"
else
    title="$class"
fi

echo $output$title > $name_path
echo $output$title
