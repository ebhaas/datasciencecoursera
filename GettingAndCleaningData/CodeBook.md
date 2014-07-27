
# CodeBook

This describes the variables, the data, and any transformations or work that performed to clean up the data.

##Data Set

Title:
Human Activity Recognition Using Smartphones Data Set

Source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description:
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.


## Script Variables

| Variable      | Description   |
| ------------- |---------------|
| feature.names | names from features.txt |
| x_train | data from X_train.txt |
| x_test | data from X_test.txt |
| step_1 | the union of x_train and x_test |
| step_2 | has only the measurements on the mean and standard deviation for each measurement |
| activity.lables | the description for the activity each subject |
| step_3 | the group averages of each variable for each activity and each subject |
| final.dataset | final tidy dataset to output | 
| final.names | column names for the final tidy dataset |



## Transformations

### step_1

It is only the union of x_train and x_test. These data frames were read from files X_train.txt and X_test.txt. Activity and subject information was added to the first two columns of each data frame from the files  \*/y_\*.txt and \*/subject_\*.txt.


### step_2

To create the step_2 dataframe, grep was used to select the column containing the mean or standard deviation (std)  of each variable. The column names of step_2 were replaced with the activitiy labels.


### step_3

Aggregated the data to group by subject and activity and calculated the group average.


### final.csv
This file contains the tidy data consisting of the group averages of each variable for each activity and each subject. This data set had 68 columns after computing the group averages.


| final.csv header names:
| ---------------
| Subject
| Activity
| tBodyAccX-Mean average
| tBodyAccY-Mean average
| tBodyAccZ-Mean average
| tBodyAccX-Std average
| tBodyAccY-Std average
| tBodyAccZ-Std average
| tGravityAccX-Mean average
| tGravityAccY-Mean average
| tGravityAccZ-Mean average
| tGravityAccX-Std average
| tGravityAccY-Std average
| tGravityAccZ-Std average
| tBodyAccJerkX-Mean average
| tBodyAccJerkY-Mean average
| tBodyAccJerkZ-Mean average
| tBodyAccJerkX-Std average
| tBodyAccJerkY-Std average
| tBodyAccJerkZ-Std average
| tBodyGyroX-Mean average
| tBodyGyroY-Mean average
| tBodyGyroZ-Mean average
| tBodyGyroX-Std average
| tBodyGyroY-Std average
| tBodyGyroZ-Std average
| tBodyGyroJerkX-Mean average
| tBodyGyroJerkY-Mean average
| tBodyGyroJerkZ-Mean average
| tBodyGyroJerkX-Std average
| tBodyGyroJerkY-Std average
| tBodyGyroJerkZ-Std average
| tBodyAccMag-Mean average
| tBodyAccMag-Std average
| tGravityAccMag-Mean average
| tGravityAccMag-Std average
| tBodyAccJerkMag-Mean average
| tBodyAccJerkMag-Std average
| tBodyGyroMag-Mean average
| tBodyGyroMag-Std average
| tBodyGyroJerkMag-Mean average
| tBodyGyroJerkMag-Std average
| fBodyAccX-Mean average
| fBodyAccY-Mean average
| fBodyAccZ-Mean average
| fBodyAccX-Std average
| fBodyAccY-Std average
| fBodyAccZ-Std average
| fBodyAccJerkX-Mean average
| fBodyAccJerkY-Mean average
| fBodyAccJerkZ-Mean average
| fBodyAccJerkX-Std average
| fBodyAccJerkY-Std average
| fBodyAccJerkZ-Std average
| fBodyGyroX-Mean average
| fBodyGyroY-Mean average
| fBodyGyroZ-Mean average
| fBodyGyroX-Std average
| fBodyGyroY-Std average
| fBodyGyroZ-Std average
| fBodyAccMag-Mean average
| fBodyAccMag-Std average
| fBodyBodyAccJerkMag-Mean average
| fBodyBodyAccJerkMag-Std average
| fBodyBodyGyroMag-Mean average
| fBodyBodyGyroMag-Std average
| fBodyBodyGyroJerkMag-Mean average
| fBodyBodyGyroJerkMag-Std average 
