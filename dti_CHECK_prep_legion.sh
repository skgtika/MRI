#!/bin/bash
ROOT="/home/rmjlns1/Scratch/shared/dti_354"
tfn="166"  # Number of files in the mp-rage

cd $ROOT
counter=0
dcmcounter=0
fncounter=0

filename='/home/rmjlns1/Scratch/shared/bashscripts/ntag.txt'  # Load NTAGS
filelines=`cat $filename` #Get each line


for REM in $filelines ; do
	echo ""
	echo "Checking subject number: " $REM
	# Checks subject exists
	if ls $ROOT/$REM*/ 1> /dev/null 2>&1; then
		 echo "OK: Subject exists"
		 else
		 echo "ERROR: This SUBJECT does NOT exist"
		 counter=$((counter+1))
		 list+=($REM)
		 continue
	fi 
	#### Checks the number of files is correct
	cd $ROOT/$REM*/scans/
	# counts the number of files
	file_num=$(ls -l ./*/DICOM/*.* | grep -v ^l | wc -l)    
	# if there are not 208 files it calls it
	if [ "$file_num" -eq "$tfn" ]; then
    	echo "OK: There are the correct number of .dcm files "
    else
    	echo "ERROR : there are NOT 166  .dcm files"
    	fncounter=$((fncounter+1))
    	nlist+=($REM)
    	continue
	fi
done



echo ""
echo "SUMMARY:"
echo ""
echo "There are " $counter "subjects missing"
echo ""
echo "These are:"

for item in ${list[*]} ; do
		printf "   %s\n" $item
done



echo "There are " $fncounter " directories withOUT 166 files "
echo "These are;"
for item in ${nlist[*]}; do
		printf "   %s\n" $item
done
