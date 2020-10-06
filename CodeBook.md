---
title: "Codebook"
output: html_document
---

```

# Variables #

### Identifiers ###

1. Subject : Code number used to identify each unique participant in the data collection

2. Activity : Identifier for the activity or activities each participant was involved in. The activities are limited to the list below:

   * WALKING
   * WALKING_UPSTAIRS
   * WALKING_DOWNSTAIRS
   * SITTING
   * STANDING
   * LAYING

### Feature Variables ###

The features selected for this database come from the Accelerometer and Gyroscope 3-axial raw signals:

  * TimeAccelerometer-XYZ
  * TimeGyroscope-XYZ. 

These Time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 H:

  * TimeBodyAccelerometer-XYZ
  * TimeGravityAccelerometer-XYZ 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals . 

  * TimeBodyAccelerometerJerk-XYZ 
  * TimeBodyGyroscopeJerk-XYZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:

  * TimeBodyAccelerometerMagnitude
  * TimeGravityAccelerometerMagnitude
  * TimeBodyAccelerometerJerkMagnitude
  * TimeBodyGyroscopeMagnitude
  * TimeBodyGyroscopeJerkMagnitude

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing: 

  * FrequencyBodyAccelerometer-XYZ
  * FrequencyBodyAccelerometerJerk-XYZ
  * FrequencyBodyGyroscope-XYZ
  * FrequencyBodyAccelerometerJerkMagnitude
  * FrequencyBodyGyroscopeMagnitude
  * FrequencyBodyGyroscopeJerkMagnitude

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Further Measurements ###

The features above are then subjected to further calculations using the folloinwg measures:

  * Mean: Averaged value
  * STD: Standard deviation of values

# Data Transformation Process #

The raw data is transformed and processed using the `run_analysis.R` script with the following steps.

### Data Preparation ###
  
  * The required libraries for the processing, `data.table` and 'dplyr' are loaded.
  * The script then checks for the required raw data files. The files would be downloaded and    unzipped if necessary. 
  * The required raw data files are then read into tables for further processing in R.
  * Column names would then be assigned to the tables from above for easier identification of data.
  
### Merge Training And Test Sets ###

  * Using `rbind`, merge the rows of training and test data for 
    + `subjects` data 
    + `x` data 
    + `y` data
    
  * Using cbind, merge the columns from `subjects`, `x`, and `y` into a combined data table.
  
### Extract Mean And Standard Deviation Variables ###

  * Using the `select()` function, extract data containing strings of "mean" and "STD"(standard deviation) from the merged data table, along with extracting the key identifiers `Subject` and `Activity`. 
  
### Use Descriptive Activity Names ###  

  * Using the descriptive labels from the raw data `activity_labels.txt`, replace the activity code numbers in the processed data table with the descriptive labels in the text file.
  
### Label variables appropriately ###

  * Using the `gsub()` function, replace all abbreviations with the proper terms and tidying up the words.
  
### Create A Independent Tidy Data Set With The Average Of Each Variable For Each Activity And Each Subjec ###

  * Using the `group_by' and 'funs(mean)' functions to calculate average of each variable for each activity and group them by the `Subject` and `Activity` identifiers.
  * use the `summarize_all()` function to create a summarized table for the resultant data table and write this clean data table into a text file named `CleanData.txt`.
  