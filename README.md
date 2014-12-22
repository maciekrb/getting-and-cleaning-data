## Getting and Cleaning Data Course
This repo contains a script that obtains a tidy dataset from a wearable computing data file available here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The scripts found in this repository perform 2 taks: 
  - Obtain a simplified tidy dataset from the original data
  - Obtain a tidy dataset presenting averages of all variables by activity and subject


## Usage
In order to obtain a tidy dataset from the original dataset, you must follow the following steps, from
the directory that contains the `UCI HAR Dataset`:
```R

# Import the source for transforming the datasource
source("https://github.com/maciekrb/getting-and-cleaning-data/blob/master/run_analysis.R")

# Obtain the data frame
tidy_dataset <- accelerometer_data.as.data.frame()

# Obtain the second dataset with averages by activity and subject
summary_dataset <- accelerometer_data.activity_averages()
```

The `accelerometer_data.as.data.frame()` function returns a data frame with the following
variables:

Var Name | Type | Desc
-----------------------
subject | character | Test subject label (1 - 30)
activity | character | Activity label, one of: walking, walking upstairs, walking downstairs, sitting, standing, laying
tBodyAcc_mean_X | numeric |
tBodyAcc_mean_Y | numeric |
tBodyAcc_mean_Z | numeric |
tGravityAcc_mean_Xnumeric |
tGravityAcc_mean_Y | numeric |
tGravityAcc_mean_Z | numeric |
tBodyAccJerk_mean_numeric X
tBodyAccJerk_mean_Y | numeric |
tBodyAccJerk_mean_Z | numeric |
tBodyGyro_mean_X| numeric |
tBodyGyro_mean_Y | numeric |
tBodyGyro_mean_Z | numeric |
tBodyGyroJerk_mean_X |numeric |
tBodyGyroJerk_mean_Y | numeric |
tBodyGyroJerk_mean_Z | numeric |
tBodyAccMag_mean | numeric |
tGravityAccMag_mean | numeric |
tBodyAccJerkMag_mean | numeric |
tBodyGyroMag_mean | numeric |
tBodyGyroJerkMag_mean | numeric |
fBodyAcc_mean_X | numeric |
fBodyAcc_mean_Y | numeric |
fBodyAcc_mean_Z | numeric |
fBodyAcc_meanFreq_X | numeric |
fBodyAcc_meanFreq_Y | numeric |
fBodyAcc_meanFreq_Z | numeric |
fBodyAccJerk_mean_X | numeric |
fBodyAccJerk_mean_Y | numeric |
fBodyAccJerk_mean_Z | numeric |
fBodyAccJerk_meanFreq_X | numeric |
fBodyAccJerk_meanFreq_Y | numeric |
fBodyAccJerk_meanFreq_Z | numeric |
fBodyGyro_mean_X | numeric |
fBodyGyro_mean_Y | numeric |
fBodyGyro_mean_Z | numeric |
fBodyGyro_meanFreq_X | numeric |
fBodyGyro_meanFreq_Y | numeric |
fBodyGyro_meanFreq_Z | numeric |
fBodyAccMag_mean | numeric |
fBodyAccMag_meanFreq | numeric |
fBodyBodyAccJerkMag_mean | numeric |
fBodyBodyAccJerkMag_meanFreq | numeric |
fBodyBodyGyroMag_mean | numeric |
fBodyBodyGyroMag_meanFreq | numeric |
fBodyBodyGyroJerkMag_mean | numeric |
fBodyBodyGyroJerkMag_meanFreq | numeric |
angletBodyAccMeangravity | numeric |
angletBodyAccJerkMeangravityMean | numeric |
angletBodyGyroMeangravityMean     | numeric |
angletBodyGyroJerkMeangravityMean | numeric |
angleXgravityMean | numeric |
angleYgravityMean | numeric |
angleZgravityMean | numeric |
tBodyAcc_std_X | numeric |
tBodyAcc_std_Y | numeric |
tBodyAcc_std_Z | numeric |
tGravityAcc_std_X | numeric |
tGravityAcc_std_Y | numeric |
tGravityAcc_std_Z | numeric |
tBodyAccJerk_std_X | numeric |
tBodyAccJerk_std_Y | numeric |
tBodyAccJerk_std_Z | numeric |
tBodyGyro_std_X | numeric |
tBodyGyro_std_Y | numeric |
tBodyGyro_std_Z | numeric |
tBodyGyroJerk_std_X | numeric |
tBodyGyroJerk_std_Y | numeric |
tBodyGyroJerk_std_Z | numeric |
tBodyAccMag_std | numeric |
tGravityAccMag_std | numeric |
tBodyAccJerkMag_std | numeric |
tBodyGyroMag_std | numeric |
tBodyGyroJerkMag_std | numeric |
fBodyAcc_std_X | numeric |
fBodyAcc_std_Y | numeric |
fBodyAcc_std_Z | numeric |
fBodyAccJerk_std_X | numeric |
fBodyAccJerk_std_Y | numeric |
fBodyAccJerk_std_Z | numeric |
fBodyGyro_std_X | numeric |
fBodyGyro_std_Y | numeric |
fBodyGyro_std_Z | |                numeric  
fBodyAccMag_std | numeric |
fBodyBodyAccJerkMag_std | |numeric  
fBodyBodyGyroMag_std | numeric |
fBodyBodyGyroJerkMag_std | numeric |


