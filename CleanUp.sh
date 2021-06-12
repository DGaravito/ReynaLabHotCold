#!/bin/tcsh -xef

cd /Volumes/Reyna-Lab/Lab/HotCold/Databases/HC_1stHalfFunctional/Output/fmriprep
for sub in $(seq -w 1 132)
do
	if [ -d "sub-$sub" ]
	then
		echo "Subject $sub folder found"
	  cd sub-$sub/func/
		echo "Cleaning..."
		rm -vf errts.Added${sub}_AA1.BRIK
		rm -vf X_Start.xmat.1D
		rm -vf errts.ISDN${sub}_AA1+tlrc.BRIK
		rm -vf errts.ISDN${sub}_AA1+tlrc.HEAD
		rm -vf 3dDeconvolve.err
		rm -vf fitts.ISDN${sub}+tlrc.BRIK
		rm -vf fitts.ISDN${sub}+tlrc.HEAD
		rm -vf stats.ISDN${sub}+tlrc.BRIK
		rm -vf stats.ISDN${sub}+tlrc.HEAD
		rm -vf stats.REML_cmd
		rm -vf X_ISDN.jpg
		rm -vf X_ISDN.xmat.1D
		rm -vf errts.ISDN${sub}+tlrc.BRIK
		rm -vf errts.ISDN${sub}+tlrc.HEAD
		rm -vf errts.December${sub}+tlrc.BRIK
		rm -vf errts.December${sub}+tlrc.HEAD
		rm -vf fitts.December${sub}+tlrc.BRIK
		rm -vf fitts.December${sub}+tlrc.HEAD
		rm -vf stats.December${sub}+tlrc.BRIK
		rm -vf stats.December${sub}+tlrc.HEAD
		rm -vf X_December.jpg
		rm -vf X_December.xmat.1D
		rm -vf errts.Added${sub}_AA1+tlrc.BRIK
		rm -vf rm -vf errts.Added${sub}_AA1+tlrc.HEAD
		rm -vf X_Added.jpg
		rm -vf X_Added.xmat.1D
		rm -vf errts.Added${sub}+tlrc.BRIK
		rm -vf errts.Added${sub}+tlrc.HEAD
		rm -vf fitts.Added${sub}+tlrc.BRIK
		rm -vf fitts.Added${sub}+tlrc.HEAD
		rm -vf stats.Added${sub}+tlrc.BRIK
		rm -vf stats.Added${sub}+tlrc.HEAD
		rm -vf errts.Varun${sub}+tlrc.BRIK
		rm -vf errts.Varun${sub}+tlrc.HEAD
		rm -vf fitts.Varun${sub}+tlrc.BRIK
		rm -vf fitts.Varun${sub}+tlrc.HEAD
		rm -vf stats.Varun${sub}+tlrc.BRIK
		rm -vf stats.Varun${sub}+tlrc.HEAD
		rm -vf X_Varun.jpg
		rm -vf X_Varun.xmat.1D
		rm -vf errtsCheck.${sub}+tlrc.BRIK
		rm -vf errtsCheck.${sub}+tlrc.HEAD
		rm -vf fittsCheck.${sub}+tlrc.BRIK
		rm -vf fittsCheck.${sub}+tlrc.HEAD
		rm -vf statsCheck.${sub}+tlrc.BRIK
		rm -vf statsCheck.${sub}+tlrc.HEAD
		rm -vf statsCheck.REML_cmd
		rm -vf X_Check.xmat.1D
		rm -vf X_Check.jpg
		rm -vf errtsStart.${sub}+tlrc.BRIK
		rm -vf errtsStart.${sub}+tlrc.HEAD
		rm -vf fittsStart.${sub}+tlrc.BRIK
		rm -vf fittsStart.${sub}+tlrc.HEAD
		rm -vf statsStart.${sub}+tlrc.BRIK
		rm -vf statsStart.${sub}+tlrc.HEAD
		rm -vf statsStart.REML_cmd
		rm -vf X_Start.jpg
		cd ../..
	else
		echo "No subject $sub folder...moving on..."
	fi
done
