#!/bin/bash
set -xe
 memTotal=`top -b -n 2 -d1 | grep "KiB Mem" | tail -n1 | awk -F , '{ print $1 }' | awk '{print $4}'`
 memUsed=`top -b -n 2 -d1 | grep "KiB Mem" | tail -n1 | awk -F , '{ print $3 }' | awk '{print $1}'`
 
 percent=$( bc <<< "scale=2; $memUsed/$memTotal * 100") ## using the bc to calculate in floating num 
 num=$(printf "%.0f" $percent) ##  changing the float into integer
 echo $num

    if (( `bc <<< "$num >= 60 && $num <=69"`  )); then
	echo "You are using $num"%" RAM Memory. Take a break my friend  " | `/usr/games/xcowsay`
    
      elif (( `bc <<< "$num >= 70 && $num <=79"`  )); then
	echo "You are using  $num"%" RAM Memory. Kill that Goddamn Zombie Processes my friend " | `/usr/games/xcowsay`

      elif (( `bc <<< "$num >= 80"`  )); then
        echo "You are Torturing your computer. Try restarting all the applications or you will miss your changes :(  " | `/usr/games/xcowsay`
    fi
