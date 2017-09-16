#!/bin/bash


ROOT="/Volumes/Swan/hbm"


for REM in $(seq 1 100);do
	cp -fr $ROOT/mprage_fsl/one_$REM.nii.gz $ROOT/mprage_fsl/temp/
	cd $ROOT/mprage_fsl/temp/
	fslslice $ROOT/mprage_fsl/temp/one_$REM.nii.gz
		for i in $(seq -f '%04g' 0 50);do
			rm -fr $ROOT/mprage_fsl/temp/one_${REM}_slice_${i}.nii.gz
		done
	fslmerge -z $ROOT/mprage_fsl/temp/cut_one_${REM}.nii.gz $ROOT/mprage_fsl/temp/one_${REM}_slice*.nii.gz 
	rm -fr $ROOT/mprage_fsl/temp/one_${REM}_slice*.nii.gz 
	cp -fr $ROOT/mprage_fsl/temp/cut_one_${REM}.nii.gz $ROOT/mprage_fsl/
	cd $ROOT/mprage_fsl
done



