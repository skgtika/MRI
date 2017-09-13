#!/bin/bash

module load fsl/5.0.9
source $FSLDIR/etc/fslconf/fsl.sh
module load xorg-utils/X11R7.7
module load freesurfer/5.3.0

ROOT="/home/rmjlns1/Scratch/shared/struc_354"

filename='/home/rmjlns1/Scratch/shared/bashscripts/ntag.txt'  # Load NTAGS
filelines=`cat $filename` #Get each line

cd $ROOT
counter=1

for REM in $filelines ; do # Loop through at the subject level using N-tag	 
	k=$(ls $ROOT/$REM*/scans/ | sort -n | tail -n 1)  # Establishes the last imaging directory number 
	cd $ROOT/$REM*/scans/${k}/DICOM/tmp #
	cp -fr cut_${counter}_mprage.nii.gz /home/rmjlns1/Scratch/shared/cstruc_250/cut_${counter}_mprage.nii.gz
	counter=$((counter+1))
done

