library(dplyr)

accelerometer_data.as.data.frame <- function() {
    # Builds a tidy data set based on data available at:
    # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    # http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    # Returns:
    #   data.frame
    
    # Load relevant files and bind in a single data frame
    subjects <- read.table("UCI HAR Dataset//test//subject_test.txt", colClasses=c("integer"), col.names=c("subject"))
    activities <- read.table("UCI HAR Dataset//test//y_test.txt", colClasses=c("integer"), col.names=c("activity"))
    features <- read.table("UCI HAR Dataset//test//X_test.txt", colClasses=c("numeric"))
    
    # Convert the activites to factors according to given reference (activity_labels.txt)
    activities$activity <- as.factor(activities$activity)
    levels(activities$activity) <- c("walking",  "walking upstairs",  "walking downstairs",  "sitting",  "standing",  "laying")
    
    # There are repeated column names (fBodyAcc-bandsEnergy()-1,8, 382 fBodyAccJerk-bandsEnergy()-1,8, etc )
    # So we get rid of those columns first
    features <- features[, c(1:302, 345:381, 424:460, 503:561)]
    
    # Load feature names, exclude the removed column names and fix the names a bit
    feature_names <- read.table("UCI HAR Dataset//features.txt", stringsAsFactors = FALSE)
    feature_names <- feature_names[c(1:302, 345:381, 424:460, 503:561), ]
    fnames <- gsub(",", "_", feature_names[[2]])
    fnames <- gsub("\\(\\)", " ", fnames)
    fnames <- gsub("[^0-9a-zA-Z-]", "" ,fnames)
    fnames <- gsub("-", "_", fnames)
    names(features) <- fnames
    
    full_data <- tbl_dt(cbind(subjects, activities, features))
    
    # Choose mean and std dev columns only
    full_data %>% 
        select(subject, activity, contains("mean", ignore.case = TRUE), contains("std", ignore.case = TRUE))
}

accelerometer_data.activity_averages <- function() {
    # Summarizes variable date as an average per activity and subjects 
    # for every variable obtained in the tidy the dataset
    # Returns
    #   data.frame 
    features <- accelerometer_data.as.data.frame()
    by_act_subj <- group_by(features, activity, subject)
    by_act_subj %>% 
        summarise_each(funs(mean))
}
