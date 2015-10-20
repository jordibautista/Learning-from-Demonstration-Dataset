#!/bin/sh

# asking for session name
echo -n "Hello! :) \nI'm getting ready...\n"
# sleep 1
# launching ROS
roslaunch dataset_pkg_indigo dataset.launch session_name:=$session_name session_time:=$timestamp
echo -n "Are you already ready?...\n"
# sleep 1
echo -n "Good...Then: \n"
echo -n "Please, write me the name of this session [PRESS ENTER]: \n"

while [ -z "$session_name" ]
do
	read session_name
	if ! [ -n "$session_name" ]; then
		session_name="default"
		#echo "no session recognized, enter new name:"
	fi
done
sleep 1

#generating session folder
date=$( date +%F )
time=$( date +%T )
timestamp=$(echo "$date _ $time" | sed 's/://g' | sed 's/-//g' | sed 's/\.//g' | sed 's/\ //g')

#mkdir -p /home/nbfigueroa/dataset/$session_name/
#mkdir -p /home/nbfigueroa/dataset/$session_name/$timestamp
#mkdir -p /home/nbfigueroa/dataset/$session_name/$timestamp/bagfiles/

# launching ROS
roslaunch dataset_pkg_indigo dataset.launch session_name:=$session_name session_time:=$timestamp
