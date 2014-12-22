library(data.table)
library(plyr)
library(dplyr)

features <- tbl_dt(read.table("UCI HAR Dataset//test//X_test.txt"))
feature_names <- read.table("UCI HAR Dataset//features.txt", stringsAsFactors = FALSE)
names(features) <- feature_names[[2]]
subjects <- tbl_dt(read.table("UCI HAR Dataset//test//subject_test.txt"))
activities <- tbl_dt(read.table("UCI HAR Dataset//test//y_test.txt", colClasses=c("character")))
levelsactivities[2] <- factor(c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying"))
features_pre1 <- features %>% 
    select(contains("mean"), contains("std")) %>%
    mutate(subject = select(subjects, 1))
    mutate(activity = select)
