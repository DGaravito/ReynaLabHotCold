#!/bin/sh

cd /Volumes/reynalab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [ -d "sub-$sub" ]
	then
		echo "Subject $sub folder found"
		cd sub-$sub/func/ || exit
		3dDeconvolve -input sub-${sub}_run-1_Scaled.nii.gz sub-${sub}_run-2_Scaled.nii.gz sub-${sub}_run-3_Scaled.nii.gz sub-${sub}_run-4_Scaled.nii.gz -local_times \
				-mask full_mask.resam.${sub}+tlrc \
				-polort a 		\
				-GOFORIT 100		\
				-allzero_OK		\
				-num_stimts 11		\
				-stim_times 1 HC_01_Framing.txt 'BLOCK(7,1)'                  \
				-stim_label 1 Framing                                               \
				-stim_times 2 HC_02_NoFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 2 NoFraming                                               \
				-stim_times 3 HC_02_MFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 3 MixedFraming                                               \
				-stim_times 4 HC_01_MNoFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 4 MixedNoFraming                                               \
				-stim_times 5 HC_02_GFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 5 GistFraming                                               \
				-stim_times 6 HC_01_GNoFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 6 GistNoFraming                                               \
				-stim_times 7 HC_02_VFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 7 VerbatimFraming                                               \
				-stim_times 8 HC_01_VNoFraming.txt 'BLOCK(7,1)'                  \
				-stim_label 8 VerbatimNoFraming                                               \
				-stim_file 9 confounds_rall.1D'[0]' -stim_base 9 -stim_label 9 csf  \
				-stim_file 10 confounds_rall.1D'[1]' -stim_base 10 -stim_label 10 white_matter \
				-stim_file 11 confounds_rall.1D'[2]' -stim_base 11 -stim_label 11 global_signal   \
				-num_glt 8                                                    \
				-gltsym 'SYM: Framing -NoFraming'                                        \
				-glt_label 1 Framing-NoFraming                                                 \
				-gltsym 'SYM: NoFraming -Framing'                                        \
				-glt_label 2 NoFraming-Framing                                                 \
				-gltsym 'SYM: GistFraming -GistNoFraming'                                        \
				-glt_label 3 GistFraming-GistNoFraming                                                 \
				-gltsym 'SYM: GistNoFraming -GistFraming'                                        \
				-glt_label 4 GistNoFraming-GistFraming                                                 \
				-gltsym 'SYM: MixedFraming -MixedNoFraming'                                        \
				-glt_label 5 MixedFraming-MixedNoFraming                                                 \
				-gltsym 'SYM: MixedNoFraming -MixedFraming'                                        \
				-glt_label 6 MixedNoFraming-MixedFraming                                                 \
				-gltsym 'SYM: VerbatimFraming -GistNoFraming'                                        \
				-glt_label 7 VerbatimFraming-GistNoFraming                                                 \
				-gltsym 'SYM: GistNoFraming -VerbatimFraming'                                        \
				-glt_label 8 GistNoFraming-VerbatimFraming                                                 \
				-fout -tout -x1D X_Start.xmat.1D -xjpeg X_Start.jpg                          \
				-fitts fittsStart.${sub}                                               \
				-errts errtsStart.${sub}                                               \
				-bucket statsStart.${sub}
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
