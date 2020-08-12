#!/bin/tcsh -xef

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		cd sub-$sub/func/
		echo "Subject $sub folder found"
		# creates a total mask from all the run masks; fill gaps and holes
		3dmask_tool -fill_holes -inputs sub-${sub}_task-framing_run-*_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz -union -prefix full_mask.${sub}
		3dresample -master sub-${sub}_task-framing_run-1_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz -prefix full_mask.resam.${sub} -input full_mask.${sub}+tlrc

		# create a more liberal mask by resampling the MNI templatee to your mask
		3dresample -master full_mask.resam.${sub}+tlrc -prefix rm.resam.group -input /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/mni152_2009_256.nii.gz

		# convert the above resampling to a binary mask; fill gaps and holes
		3dmask_tool -dilate_input 5 -5 -fill_holes -input rm.resam.group+tlrc -prefix mask_group
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
