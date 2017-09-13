#!/bin/bash

ROOT="/home/rmjlns1/Scratch/shared"
RAW="dti_354"
PREP="dti_250"

filename='/home/rmjlns1/Scratch/shared/bashscripts/ntag.txt'  # Load NTAGS
filelines=`cat $filename` #Get each line
nfilename='/home/rmjlns1/Scratch/shared/bashscripts/ntag_nodti.txt'  # Load NTAGS
nfilelines=`cat $nfilename` #Get each line

cd $ROOT
counter=1

for REM in $filelines ; do # Loop through at the subject level using N-tag	 


	if [ "$filelines" -eq "$nfilelines" ]; then
    	counter=$((counter+1))
    else 

		#dcm2niix ./
		echo "Working on subject"
		
		# cd and creates the other files required
		cd $ROOT/$PREP/${counter}_dti
		
		rm -fr index.txt
		
		seq 1 108 > index.txt

		counter=$((counter+1))
	fi
done

