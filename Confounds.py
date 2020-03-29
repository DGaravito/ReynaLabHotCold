#!/usr/bin/env python3

import os
import glob
import pandas as pd

subjects = ['001',
'002'] # list of subjects that have preprocessed neuro data

for subj in subjects:# loop for each subject
    print ("current subject is: " + subj)
    path = '/Users/DGaravito/Documents/1stHalfFunctional/Output/fmriprep/sub-' + subj # set path to be current subject's folder
    w_filenameTSV = path + 'confounds_rall.tsv'
    for infile in glob.glob(os.path.join(path, '*.tsv') ): # loop for all tsv files in subject anatomical folder
        print ("current file is: " + infile)
        tsv_read=pd.read_tsv(infile,sep='\t') # read the current regressors infile
        tsv_read[['csf', 'white_matter', 'global_signal']] # select specific columns for regressors
        with open(w_filenameTSV,'w') as write_tsv:
            write_tsv.write(tsv_read.to_csv(sep='\t', index=False))
