---
title: "Getting and Cleaning Data Course Project"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Introduction And Dataset ##

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The raw data has been separated into many various text files and this project serves to clean and organize/tidy up the collected raw datasets and provide a combined and streamlined information output for future users.


Download Link With The Raw Datasets Used In This Project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



More Info On The Dataset:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Project Files Summary ##

The repo contains a list of files with descriptions as per below:


1. **`README.MD`**: The current file which you are reading now which gives a introduction and summary of what this project is about.


2. **`CodeBook.md`**: A code book that describes the variables, the data, along with transformations that was performed using `run_analysis.R` to clean up the data.


3. **`run_analysis.R`**: The script which contains the code with which to process and transform the raw downloaded datasets into well organized and readable dataset output under `CleanData.txt`.This will be achieved using the following 5 steps:

    + Step 1:  Merge the training and the test sets to create one data set.
    
    + Step 2:  Extract only the measurements on the mean and standard deviation for each         measurement.
    
    + Step 3:  Use descriptive activity names to name the activities in the data set.
    
    + Step 4:  Appropriately label the data set with descriptive variable names.
    
    + Step 5:  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


4. **`CleanData.txt`**: Final result of the cleaned and organized dataset that is processed from the `run_analysis.R` script.
