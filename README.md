# ProgrammingAssignment4
This repo contains one R script/function designed to load the UCI Machine Learning Human Activity Recognition Using Smartphones Data Set.

## Requirements
1. This function will download the UCI HAR zip file (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and save it to your working directory (named "UCI HAR Dataset.zip"). The function itself will extract the files from this zip archive.
2. This function requires the dplyr package to be installed.

## Usage
In order to run this function, just source run_analysis.R and call run_analysis().

This will return two data frames to your global environment: **uci_har** and **summary_har**.

For details on what is contained in **uci_har** please see the [uci_har.md](uci_har.md) file.

For details on what is contained in **summary_har** please see the summary_har.md file.
