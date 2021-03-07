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

3dmask_tool -fill_holes -inputs 	full_mask.resam.001+tlrc	\
	full_mask.resam.002+tlrc	\
	full_mask.resam.003+tlrc	\
	full_mask.resam.004+tlrc	\
	full_mask.resam.005+tlrc	\
	full_mask.resam.006+tlrc	\
	full_mask.resam.007+tlrc	\
	full_mask.resam.008+tlrc	\
	full_mask.resam.009+tlrc	\
	full_mask.resam.010+tlrc	\
	full_mask.resam.011+tlrc	\
	full_mask.resam.013+tlrc	\
	full_mask.resam.014+tlrc	\
	full_mask.resam.015+tlrc	\
	full_mask.resam.016+tlrc	\
	full_mask.resam.017+tlrc	\
	full_mask.resam.018+tlrc	\
	full_mask.resam.019+tlrc	\
	full_mask.resam.020+tlrc	\
	full_mask.resam.021+tlrc	\
	full_mask.resam.022+tlrc	\
	full_mask.resam.023+tlrc	\
	full_mask.resam.024+tlrc	\
	full_mask.resam.025+tlrc	\
	full_mask.resam.027+tlrc	\
	full_mask.resam.028+tlrc	\
	full_mask.resam.029+tlrc	\
	full_mask.resam.030+tlrc	\
	full_mask.resam.032+tlrc	\
	full_mask.resam.033+tlrc	\
	full_mask.resam.034+tlrc	\
	full_mask.resam.035+tlrc	\
	full_mask.resam.036+tlrc	\
	full_mask.resam.037+tlrc	\
	full_mask.resam.038+tlrc	\
	full_mask.resam.039+tlrc	\
	full_mask.resam.040+tlrc	\
	full_mask.resam.041+tlrc	\
	full_mask.resam.042+tlrc	\
	full_mask.resam.043+tlrc	\
	full_mask.resam.045+tlrc	\
	full_mask.resam.046+tlrc	\
	full_mask.resam.047+tlrc	\
	full_mask.resam.048+tlrc	\
	full_mask.resam.049+tlrc	\
	full_mask.resam.050+tlrc	\
	full_mask.resam.051+tlrc	\
	full_mask.resam.052+tlrc	\
	full_mask.resam.053+tlrc	\
	full_mask.resam.054+tlrc	\
	full_mask.resam.055+tlrc	\
	full_mask.resam.056+tlrc	\
	full_mask.resam.057+tlrc	\
	full_mask.resam.058+tlrc	\
	full_mask.resam.059+tlrc	\
	full_mask.resam.060+tlrc	\
	full_mask.resam.061+tlrc	\
	full_mask.resam.062+tlrc	\
	full_mask.resam.063+tlrc	\
	full_mask.resam.064+tlrc	\
	full_mask.resam.065+tlrc	\
	full_mask.resam.066+tlrc	\
	full_mask.resam.067+tlrc	\
	full_mask.resam.068+tlrc	\
	full_mask.resam.069+tlrc	\
	full_mask.resam.070+tlrc	\
	full_mask.resam.071+tlrc	\
	full_mask.resam.072+tlrc	\
	full_mask.resam.073+tlrc	\
	full_mask.resam.074+tlrc	\
	full_mask.resam.075+tlrc	\
	full_mask.resam.076+tlrc	\
	full_mask.resam.077+tlrc	\
	full_mask.resam.078+tlrc	\
	full_mask.resam.079+tlrc	\
	full_mask.resam.080+tlrc	\
	full_mask.resam.081+tlrc	\
	full_mask.resam.082+tlrc	\
	full_mask.resam.083+tlrc	\
	full_mask.resam.084+tlrc	\
	full_mask.resam.085+tlrc	\
	full_mask.resam.086+tlrc	\
	full_mask.resam.087+tlrc	\
	full_mask.resam.088+tlrc	\
	full_mask.resam.089+tlrc	\
	full_mask.resam.090+tlrc	\
	full_mask.resam.091+tlrc	\
	full_mask.resam.092+tlrc	\
	full_mask.resam.093+tlrc	\
	full_mask.resam.094+tlrc	\
	full_mask.resam.095+tlrc	\
	full_mask.resam.096+tlrc	\
	full_mask.resam.097+tlrc	\
	full_mask.resam.099+tlrc	\
	full_mask.resam.100+tlrc	\
	full_mask.resam.101+tlrc	\
	full_mask.resam.102+tlrc	\
	full_mask.resam.103+tlrc	\
	full_mask.resam.104+tlrc	\
	full_mask.resam.105+tlrc	\
	full_mask.resam.106+tlrc	\
	full_mask.resam.107+tlrc	\
	full_mask.resam.108+tlrc	\
	full_mask.resam.109+tlrc	\
	full_mask.resam.110+tlrc	\
	full_mask.resam.111+tlrc	\
	full_mask.resam.113+tlrc	\
	full_mask.resam.114+tlrc	\
	full_mask.resam.116+tlrc	\
	full_mask.resam.117+tlrc	\
	full_mask.resam.118+tlrc	\
	full_mask.resam.119+tlrc	\
	full_mask.resam.120+tlrc	\
	full_mask.resam.121+tlrc	\
	full_mask.resam.122+tlrc	\
	full_mask.resam.123+tlrc	\
	full_mask.resam.124+tlrc	\
	full_mask.resam.125+tlrc	\
	full_mask.resam.126+tlrc	\
	full_mask.resam.127+tlrc	\
	full_mask.resam.128+tlrc	\
	full_mask.resam.129+tlrc	\
	full_mask.resam.130+tlrc	\
	full_mask.resam.131+tlrc	\
	full_mask.resam.132+tlrc	\
	-union -prefix fullHC_mask

cp fullHC_mask+tlrc.HEAD /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/
cp fullHC_mask+tlrc.BRIK.gz /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep/
