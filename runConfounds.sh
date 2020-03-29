#!/bin/tcsh -xef

chmod +x Confounds.py
python3 Confounds.py

cd ~/Documents/1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [ -d "sub-$sub" ]
	then
		echo "Subject $sub folder found, converting tsv to 1D."
		cd sub-$sub/func/
    touch confounds_rall.1D
		1dcat confounds_rall.tsv > confounds_rall.1D
    cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
