#!/bin/tcsh -xef

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/
		for run in $(seq -w 1 4)
		do
			echo "Demeaning run $run..."
			3dTstat -prefix rm.mean_r${run} sub-${sub}_task-framing_run-${run}_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz
			3dcalc -a sub-${sub}_task-framing_run-${run}_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz -b rm.mean_r${run}+tlrc.BRIK \
			-expr 'min(200, a/b*100)*step(a)*step(b)'           \
			-prefix sub-${sub}_run-${run}_Scaled.nii.gz
		done
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
