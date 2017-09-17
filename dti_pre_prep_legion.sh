#!/bin/bash

ROOT="/home/rmjlns1/Scratch/shared"
RAW="dti_354"   # The raw directory
PREP="dti_250" # The output directory

filename='/home/rmjlns1/Scratch/shared/bashscripts/ntag.txt'  # Load NTAGS
filelines=`cat $filename` #Get each line
nfilename='/home/rmjlns1/Scratch/shared/bashscripts/ntag_nodti.txt'  # Load NTAGS
nfilelines=`cat $nfilename` #Get each line

cd $ROOT
counter=1

for REM in $filelines ; do # Loop through at the subject level using N-tag	 


	if [ "$filelines" -eq "$nfilelines" ]; then  # If there are no DTI files it skips it. 
    	counter=$((counter+1))
    else 
		cd $ROOT/$RAW/$REM*/scans/ #
		#dcm2niix ./ # This needs to be ran once. 
		
		# checks to see if b2000 exists. If it does NOT then it renames it
		if [ -e dti_${counter}_b2000.nii ]
		then
    		echo "file exist"
		else
    		cp -fr ./*_b2000_*.nii ./dti_${counter}_b2000.nii
    		cp -fr *_b2000_*.bval dti_${counter}_b2000.bval 
    		cp -fr *_b2000_*.bvec dti_${counter}_b2000.bvec
		fi
		
		# checks to see if b700 exists. If it does NOT then it renames it
		if [ -e dti_${counter}_b700.nii ]
		then
    		echo "file exist"
		else
    		cp -fr ./*_b700*.nii ./dti_${counter}_b700.nii
    		cp -fr *_b700*.bval dti_${counter}_b700.bval 
    		cp -fr *_b700*.bvec dti_${counter}_b700.bvec
		fi
		

		# Combines the two data sets as multishell
		fslmerge -a combo_dti_data dti_${counter}_b700.nii dti_${counter}_b2000.nii
		paste -d"\0" dti_${counter}_b700.bval dti_${counter}_b2000.bval >> bvals	
		paste -d"\0" dti_${counter}_b700.bvec dti_${counter}_b2000.bvec >> bvecs
		
		# creates the directory if it doesnt exist
		if [ -d "$ROOT/$PREP/${counter}_dti" ]
		then
    		echo "directory exists"
    	else
    		mkdir $ROOT/$PREP/${counter}_dti
		fi
	 
		
		# copies over the data to the directory 
		cp -fr combo_dti_data.nii.gz $ROOT/$PREP/${counter}_dti
		cp -fr bvals $ROOT/$PREP/${counter}_dti
		cp -fr bvecs $ROOT/$PREP/${counter}_dti
		
		# cd and creates the other files required
		cd $ROOT/$PREP/${counter}_dti
		
		# bet
		bet combo_dti_data bet_combo_dti_data -m
		
		# generates the index file needed for eddy
		if [ -e index.txt ]
		then
    		echo "file exist"
		else
			indx=""
			for ((i=0; i<37; ++i)); do indx="$indx 1\n"; done
			for ((i=0; i<72; ++i)); do indx="$indx 1\n"; done
			echo $indx > index.txt
		fi
				
		# generates the acqparams file needed for eddy
		if [ -e acqparams.txt ]
		then
    		echo "file exist"
		else
    		printf "0 -1 0 0.06\n0 -1 0 0.06" > acqparams.txt # I have checked and this is the same for both b700 & b2000
		fi
		
		counter=$((counter+1))
	fi
done

