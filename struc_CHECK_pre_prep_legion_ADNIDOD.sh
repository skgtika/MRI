#!/bin/bash


# Run this first. It check that all the directory exist and highlights the ones that do not! 
# N Sharma 6/12/19

ROOT="/home/skgtikaScratch/ADNIDOD/ADNIDOD"
ROOTOUT="/home/skgtika/Scratch/myadnidod"
filename='/home/skgtika/Scratch/ntag.txt'  # Load NTAGS this contains files themselves.
filelines=`cat $filename` #Get each line

# Set counter to zero
counter=0

for REM in $filelines ; do
	echo ""
	echo "Checking subject number: " $REM
	# Checks subject exists
	if ls $ROOT/$REM*/ 1> /dev/null 2>&1; then
		 echo "OK: Subject exists"
		 else
		 echo "ERROR: This SUBJECT does NOT exist"
		 counter=$((counter+1))
		 list+=($REM) # Adds the subject to a list that will be displayed at the end
		 continue
	fi
done


# Displays the list of directories that doesnt exist	
echo ""
echo "SUMMARY:"
echo ""
echo "There are " $counter "subjects missing"
echo ""
echo "These are:"

for item in ${list[*]}
	do
		printf "   %s\n" $item
done