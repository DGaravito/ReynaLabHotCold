cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep

for sub in $(seq -w 1 132)
do
	if [[ -d "sub-$sub" ]]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/
    cp full_mask.resam.${sub}+tlrc.HEAD /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/Masks
    cp full_mask.resam.${sub}+tlrc.BRIK.gz /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/Masks
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/Masks

3dmask_tool -fill_holes -inputs full_mask.resam.???+tlrc -union -prefix fullHC_mask

cp fullHC_mask+tlrc.HEAD /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/
cp fullHC_mask+tlrc.BRIK.gz /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/
