run_analysis<-function()
{
    library(dplyr)
    
    # Download the zip of the dataset
    zipurl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(zipurl, 'UCI HAR Dataset.zip')
    
    # Assumes that the UCI HAR Dataset.zip is in the current working directory
    unzip("UCI HAR Dataset.zip", overwrite=TRUE)
    
    # Read in the test and training data, using the features file for the 
    # column names, and activity_labels for the activity names
    features<-read.table(path.expand("UCI HAR Dataset/features.txt"))
    activities<-read.table(path.expand("UCI HAR Dataset/activity_labels.txt"),
                           col.names = c('activityid', 'activity'))
    
    # Get the test data set
    test<-read.table(path.expand("UCI HAR Dataset/test/X_test.txt"), 
                     col.names = features$V2)
    
    # Get the test activities and map them to the activity names, then add the
    # activity names to the test data set
    test_activity<-read.table(path.expand("UCI HAR Dataset/test/y_test.txt"), 
                       col.names = 'activityid')
    test_activity<-merge(test_activity, activities, 
                  by.x = 'activityid', by.y = 'activityid')
    test<-cbind(test, activity = test_activity$activity)
    
    # Get the test subjects and add them to the test data set
    test_subjects<-read.table(
        path.expand("UCI HAR Dataset/test/subject_test.txt"),
        col.names = 'subject')
    test<-cbind(subject = test_subjects, test)
    
    # Get the train data set
    train<-read.table(path.expand("UCI HAR Dataset/train/X_train.txt"), 
                      col.names = features$V2)
    
    # Get the train activities and map them to the activity names, then add the
    # activity names to the train data set
    train_activity<-read.table(path.expand("UCI HAR Dataset/train/y_train.txt"), 
                        col.names = 'activityid')
    train_activity<-merge(train_activity, activities, 
                   by.x = "activityid", by.y = "activityid")
    train<-cbind(train, activity = train_activity$activity)
    
    # Get the train subjects and add them to the train data set
    train_subjects<-read.table(
        path.expand("UCI HAR Dataset/train/subject_train.txt"),
        col.names = 'subject')
    train<-cbind(subject = train_subjects, train)
    
    # Combine the two datasets
    combined<-rbind(test, train)
    
    # Extract just the means and standard deviations, and clean up the format 
    # of the column names
    extracted<-combined[,grepl('(mean\\.)|(std\\.)|(activity)|(subject)',
                               names(combined))]
    names(extracted)<-gsub('\\.\\.\\.', '.', names(extracted))
    names(extracted)<-gsub('\\.\\.', '', names(extracted))
    names(extracted)<-gsub('BodyBody', 'Body', names(extracted))
    
    # Export the data set to the global environment
    uci_har<<-extracted
    
    # Summarize the data and return to the global environment
    summary_har<<-uci_har %>% group_by(subject, activity) %>%
        summarize_all(funs(mean))
    
}