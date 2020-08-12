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
				-num_stimts 27		\
				-stim_times 1 HC_01_Gain.txt 'BLOCK(7,1)'                  \
				-stim_label 1 Gain                                               \
				-stim_times 2 HC_02_Loss.txt 'BLOCK(7,1)'                  \
				-stim_label 2 Loss                                               \
				-stim_times 3 HC_01_Risk.txt 'BLOCK(7,1)'                  \
				-stim_label 3 Risk                                               \
				-stim_times 4 HC_02_Sure.txt 'BLOCK(7,1)'                  \
				-stim_label 4 Sure                                               \
				-stim_times 5 HC_02_LargeGain.txt 'BLOCK(7,1)'                  \
				-stim_label 5 LargeGain                                               \
				-stim_times 6 HC_02_LargeLoss.txt 'BLOCK(7,1)'                  \
				-stim_label 6 LargeLoss                                               \
				-stim_times 7 HC_01_SmallGain.txt 'BLOCK(7,1)'                  \
				-stim_label 7 SmallGain                                               \
				-stim_times 8 HC_01_SmallLoss.txt 'BLOCK(7,1)'                  \
				-stim_label 8 SmallLoss                                               \
				-stim_times 9 HC_01_GainRisk.txt 'BLOCK(7,1)'                  \
				-stim_label 9 GainRisk                                               \
				-stim_times 10 HC_02_GainSure.txt 'BLOCK(7,1)'                  \
				-stim_label 10 GainSure                                               \
				-stim_times 11 HC_01_LossRisk.txt 'BLOCK(7,1)'                  \
				-stim_label 11 LossRisk                                               \
				-stim_times 12 HC_02_LossSure.txt 'BLOCK(7,1)'                  \
				-stim_label 12 LossSure                                               \
				-stim_times 13 HC_01_SmallGainCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 13 SmallGainCandy                                               \
				-stim_times 14 HC_01_SmallGainMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 14 SmallGainMoney                                               \
				-stim_times 15 HC_01_SmallLossCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 15 SmallLossCandy                                               \
				-stim_times 16 HC_01_SmallLossMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 16 SmallLossMoney                                               \
				-stim_times 17 HC_02_LargeGainCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 17 LargeGainCandy                                               \
				-stim_times 18 HC_02_LargeGainMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 18 LargeGainMoney                                               \
				-stim_times 19 HC_02_LargeLossCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 19 LargeLossCandy                                               \
				-stim_times 20 HC_02_LargeLossMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 20 LargeLossMoney                                               \
				-stim_times 21 HC_01_SmallFramingCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 21 SmallFramingCandy                                               \
				-stim_times 22 HC_01_SmallFramingMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 22 SmallFramingMoney                                               \
				-stim_times 23 HC_02_LargeFramingCandy.txt 'BLOCK(7,1)'                  \
				-stim_label 23 LargeFramingCandy                                               \
				-stim_times 24 HC_02_LargeFramingMoney.txt 'BLOCK(7,1)'                  \
				-stim_label 24 LargeFramingMoney                                               \
				-stim_file 25 confounds_rall.1D'[0]' -stim_base 25 -stim_label 25 csf  \
				-stim_file 26 confounds_rall.1D'[1]' -stim_base 26 -stim_label 26 white_matter \
				-stim_file 27 confounds_rall.1D'[2]' -stim_base 27 -stim_label 27 global_signal   \
				-num_glt 22                                                    \
				-gltsym 'SYM: Gain -Loss'                                        \
				-glt_label 1 Gain-Loss                                                 \
				-gltsym 'SYM: Loss -Gain'                                        \
				-glt_label 2 Loss-Gain                                                 \
				-gltsym 'SYM: Risk -Sure'                                        \
				-glt_label 3 Risk-Sure                                                 \
				-gltsym 'SYM: Sure -Risk'                                        \
				-glt_label 4 Sure-Risk                                                 \
				-gltsym 'SYM: GainRisk -GainSure'                                        \
				-glt_label 5 GainRisk-GainSure                                                 \
				-gltsym 'SYM: GainSure -GainRisk'                                        \
				-glt_label 6 GainSure-GainRisk                                                 \
				-gltsym 'SYM: LossRisk -LossSure'                                        \
				-glt_label 7 LossRisk-LossSure                                                 \
				-gltsym 'SYM: LossSure -LossRisk'                                        \
				-glt_label 8 LossSure-LossRisk                                                 \
				-gltsym 'SYM: LargeGain -SmallGain'                                        \
				-glt_label 9 LargeGain-SmallGain                                                 \
				-gltsym 'SYM: LargeLoss -SmallLoss'                                        \
				-glt_label 10 LargeLoss-SmallLoss                                                 \
				-gltsym 'SYM: SmallGainCandy -LargeGainCandy'                                        \
				-glt_label 11 SmallGainCandy-LargeGainCandy                                                 \
				-gltsym 'SYM: LargeGainCandy -SmallGainCandy'                                        \
				-glt_label 12 LargeGainCandy-SmallGainCandy                                                 \
				-gltsym 'SYM: SmallLossCandy -LargeLossCandy'                                        \
				-glt_label 13 SmallLossCandy-LargeLossCandy                                                 \
				-gltsym 'SYM: LargeLossCandy -SmallLossCandy'                                        \
				-glt_label 14 LargeLossCandy-SmallLossCandy                                                 \
				-gltsym 'SYM: SmallFramingCandy -LargeFramingCandy'                                        \
				-glt_label 15 SmallFramingCandy-LargeFramingCandy                                                 \
				-gltsym 'SYM: LargeFramingCandy -SmallFramingCandy'                                        \
				-glt_label 16 LargeFramingCandy-SmallFramingCandy                                                 \
				-gltsym 'SYM: SmallGainMoney -LargeGainMoney'                                        \
				-glt_label 17 SmallGainMoney-LargeGainMoney                                                 \
				-gltsym 'SYM: LargeGainMoney -SmallGainMoney'                                        \
				-glt_label 18 LargeGainMoney-SmallGainMoney                                                 \
				-gltsym 'SYM: SmallLossMoney -LargeLossMoney'                                        \
				-glt_label 19 SmallLossMoney-LargeLossMoney                                                 \
				-gltsym 'SYM: LargeLossMoney -SmallLossMoney'                                        \
				-glt_label 20 LargeLossMoney-SmallLossMoney                                                 \
				-gltsym 'SYM: SmallFramingMoney -LargeFramingMoney'                                        \
				-glt_label 21 SmallFramingMoney-LargeFramingMoney                                                 \
				-gltsym 'SYM: LargeFramingMoney -SmallFramingMoney'                                        \
				-glt_label 22 LargeFramingMoney-SmallFramingMoney                                                 \
				-fout -tout -x1D X_Check.xmat.1D -xjpeg X_Check.jpg                          \
				-fitts fittsCheck.${sub}                                               \
				-errts errtsCheck.${sub}                                               \
				-bucket statsCheck.${sub}
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
