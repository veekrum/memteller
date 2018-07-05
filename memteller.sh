#!/bin/bash
#set -xe

 memTotal=`top -b -n 2 -d1 | grep "KiB Mem" | tail -n1 | awk -F , '{ print $1 }' | awk '{print $4}'`
 memUsed=`top -b -n 2 -d1 | grep "KiB Mem" | tail -n1 | awk -F , '{ print $3 }' | awk '{print $1}'`

 percent=$( bc <<< "scale=2; $memUsed/$memTotal * 100")
 #echo $percent

    if (( `bc <<< "$percent >= 60"`  )); then
	echo "You are using more than 60% Memory. Take a break my friend  " | `/usr/games/xcowsay`
    
      elif (( `bc <<< "$percent >= 70"`  )); then
	echo "You are using more than 70% Memory. Kill that Goddamn Zombie Processes my friend " | `/usr/games/xcowsay`

      elif (( `bc <<< "$percent >= 80"`  )); then
        echo "You are Torturing your computer. Try restarting all the applications or you will miss your changes :(  " | `/usr/games/xcowsay`
    fi
