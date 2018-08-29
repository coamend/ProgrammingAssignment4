# Summary HAR Dataset

The summary_har dataset contains data from the UCI Human Activity Recognition Using Smartphones Data Set. 
It combines both the test and training data into one contiguous data set, and summarizes the data by getting 
the average of each variable for each activity and each subject.

For more information on the source data, please check out 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data dictionary

* subject - contains an integer id for each subject in the study
* activity - contains a factor with levels for each activity type in the study 
(WALKING, 
WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, 
SITTING, 
STANDING, 
LAYING)


* numeric mean and standard deviation (std) for:
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag
