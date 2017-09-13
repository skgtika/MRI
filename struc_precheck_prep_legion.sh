#!/bin/bash
ROOT="/home/rmjlns1/Scratch/shared/struc_354"
tfn="208"  # Number of files in the mp-rage

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
	# Checks DICOM exists
	k=$(ls $ROOT/$REM*/scans/ | sort -n | tail -n 1) # Establishes the last imaging directory number  
	if ls $ROOT/$REM*/scans/${k}/DICOM/ 1> /dev/null 2>&1; then
		 echo "OK: DICOM directory exists"
		 else
		 echo "ERROR: DICOM Directory does NOT exist"
		 dcmcounter=$((dcmcounter+1))
		 continue
	fi

	#### Checks the number of files is correct
	cd $ROOT/$REM*/scans/${k}/DICOM/ 
	# counts the number of files
	file_num=$(ls -1 | wc -l)    
	# if there are not 208 files it calls it
	if [ "$file_num" -eq "$tfn" ]; then
    	echo "OK: There are the correct number of .dcm files "
    else
    	echo "ERROR : there are NOT 208  .dcm files"
    	fncounter=$((fncounter+1))
    	nlist+=($REM)
    	continue
	fi
done

# checks that dcm2nii exists
if ! type "dicom2nii.command" > /dev/null; then
	echo ""
	echo "dicom2nii.command does not exist !!!"
	echo ""
fi




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


echo "There are ;" $dcmcounter "DICOMS directories missing"
echo ""


echo "There are " $fncounter " directories withOUT 208 files "
echo "These are;"
for item in ${nlist[*]}
	do
		printf "   %s\n" $item
done
