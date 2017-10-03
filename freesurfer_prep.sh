#!/bin/bash

ROOT="/scratch/scratch/rmjlns1/shared"
CUT="/scratch/scratch/rmjlns1/shared/cstruc_250"

cd /scratch/scratch/rmjlns1/shared

mkdir $ROOT/freesurfer_subjects/subjects

for i in {1..250} ; do
	cd $ROOT/freesurfer_subjects/subjects
	mksubjdirs cut_${i}

	cp -fr $CUT/cut_${i}_mprage.nii.gz $ROOT/freesurfer_subjects/subjects/cut_${i}/mri
	cd $ROOT/freesurfer_subjects/subjects/cut_${i}/mri
	mri_convert -c ut_${i}_mprage.nii.gz 001.mgz
done
 