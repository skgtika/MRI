#!/bin/bash
# Author: N Sharma

# This script uses the output of recon all. It generates the ROI's from the 2009 parcellation
# The output roi are put into $ROOT/freesurfer_subjects/subjects/sub1/fsl_roi
# Run from the Legion login node

ROOT="/scratch/scratch/rmjlns1/shared" # The general directory
FSSUBDIR="$ROOT/freesurfer_subjects/subjects"

######################

cd $FSSUBDIR #cd into 

for i in {1..9} ; do # Alter the number depending upon the number of subjects

	cd $FSSUBDIR/sub${i} #the 'sub" is the prefix to the directory. Alter as required. 
	
	
	#Checks to see if the directory works
	if ls $FSSUBDIR/sub${i}/fsl_roi/ 1> /dev/null 2>&1; then
		 echo "OK: Output directory exists"
		 else
		 echo "Creating Output directory "
		 mkdir $FSSUBDIR/sub${i}/fsl_roi
		 continue
	fi 
	
	# Move into directory 
	cd $FSSUBDIR/sub${i}/mri
	echo "Working on subject ${i}"	
	mri_convert aparc.a2009s+aseg.mgz a2009.nii.gz # mri_convert aparc.a2009s+aseg.mgz contains ALL rois in a single file. This converts to nii.gz 
	
		for j in {11101..11175} {12101..12175} ; do #These are the numbers of the ROIs for the left and right hemisphere. Identified by fsleyes a2009.nii.gz 
		
		# This cycles through the file creating thresholded and binary ROI for each area
		fslmaths a2009.nii.gz -thr ${j} -uthr ${j} -bin $FSSUBDIR/sub${i}/fsl_roi/sub${i}_region_2009_${j}.nii.gz 
		echo "ROI created  $FSSUBDIR/sub${i}/fsl_roi/sub${i}_region_2009_${j}.nii.gz "	
		done 
	
done
 