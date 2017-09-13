#!/bin/bash

module load fsl/5.0.9
source $FSLDIR/etc/fslconf/fsl.sh
module load xorg-utils/X11R7.7
module load freesurfer/5.3.0

ROOT="/home/rmjlns1/Scratch/shared/struc_354"

filename='/home/rmjlns1/Scratch/shared/bashscripts/ntag.txt'  # Load NTAGS
filelines=`cat $filename` #Get each line

cd $ROOT
counter=1000
for REM in 14344215 14522014	 ; do # Loop through at the subject level using N-tag 14344215 14522014	 

	k=$(ls $ROOT/$REM*_MR*/scans/ | sort -n | tail -n 1)  # Establishes the last imaging directory number 
	cd $ROOT/$REM*/scans/${k}/DICOM/ #
	for n in {1..208} ;do # For each slice of MP-RAGE
		mv *-${n}-*.dcm ${counter}_struc_${n}.dcm # Renames each slice MPRAGE
	done
	mri_convert -i ${counter}_struc_1.dcm -it dicom -o struc_${counter}.nii.gz -ot nii
	mkdir ./tmp
	fslswapdim struc_${counter}.nii.gz RL PA IS ./tmp/rstruc_${counter}.nii.gz
	cd ./tmp
	fslslice rstruc_${counter}.nii.gz
         for i in $(seq -f '%04g' 0 50);do
             rm -fr ./rstruc_${counter}_slice_${i}.nii.gz
         done
    fslmerge -z cut_${counter}_mprage.nii.gz rstruc_${counter}_slice_*.nii.gz 	
	cp -fr cut_${counter}_mprage.nii.gz /home/rmjlns1/Scratch/shared/cstruc_250/cut_${counter}_mprage.nii.gz
	counter=$((counter+1))
done