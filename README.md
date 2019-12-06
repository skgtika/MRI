# MRI

Please check the ROOT and directories match your current structure. 
It requires the file ntag.txt that contains the padded subject numbers (ADNIDOD)

The order of the scripts for freesurfer are: 

Each script will need to be moved into your legion directory (scp or ftp) and THEN made into an executable file. 

syntax is 

chmod a+x SCRIPTNAME

The script is then ran by ./SCRIPTNAME

1. struc_CHECK_pre_prep_legion_ADNIDOD.sh

This check to make sure that the correct subject directories exist.

2. struc_pre_prep_legion_ADNIDOD.sh

This moves the files over to a defined directory and moves them from sagital to axial in the process. 

3. struc_freesurfer_ADNI_DOD_directory_prep.sh

This makes the freesurfer directory and then copies over the structural scan over and then it's ready for recon-all.
 