
#Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.


##Project

We are required to submit:

1) A README.md that explains how all of the scripts work and how they are connected.

2) A code book, called CodeBook.md, that describes the variables, the data, and any transformations or work that performed to clean up the data.

3) A tidy data set and link to a Github repository with a script for performing the analysis.

4) One R script called run_analysis.R


##Dataset

See the CodeBook.


##Run Script

The script run_analysis.R contains all code to download the data, create the tidy data set, and output the final data file. The script does the following:

- Merges the training and the test sets to create one data set.

- Extracts only the measurements on the mean and standard deviation for each measurement.

- Uses descriptive activity names to name the activities in the data set.

- Appropriately labels the data set with descriptive variable names.

- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


To run it, execute the following in R:
```R
    source('./run_analysis.R')
```

The final tidy dataset is written to the file *final.csv*.
