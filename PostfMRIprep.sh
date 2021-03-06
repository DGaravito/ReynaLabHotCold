#!/bin/tcsh -xef

echo "I don't care who you are or your span of participants because I'll just run stuff for everyone."

echo "I'm going to check to see if you installed pandas..."
if python3 -c "import pkgutil; exit(not pkgutil.find_loader('pandas'))"; then
    echo "Pandas found. Nice."
else
    echo "Why isn't pandas installed? I'll install it for you, rookie >:/"
    pip3 install pandas
fi

while true; do
    read -p "You ready to go? Remember, I'll run for everyone... " yn
    case $yn in
        [Yy]* ) echo "leggo."; break;;
        [Nn]* ) echo "smh."; exit;;
        * ) echo "Give me a yes or no; don't play me. ";;
    esac
done

echo "Running Confounds.py to generate the overall confounds csv for all participants..."
chmod +x Confounds.py
python3 Confounds.py

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/
		echo "Converting the confounds tsv to an AFNI 1D file..."
		touch confounds_rall.1D # creating 1D file
		1dcat confounds_rall.csv > confounds_rall.1D # putting info from the csv into the 1D file
    for run in $(seq -w 1 4)
		do
      echo "Demeaning run $run..."
			3dTstat -prefix rm.mean_r${run} sub-${sub}_task-framing_run-${run}_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz
			3dcalc -a sub-${sub}_task-framing_run-${run}_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz -b rm.mean_r${run}+tlrc.BRIK \
			-expr 'min(200, a/b*100)*step(a)*step(b)'           \
			-prefix sub-${sub}_run-${run}_Scaled.nii.gz
		done
    echo "Creating masks for $sub..."
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
