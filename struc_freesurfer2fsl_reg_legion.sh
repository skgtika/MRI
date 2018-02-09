#!/bin/bash
# Author: N Sharma

# This script requires bedpost and recon-all output. 
# Run from the Legion login node

ROOT="/scratch/scratch/rmjlns1/shared" # The general directory
FSSUBDIR="$ROOT/freesurfer_subjects/subjects"

######################

cd $FSSUBDIR #cd into 

for i in {1..9} ; do # Alter the number depending upon the number of subjects

	cd $FSSUBDIR/sub${i} #the 'sub" is the prefix to the directory. Alter as required. 
	
	
	#Checks to see if bedpost directory exists
	if ls $FSSUBDIR/sub${i}/bedpost/ 1> /dev/null 2>&1; then
		 echo "OK: Output directory exists"
		 else
		 echo "Bedpost output is not located in the Freesurfer directory "
		 continue
	fi 
	
	# Move into directory 
	cd $FSSUBDIR/sub${i}/mri
	echo "Working on subject ${i}"	
	mkdir $FSSUBDIR/sub${i}/mri/nifti
	mri_convert $FSSUBDIR/sub${i}/mri/brain.mgz $FSSUBDIR/sub${i}/mri/nifti/brain_temp1.nii.gz
	fslswapdim $FSSUBDIR/sub${i}/mri/nifti/brain_temp1.nii.gz RL PA IS $FSSUBDIR/sub${i}/mri/nifti/brain.nii.gz # put it in the correct orientation

	mri_convert $FSSUBDIR/sub${i}/mri/orig.mgz $FSSUBDIR/sub${i}/mri/nifti/orig_temp1.nii.gz
	fslswapdim $FSSUBDIR/sub${i}/mri/nifti/orig_temp1.nii.gz RL PA IS $FSSUBDIR/sub${i}/mri/nifti/orig.nii.gz # put it in the correct orientation
	fslmaths $FSSUBDIR/sub${i}/mri/nifti/orig.nii.gz -bin $FSSUBDIR/sub${i}/mri/nifti/orig_bin.nii.gz
	fslmaths $FSSUBDIR/sub${i}/mri/nifti/brain.nii.gz -bin $FSSUBDIR/sub${i}/mri/nifti/brain_bin.nii.gz
	fslmaths $FSSUBDIR/sub${i}/mri/nifti/orig_bin.nii.gz -add $FSSUBDIR/sub${i}/mri/nifti/brain_bin.nii.gz -thr 2 -bin $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s_mask.nii.gz
	cp -fr $FSSUBDIR/sub${i}/mri/nifti/brain.nii.gz $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s.nii.gz
	cp -fr $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s_mask.nii.gz $FSSUBDIR/sub${i}/bedpost/
	cp -fr $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s.nii.gz $FSSUBDIR/sub${i}/bedpost/fs_sub${i}_brain_s.nii.gz
	
	# This current uses FLIRT. Should move to FNIRT at some point
	
	flirt -in $FSSUBDIR/sub${i}/bedpost/nodif_brain -ref  $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s.nii.gz -omat $FSSUBDIR/sub${i}/bedpost/xfms/diff2str.mat -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12 -cost mutualinfo
	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/str2diff.mat -inverse $FSSUBDIR/sub${i}/bedpost/xfms/diff2str.mat
	flirt -in $FSSUBDIR/sub${i}/mri/nifti/fs_sub${i}_brain_s.nii.gz -ref /app/fsl/fsl-4.1.7/data/standard/MNI152_T1_2mm_brain -omat $FSSUBDIR/sub${i}/bedpost/xfms/str2standard.mat -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12 -cost corratio
	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/standard2str.mat -inverse $FSSUBDIR/sub${i}/bedpost/xfms/str2standard.mat
	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/diff2standard.mat -concat $FSSUBDIR/sub${i}/bedpost/xfms/str2standard.mat $ROOT1/${k}_${i}.bedpostX/xfms/diff2str.mat
	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/standard2diff.mat -inverse $FSSUBDIR/sub${i}/bedpost/xfms/diff2standard.mat

	tkregister2 --mov $FSSUBDIR/sub${i}/mri/orig.mgz --targ $FSSUBDIR/sub${i}/mri/rawavg.mgz --regheader --reg junk --fslregout $FSSUBDIR/sub${i}/bedpost/xfms/freesurfer2struct.mat --noedit

# Do not feel we need this section at the moment. But has been modified incase

#	bet $FSSUBDIR/sub${i}/mri/nifti/brain.nii.gz $FSSUBDIR/sub${i}/mri/nifti/struct_brain.nii.gz 
	
#	if ls $FSSUBDIR/sub${i}/dwi/ 1> /dev/null 2>&1; then
#		 echo "OK: DWI directory exists"
#		 else
#		 echo "DWI output is not located in the Freesurfer directory "
#		 continue
#	fi 
	
#	flirt -in $FSSUBDIR/sub${i}/dwi -ref $FSSUBDIR/sub${i}/mri/nifti/struct_brain.nii.gz -omat $FSSUBDIR/sub${i}/bedpost/xfms/fa2struct.mat
#	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/struct2fa.mat -inverse $FSSUBDIR/sub${i}/bedpost/xfms/fa2struct.mat
#	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/fa2freesurfer.mat -concat $FSSUBDIR/sub${i}/bedpost/xfms/struct2freesurfer.mat fa2struct.mat
#	convert_xfm -omat $FSSUBDIR/sub${i}/bedpost/xfms/freesurfer2fa.mat -inverse $FSSUBDIR/sub${i}/bedpost/xfms/fa2freesurfer.mat
	
	
done
 
 
 