#!/bin/bash


for k in {1..17} ; do
mkdir avid_${k}
cd avid_${k}
mkdir  dti_300 dti_2000 dti_700 struct fieldmap_1 fieldmap_2 
cd ..
done