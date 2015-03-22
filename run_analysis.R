library(dplyr)

accelerometer_data.as.data.frame <- function() {
    # Builds a tidy data set based on data available at:
    # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    # http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    # Returns:
    #   data.frame
    
    # Download data if unavailable
    if(!file.exists("UCI HAR Dataset")){
        fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="UCI_HAR_Dataset.zip", method="curl")
        unzip("UCI_HAR_Dataset.zip", exdir=".")
    }
    
    # Load relevant files and bind in a single data frame
    subjects_test <- read.table("UCI HAR Dataset//test//subject_test.txt", colClasses=c("integer"), col.names=c("subject"))
    activities_test <- read.table("UCI HAR Dataset//test//y_test.txt", colClasses=c("integer"), col.names=c("activity"))
    features_test <- read.table("UCI HAR Dataset//test//X_test.txt", colClasses=c("numeric"))
    
    subjects_train<- read.table("UCI HAR Dataset//train//subject_train.txt", colClasses=c("integer"), col.names=c("subject"))
    activities_train<- read.table("UCI HAR Dataset//train//y_train.txt", colClasses=c("integer"), col.names=c("activity"))
    features_train<- read.table("UCI HAR Dataset//train//X_train.txt", colClasses=c("numeric"))
    
    subjects <- rbind(subjects_test, subjects_train)
    activities<- rbind(activities_test, activities_train)
    features <- rbind(features_test, features_train)
    
    # Convert the activites to factors according to given reference (activity_labels.txt)
    activities$activity <- as.factor(activities$activity)
    levels(activities$activity) <- c("walking",  "walking upstairs",  "walking downstairs",  "sitting",  "standing",  "laying")
    
    # We are interested in measurments on the mean and stdev, so we extract the 
    # corresponding columns from the features data frame
    feature_names <- read.table("UCI HAR Dataset//features.txt", stringsAsFactors = FALSE)
    mean_and_std_cols <- grep("mean\\(\\)|std\\(\\)|meanFreq\\(\\)", feature_names$V2, 
                              value=FALSE, ignore.case=TRUE, perl=TRUE)
    features <- features[, mean_and_std_cols]
    
    # Make better names for the variables
    name_formatter <- function(name){
        
        # remove parenthesis
        name <- gsub("\\(\\)", "", name)
        
       # t denotes time domain signals, f denotes frequency domain signals    
       if(grepl("^t", name)){
          domain <- "time"
       } else {
          domain <- "freq" 
       }
       name <- substr(name, 2, nchar(name))
       paste0(gsub("-",".", name), ".", domain)
    }
    fnames <- feature_names[mean_and_std_cols, 2]
    fnames <- sapply(fnames, name_formatter, USE.NAMES=FALSE)
    names(features) <- fnames
    
    # Return a new data frame with normalized data
    tbl_dt(cbind(subjects, activities, features))
}

# The summarized dataset can now be obtained by calling the above function and
# performing simple operations

feature_dataset <- accelerometer_data.as.data.frame()
by_act_subj <- group_by(feature_dataset, activity, subject)
subject_activity_summary <- by_act_subj %>% 
    summarise_each(funs(mean)) %>%
    arrange(subject, activity)

# Finally the tidy dataset can be exported as follows
write.table(subject_activity_summary, file="activity_summaries.txt", row.name=FALSE)
