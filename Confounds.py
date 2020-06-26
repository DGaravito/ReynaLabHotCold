#!/usr/bin/env python3

# This script is for making the confounds files that will be converted to 1D format for use in first-levels in AFNI

import os
import csv
import glob
import pandas as pd

PATH = input("Enter your path to your preprocessed data(e.g., /Users/DGaravito/Documents/1stHalfFunctional/Output/fmriprep): ")
path = PATH # set the path to the preprocessed data directory
subjects = [f.name for f in os.scandir(path) if f.is_dir()] # make a list of preprocessed subject folders
subjects.remove('logs')

for subj in subjects: # loop for each subject
    print ("current subject is: " + subj)
    path = PATH + "/" + subj + "/func" # set path to be current subject's functional folder
    w_rall = path + "/confounds_rall.csv" # this will be our file that has all the confounds we need, collapsed across runs. It's a csv so that it doesn't mess up the next for loop.
    with open(w_rall, 'w+') as csvfile: # actually create the file from the previous line.
        filewriter = csv.writer(csvfile, delimiter = ',', quotechar = '|', quoting = csv.QUOTE_MINIMAL)
        filewriter.writerow(['csf', 'white_matter', 'global_signal'])
    for infile in sorted(glob.glob(os.path.join(path, '*regressors.tsv'))): # loop for all tsv files in subject anatomical folder (in alphabetical order)
        print ("current file is: " + infile)
        tsv_read=pd.read_csv(infile, delim_whitespace = True) # read the current regressors infile
        tsv_read = tsv_read[['csf', 'white_matter', 'global_signal']] # select specific columns for regressors and overwrite
        with open(w_rall,'a') as write_csv: # overwrite the original comprehensive file so that you can repeat the process to add stuff from the other infiles
            write_csv.write(tsv_read.to_csv(sep = ',', header = False, index = False))
