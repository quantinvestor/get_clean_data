## Getting and Cleaning Data Course Project

### INTRODUCTION

This repo contains the required "course project" files that the author developed as required study for the "Getting and Cleaning Data" R programming language course, which is the 3rd course Johns Hopkins University Data Science specialization series offered by Coursera.

Project purpose : demonstrate author's ability to collect, work with, and clean a data set
Goal            : prepare tidy data that can be used for later analysis

### CONTEXT

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article.

http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can be downloaded from the following website :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### REQUIREMENTS

Requirements for submittal of the project for the course are :

1) a tidy data set as described by the course's project assignment
2) a link to a Github repository with the script (run_analysis.R) for performing the analysis
3) a code book, called CodeBook.md, that describes the variables, the data, and any transformations or work performed to clean up the data.
4) A README.md (this file) in the GitHub repo with the project script(s). This repo explains how all of the scripts work and how they are connected.

### run_analysis.R

Upon execution, the R script named ```run_analysis.R``` will :

0. Download the project data from the "cloudfront.net" website specified above.
1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```reshape2``` and ```data.table```. 

### How to execute the R course project script, run_analysis.R 

1. Download ```run_analysis.R``` into the home directory on your local drive.
2. Run ```source("run_analysis.R")```, which will automatically create a directory ```./tmp/``` if it doesn't already exist. ```run_analysis.R``` does all it's work under the ```./tmp/``` directory. It will create a subdirectory, ```./tmp/data/``` under which it will generate a new file ```tiny_data.txt```.

### GitHub files :

1. README.md (this file)
2. CodeBook.md
3. run_analysis.R

