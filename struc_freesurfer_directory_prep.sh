#!/bin/bash

# It is ESSENTIAL to run this before FREESURFER

ROOT="/scratch/scratch/rmjlns1/shared"
CUT="/scratch/scratch/rmjlns1/shared/cstruc_250" # Source of the nii.gz files

cd /scratch/scratch/rmjlns1/shared

mkdir $ROOT/freesurfer_subjects/subjects

for i in {1..250} ; do
	cd $ROOT/freesurfer_subjects/subjects
	mksubjdirs cut_${i} # This is a Freesurfer command that generates all of the substructure needed 
	cp -fr $CUT/cut_${i}_mprage.nii.gz $ROOT/freesurfer_subjects/subjects/cut_${i}/mri
	cd $ROOT/freesurfer_subjects/subjects/cut_${i}/mri
	mri_convert -cut_${i}_mprage.nii.gz 001.mgz # Is labelled 001.mgz as Freesurfer convention  
done
 