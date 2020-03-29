#!/usr/bin/env python3

import os
import csv
import glob
import pandas as pd

path = '~/Documents/1stHalfFunctional/Output/fmriprep' # set the path to the preprocessed data directory
subjects = [f.name for f in os.scandir(path) if f.is_dir()] # make a list of preprocessed subject folders

for subj in subjects: # loop for each subject
    print ("current subject is: " + subj)
    path = '~/Documents/1stHalfFunctional/Output/fmriprep/sub-' + subj # set path to be current subject's folder
    w_rall = "confounds_rall.csv" # this will be our file that has all the confounds we need, collapsed across runs. It's a csv so that it doesn't mess up the next for loop.
    with open(w_rall, 'w+') as csvfile: # actually create the file from the previous line.
        filewriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        filewriter.writerow(['csf', 'white_matter', 'global_signal'])
    for infile in sorted(glob.glob(os.path.join(path, '*.tsv'))): # loop for all tsv files in subject anatomical folder (in alphabetical order)
        print ("current file is: " + infile)
        tsv_read=pd.read_tsv(infile,sep='\t') # read the current regressors infile
        tsv_read = tsv_read[['csf', 'white_matter', 'global_signal']] # select specific columns for regressors and overwrite
        rall_read = pd.read_csv(w_rall,sep=',') # read the file that will eventually have all the information on it
        rall_read.append(tsv_read) # take the stuff from the infile and add it to the comprehensive file
        with open(w_rall,'w+') as write_csv: # overwrite the original comprehensive file so that you can repeat the process to add stuff from the other infiles
            write_csv.write(rall_read.to_csv(sep=',', index=False))
