#!/bin/tcsh -xef

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [ -d "sub-$sub" ]
	then
		echo "Subject $sub folder found"
	  cd sub-$sub/func/
		echo "Cleaning..."
		rm -vf sub-${sub}_task-framing_run-${run}_bold.nii.gz
		rm -vf mask_group+tlrc.BRIK.gz
		rm -vf mask_group+tlrc.HEAD
		rm -vf rm.resam.group+tlrc.BRIK
		rm -vf rm.resam.group+tlrc.HEAD
		rm -vf full_mask.${sub}+tlrc.BRIK.gz
		rm -vf full_mask.${sub}+tlrc.HEAD
		rm -vf errtsVMG.${sub}+tlrc.BRIK
		rm -vf errtsVMG.${sub}+tlrc.HEAD
		rm -vf fittsVMG.${sub}+tlrc.BRIK
		rm -vf fittsVMG.${sub}+tlrc.HEAD
		rm -vf statsVMG.${sub}+tlrc.BRIK
		rm -vf statsVMG.${sub}+tlrc.HEAD
		rm -vf statsVMG.REML_cmd
		rm -vf X_VMG.jpg
		rm -vf X_VMG.xmat.1D
		rm -vf errtsPresent.${sub}+tlrc.BRIK
		rm -vf errtsPresent.${sub}+tlrc.HEAD
		rm -vf fittsPresent.${sub}+tlrc.BRIK
		rm -vf fittsPresent.${sub}+tlrc.HEAD
		rm -vf statsPresent.${sub}+tlrc.BRIK
		rm -vf statsPresent.${sub}+tlrc.HEAD
		rm -vf statsPresent.REML_cmd
		rm -vf X_Present.jpg
		rm -vf X_Present.xmat.1D
		rm -vfd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/sub-${sub}/func/stimuli
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
