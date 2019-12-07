#!/bin/bash

# It is ESSENTIAL to run this once before FREESURFER


ROOT="/home/skgtika/Scratch" # The general directory
SOURCE="/home/skgtika/Scratch/myftd" # Source of the nii.gz files
mkdir $ROOT/freesurfer_subjects $ROOT/freesurfer_subjects/subjects # Makes the Freesurfer directory
FSSUBDIR="$ROOT/freesurfer_subjects/subjects"


# Run from the Legion login node

for i in {1..222} ; do # Alter the number depending upon the number of subjects
	cd $FSSUBDIR 
	
	# This is a Freesurfer command that generates all of the substructure needed
	mksubjdirs ftd_${i} 
	 # Moves the mprage into the appropriate freesurfer directory
	 # Alter cut_${i}_mprage.nii.gz to the MP-RAGE label
	cp -fr $SOURCE/ftd_struc_${i}.nii.gz $FSSUBDIR/ftd_${i}/mri
	# Moves into subject directory
	cd $ROOT/freesurfer_subjects/subjects/ftd_${i}/mri
	# Converts to the freesurfer file format
	mri_convert ftd_struc_${i}.nii.gz 001.mgz # Is labelled 001.mgz as Freesurfer convention  
done
 