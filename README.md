## Getting and Cleaning Data Course
This repo contains a script that obtains a tidy dataset from a wearable computing data file available here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The scripts found in this repository perform 2 taks: 
  - Obtain a simplified tidy dataset from the original data
  - Obtain a tidy dataset presenting a summary of all variables by activity and subject


## Usage
In order to obtain a tidy dataset from the original data do the following
  - Clone the repository to your local drive (using git clone)
  - `source` the run_analysis.R script 
  - Run the following code

```R

# Install the dplyr package if you don't have it
install.packages("dplyr")

source("run_analysis.R")

# Obtain the data frame
tidy_dataset <- accelerometer_data.as.data.frame()

# Obtain the second dataset with averages by activity and subject
# The summarized dataset can now be obtained by calling the above function and
# performing simple operations

by_act_subj <- group_by(tidy_dataset, activity, subject)
subject_activity_summary <- by_act_subj %>% 
    summarise_each(funs(mean)) %>%
    arrange(subject, activity)

# Finally the tidy dataset can be exported as follows
write.table(subject_activity_summary, file="activity_summaries.txt", row.name=FALSE)

```

# Code Book

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The variables are grouped in 2 main domains:

### Time domain
All variable names including the `time` suffix at the end of the variable name. These were
were captured at a constant rate of 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (BodyAcc and GravityAcc) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (BodyAccJerk and BodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag). 

### Frequency domain
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing BodyAcc, BodyAccJerk, BodyGyro, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag. (Note the "freq" suffix denoting the frequency domain). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Only **Mean and Standard deviation** measurments were picked from the resulting data and
these were subsequently summarized by calculating a **mean** for every activity for
every subject.


| Variable name | Description |
|---------------|-------------|
| subject | label of the test subject from which the data is available range from 1 - 30| |
| activity | descriptive tag of the activity being reported by the readings: walking, walking upstairs, walking downstairs, sitting, standing or laying | 
| BodyAcc.mean.(X,Y,Z).time | | 
| BodyAcc.std.(X,Y,Z).time | | 
| GravityAcc.mean.(X,Y,Z).time | | 
| GravityAcc.std.(X,Y,Z).time | | 
| BodyAccJerk.mean.(X,Y,Z).time | | 
| BodyAccJerk.std.(X,Y,Z).time | | 
| BodyGyro.mean.(X,Y,Z).time | | 
| BodyGyro.std.(X,Y,Z).time | | 
| BodyGyroJerk.mean.(X,Y,Z).time | | 
| BodyGyroJerk.std.(X,Y,Z).time | | 
| BodyAccMag.mean.time | | 
| BodyAccMag.std.time | | 
| GravityAccMag.mean.time | | 
| GravityAccMag.std.time | | 
| BodyAccJerkMag.mean.time | |
| BodyAccJerkMag.std.time | |
| BodyGyroMag.mean.time | |
| BodyGyroMag.std.time | |
| BodyGyroJerkMag.mean.time | |
| BodyGyroJerkMag.std.time | |
| BodyAcc.mean.(X,Y,Z).freq | |
| BodyAcc.std.(X,Y,Z).freq | |
| BodyAcc.meanFreq.(X,Y,Z).freq | |
| BodyAccJerk.mean.(X,Y,Z).freq | |
| BodyAccJerk.std.(X,Y,Z).freq | |
| BodyAccJerk.meanFreq.(X,Y,Z).freq | |
| BodyGyro.mean.(X,Y,Z).freq | |
| BodyGyro.std.(X,Y,Z).freq | |
| BodyGyro.meanFreq.(X,Y,Z).freq | |
| BodyAccMag.mean.freq | |
| BodyAccMag.std.freq | |
| BodyAccMag.meanFreq.freq | |
| BodyBodyAccJerkMag.mean.freq | |
| BodyBodyAccJerkMag.std.freq | |
| BodyBodyAccJerkMag.meanFreq.freq | |
| BodyBodyGyroMag.mean.freq | |
| BodyBodyGyroMag.std.freq | |
| BodyBodyGyroMag.meanFreq.freq | |
| BodyBodyGyroJerkMag.mean.freq | |
| BodyBodyGyroJerkMag.std.freq | |
| BodyBodyGyroJerkMag.meanFreqanFreq.freq | |
