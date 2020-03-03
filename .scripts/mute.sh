#!/bin/bash
#It works as: mute.sh vlc mute OR mute.sh vlc unmute

if [ -z "$1" ]; then
   echo "Please provide me with an application name"
   exit 1
fi

if [ -z "$2" ]; then
   echo "Please provide me with an action mute/unmute after the application name"
   exit 1
fi

if ! [[ "$2" == "mute" || "$2" == "unmute" ]]; then
   echo "The 2nd argument must be mute/unmute"
   exit 1
fi

process_ids=$(pidof "$1")

if [ $? -ne 0 ]; then
   echo "There is no such process as "$1""
   exit 1
fi

temp=$(mktemp)

pacmd list-sink-inputs > $temp

inputs_found=0;
current_index=-1;
found_pid=0;
is_app=0;

IFS=' ' read -r -a process_id_list <<< "$process_ids"

while read line; do
   if [ $inputs_found -eq 0 ]; then
      inputs=$(echo -ne "$line" | awk '{print $2}')
      if [[ "$inputs" == "to" ]]; then
         continue
      fi
      inputs_found=1
   else
     if [[ "${line:0:6}" == "index:" ]]; then
         current_index="${line:7}"
         # echo "Index has been set: $current_index"
     elif [[ "${line:0:25}" == "application.process.id = " ]]; then
         for process_id in "${process_id_list[@]}"
         do
            #echo "PID: $process_id and expected PID: ${line:25}"
            if [ "$is_app" -eq 1 ] && [[ "${line:25}" == \""$process_id"\" ]]; then
                #index found...
                #echo "Found process $process_id"
                found_pid=1
                break;
            fi
         done
         if [ $found_pid -eq 1 ]; then
             break
         fi
     elif [[ "${line:0:19}" == "application.name = " ]]; then
         app=${line:20:-1}
         if [[ ${app,,} == ${1,,} ]]; then
             is_app=1
         fi
     fi

   fi
done < $temp

#$(echo pacmd list-sink-inputs)
#echo "$current_index"

rm -f $temp

if [ $current_index -eq -1 ] || [ $found_pid -eq 0 ]; then
   echo "Could not find "$1" in the processes that output sound."
   exit 1
fi

#muting...
if [[ "$2" == "mute" ]]; then
   pacmd set-sink-input-mute "$current_index" 1 > /dev/null 2>&1
else
   pacmd set-sink-input-mute "$current_index" 0 > /dev/null 2>&1
fi

exit 0
