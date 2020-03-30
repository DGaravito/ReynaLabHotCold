#!/bin/sh

cd ~/Documents/1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [ -d "sub-$sub" ]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/ || exit
		3dDeconvolve -input sub-${sub}_run-1_MNI152_AROMA_Scaled.nii.gz sub-${sub}_run-2_MNI152_AROMA_Scaled.nii.gz sub-${sub}_run-3_MNI152_AROMA_Scaled.nii.gz sub-${sub}_run-4_MNI152_AROMA_Scaled.nii.gz -local_times \
				-polort a 		\
				-GOFORIT 100		\
				-allzero_OK		\
				-num_stimts 12		\
				-stim_times 1 HC_01_Gist.txt 'BLOCK(7,1)'                  \
				-stim_label 1 Gist                                               \
				-stim_times 2 HC_01_GistCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 2 GistCandy                                               \
				-stim_times 3 HC_01_GistMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 3 GistMoney                                               \
				-stim_times 4 HC_01_Mixed.txt 'BLOCK(7,1)'                  \
				-stim_label 4 Mixed                                               \
				-stim_times 5 HC_01_MixedCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 5 MixedCandy                                               \
				-stim_times 6 HC_01_MixedMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 6 MixedMoney                                               \
				-stim_times 7 HC_02_Verbatim.txt 'BLOCK(7,1)'                  \
				-stim_label 7 Verbatim                                               \
				-stim_times 8 HC_02_VerbatimCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 8 VerbatimCandy                                               \
				-stim_times 9 HC_02_VerbatimMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 9 VerbatimMoney                                               \
				-stim_file 10 confounds_rall.1D'[0]' -stim_base 10 -stim_label 10 csf  \
				-stim_file 11 confounds_rall.1D'[1]' -stim_base 11 -stim_label 11 white_matter \
				-stim_file 12 confounds_rall.1D'[2]' -stim_base 12 -stim_label 12 global_signal   \
				-num_glt 18                                                    \
				-gltsym 'SYM: Verbatim -Gist'                                        \
				-glt_label 1 Verbatim-Gist                                                 \
				-gltsym 'SYM: Gist -Verbatim'                                        \
				-glt_label 2 Gist-Verbatim                                                 \
				-gltsym 'SYM: Verbatim -Mixed'                                        \
				-glt_label 3 Verbatim-Mixed                                                 \
				-gltsym 'SYM: Mixed -Verbatim'                                        \
				-glt_label 4 Mixed-Verbatim                                                 \
				-gltsym 'SYM: Gist -Mixed'                                        \
				-glt_label 5 Gist-Mixed                                                 \
				-gltsym 'SYM: Mixed -Gist'                                        \
				-glt_label 6 Mixed-Gist                                                 \
				-gltsym 'SYM: VerbatimCandy -GistCandy'                                        \
				-glt_label 7 VerbatimCandy-GistCandy                                                 \
				-gltsym 'SYM: GistCandy -VerbatimCandy'                                        \
				-glt_label 8 GistCandy-VerbatimCandy                                                 \
				-gltsym 'SYM: VerbatimCandy -MixedCandy'                                        \
				-glt_label 9 VerbatimCandy-MixedCandy                                                 \
				-gltsym 'SYM: MixedCandy -VerbatimCandy'                                        \
				-glt_label 10 MixedCandy-VerbatimCandy                                                 \
				-gltsym 'SYM: GistCandy -MixedCandy'                                        \
				-glt_label 11 GistCandy-MixedCandy                                                 \
				-gltsym 'SYM: MixedCandy -GistCandy'                                        \
				-glt_label 12 MixedCandy-GistCandy                                                 \
				-gltsym 'SYM: VerbatimMoney -GistMoney'                                        \
				-glt_label 13 VerbatimMoney-GistMoney                                                 \
				-gltsym 'SYM: GistMoney -VerbatimMoney'                                        \
				-glt_label 14 GistMoney-VerbatimMoney                                                 \
				-gltsym 'SYM: VerbatimMoney -MixedMoney'                                        \
				-glt_label 15 VerbatimMoney-MixedMoney                                                 \
				-gltsym 'SYM: MixedMoney -VerbatimMoney'                                        \
				-glt_label 16 MixedMoney-VerbatimMoney                                                 \
				-gltsym 'SYM: GistMoney -MixedMoney'                                        \
				-glt_label 17 GistMoney-MixedMoney                                                 \
				-gltsym 'SYM: MixedMoney -GistMoney'                                        \
				-glt_label 18 Mixed-Gist                                                 \
				-fout -tout -x1D X_VMG.xmat.1D -xjpeg X_VMG.jpg                          \
				-fitts fittsVMG.${sub}                                               \
				-errts errtsVMG.${sub}                                               \
				-bucket statsVMG.${sub}
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
