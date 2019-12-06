#!/bin/bash

module load fsl/5.0.9
source $FSLDIR/etc/fslconf/fsl.sh
module load xorg-utils/X11R7.7
module load freesurfer/5.3.0

# this directory must the location of the .nii files
ROOT="/home/skgtika/Scratch"
ROOTOUT="/home/skgtika/Scratch/myadnidod" # this is the directory where the files will be copied. 
filename='/home/skgtika/Scratch/ntag.txt'  # Load NTAGS this contains files themselves.
filelines=`cat $filename` #Get each line

cd $ROOT
counter=1



for REM in $filelines ; do # Loop through at the subject level using N-tag	 
	fslswapdim $ROOT/ADNIDOD/ADNIDOD/$REM/Sag_IR-FSPGR/*/*/*IR-FSPGR*.nii LR PA IS $ROOTOUT/ADNI_DOD_struc_${counter}.nii.gz
	counter=$((counter+1))
done

