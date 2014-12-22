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
  - clone the repository to your local drive (using git clone)
  - execute the following lines in R

```R

# Install the dplyr package if you don't have it
install.packages("dplyr")

source("path/to/getting-and-cleaning-data/run_analysis.R")

# Obtain the data frame
tidy_dataset <- accelerometer_data.as.data.frame()

# Obtain the second dataset with averages by activity and subject
summary_dataset <- accelerometer_data.activity_averages()
```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The `accelerometer_data.as.data.frame()` function returns a data frame with the following
variables:

  - subject
  - activity
  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

The __subject__ represents the label of the test subject from which the data is available range from 1 - 30.
The __activity__ represents a descriptive tag of the activity being reported by the readings: 
  - walking 
  - walking upstairs 
  - walking downstairs 
  - sitting 
  - standing
  - laying

The set of variables that were estimated from the signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
