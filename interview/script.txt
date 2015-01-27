#!/bin/bash
if [ -f "output.txt" ]
then
	rm output.txt
fi
if [ ! -f "input.txt" ]
then
	echo "input.txt not present"
	exit 0
fi
LINES=(`cat input.txt | grep -n partition | cut -d ':' -f1`)
i=0
length=${#LINES[@]}
((length=length-1))
for line in ${LINES[@]}
do
	((i=i+1))
	upperline=${LINES[$i]}
	#collect partition data
	if [ $i -le $length ]
	then
		partition_data=`sed -n "${line},${upperline}p" input.txt`
	else
		partition_data=`sed -n "${line},$ p" input.txt`
	fi
	#parse partition data
	if echo "$partition_data" | grep id
	then
		id=`echo "$partition_data" | grep id | cut -d '=' -f2`
	else
		id="UNKNOWN"
	fi
	if echo "$partition_data" | grep company
	then
		company=`echo "$partition_data" | grep company | cut -d '=' -f2`
	else
		company="UNKNOWN"
	fi
	echo "id $id works in $company company" >> output.txt

done
exit 0
