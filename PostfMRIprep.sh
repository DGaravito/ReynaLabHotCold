#!/bin/tcsh -xef

echo "I don't care who you are or your span of participants because I'll just run stuff for everyone."
while true; do
    read -p "You ready to go? Remember, I'll run for everyone..." yn
    case $yn in
        [Yy]* ) echo "leggo."; break;;
        [Nn]* ) echo "smh."; exit;;
        * ) echo "Give me a yes or no; don't play me.";;
    esac
done

echo "Running Confounds.py to generate the confounds tsv for all participants..."
chmod +x Confounds.py
python3 Confounds.py

cd ~/Documents/1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd /sub-$sub/func/
		echo "Converting the confounds tsv to an AFNI 1D file..."
		touch confounds_rall.1D
		1dcat confounds_rall.tsv > confounds_rall.1D
		for run in $(seq -w 1 4)
		do
			echo "Demeaning run $run..."
			3dTstat -prefix rm.mean_r${run} sub-${sub}_run-${run}_MNI152_No2_Smooth.nii.gz
			3dcalc -a sub-${sub}_run-${run}_MNI152_No2_Smooth.nii.gz -b rm.mean_r${run}+tlrc.BRIK \
			-expr 'min(200, a/b*100)*step(a)*step(b)'           \
			-prefix sub-${sub}_run-${run}_Scaled.nii.gz
		done
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
