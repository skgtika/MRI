#!/bin/bash

# It is ESSENTIAL to run this once before FREESURFER


ROOT="/scratch/scratch/rmjlns1/shared" # The general directory
SOURCE="/scratch/scratch/rmjlns1/shared/cstruc_250" # Source of the nii.gz files
mkdir $ROOT/freesurfer_subjects $ROOT/freesurfer_subjects/subjects # Makes the Freesurfer directory
FSSUBDIR="$ROOT/freesurfer_subjects/subjects"

# Run from the Legion login node

cd $ROOT

for i in {1..250} ; do # Alter the number depending upon the number of subjects
	cd $FSSUBDIR 
	
	# This is a Freesurfer command that generates all of the substructure needed
	mksubjdirs cut_${i} 
	 # Moves the mprage into the appropriate freesurfer directory
	 # Alter cut_${i}_mprage.nii.gz to the MP-RAGE label
	cp -fr $SOURCE/cut_${i}_mprage.nii.gz $FSSUBDIR/cut_${i}/mri
	# Moves into subject directory
	cd $ROOT/freesurfer_subjects/subjects/cut_${i}/mri
	# Converts to the freesurfer file format
	mri_convert cut_${i}_mprage.nii.gz 001.mgz # Is labelled 001.mgz as Freesurfer convention  
done
 