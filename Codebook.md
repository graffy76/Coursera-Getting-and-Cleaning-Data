#Course Project Codebook

####The original code book can be found in the 'UCI HAR Dataset' directory.  Please refer to that document for original variable definitions


#####SUBJECT
Integer representing one of thirty subjects from the original experiment.

Values: 1-30


#####ACTIVITY
Factors representing six possible activities
Values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING 


#####Additional variables (66 total):
- tBodyAcc *(X,Y,Z)
- tGravityAcc *(X,Y,Z)
- tBodyAccJerk *(X,Y,Z) 
- tBodyGyro *(X,Y,Z) 
- tBodyGyroJerk *(X,Y,Z)
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc *(X,Y,Z)
- fBodyAccJerk *(X,Y,Z)
- fBodyGyro *(X,Y,Z)
- fBodyAccMag
- fBodyBodyAccJerkMag
- fBodyBodyGyroMag
- fBodyBodyGyroJerkMag

Variables noted with *(X,Y,Z) exist as three separate axial measurements.

All variables have corresponding mean and standard deviation components (denoted mean() and std() in the column names)

Thus, 8 variables have 3 separate axial measurements, resulting in 24 variables in the final data set.  Add the remaining 9 variables and there are 33 individual measurements for which mean and standard deviations are calculated.  33 * 2 = 66 total variables.
