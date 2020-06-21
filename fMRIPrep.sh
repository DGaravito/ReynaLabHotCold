#!/bin/tcsh -xef

read -p "Hello, who am I talking to? " varname
echo "It's nice to meet you $varname. We are now going to make a range of participants to run through fMRIPrep. Keep in mind that each participant takes about 9 hours."
read -p "What is the subject number of the first subject you want to preprocess? Note: Just enter a number without extra zeros. For example, for sub-001, enter 1. " start
read -p "Perfect. $start will be the first subject. What is the subject number of the last subject you want to preprocess? Remember, if you want to end at sub-092, enter 92. " end

while true; do
    read -p "Okay, so your span will start at $start and end at $end. You ready to go? " yn
    case $yn in
        [Yy]* ) echo "esketit $varname."; break;;
        [Nn]* ) echo "Well I guess you screwed this up, $varname. My disappointment is immeasureable, and my day is ruined."; exit;;
        * ) echo "Please answer yes or no, $varname; you're making me upset. ";;
    esac
done

cd ~/Documents/1stHalfFunctional/Data-BIDS
for sub in $(seq -f "%03g" $start $end)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/
		for run in $(seq -w 1 4)
		do
    	echo "Trimming 2 dummy scans from run $run..."
      3dTcat -prefix sub-${sub}_task-framing_run-${run}_bold_No2.nii.gz sub-${sub}_task-framing_run-${run}_bold.nii.gz'[2..$]'
			echo "Removing original to maintain BIDS structure"
			rm sub-${sub}_task-framing_run-${run}_bold.nii.gz
			echo "Renaming new to match original"
			mv sub-${sub}_task-framing_run-${run}_bold_No2.nii.gz sub-${sub}_task-framing_run-${run}_bold.nii.gz
		done
		echo "Preprocessing $sub with fMRIPrep (Estaban et al., 2018)"
		fmriprep-docker ~/Documents/1stHalfFunctional/Data-BIDS ~/Documents/1stHalfFunctional/Output --fs-license-file ~/Applications/freesurfer/license.txt --dummy-scans 0 --use-aroma --participant_label ${sub}
    cd ../..
  else
    echo "No subject $sub folder...moving on..."
  fi
done
