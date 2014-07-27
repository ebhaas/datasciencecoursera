#
# run_analysis.R
#


#working.dir <- "C:/Users/haaseb/Documents/Personal/School/Coursera/2014-06-02_Getting_and_Clearning_Data/prog_assign_01b"
#setwd(working.dir)


library(plyr)

run_analysis <- function() {

  destfile <- "UCI HAR Dataset.zip"
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip", destfile=destfile)
  unzip(destfile)
  
    
  data.dir <- "UCI HAR Dataset"
  
  # get feature names
  feature.names <- read.table(file="UCI HAR Dataset/features.txt")
  
  dim(feature.names)
  #[1] 561   2
  
  
  # read in training and test data and label data sets with feature names
  x_train <- read.table(file="UCI HAR Dataset/train/X_train.txt", col.names = feature.names$V2)
  x_test <- read.table(file="UCI HAR Dataset/test/X_test.txt", col.names = feature.names$V2)
  
  dim(x_train)
  # [1] 7352  561
  
  dim(x_test)
  #[1] 2947  561
  
  
  # add Activity and Subject columns
  x_train <- cbind(read.table(file="UCI HAR Dataset/train/y_train.txt", col.names="Activity"), x_train)
  x_train <- cbind(read.table(file="UCI HAR Dataset/train/subject_train.txt", col.names="Subject"), x_train)
  
  x_test <- cbind(read.table(file="UCI HAR Dataset/test/y_test.txt", col.names="Activity"), x_test)
  x_test <- cbind(read.table(file="UCI HAR Dataset/test/subject_test.txt", col.names="Subject"), x_test)
  
  
  # combine the training and the test sets to create one data set
  step_1 <- rbind(x_train, x_test)
  
  dim(step_1)
  #[1] 10299   563
  
  
  # extract only the mean and standard deviation measurements along with Activity and Subject columns
  measurements <- c(c(1, 2), 2+grep("-mean\\(\\)|-std\\(\\)", feature.names$V2))
  step_2 <- step_1[ , measurements]

  dim(step_2)
  #[1] 10299    68
  
  
  # replace the Activity names with the activity lables:
  # LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
  activity.lables <- read.table(file="UCI HAR Dataset/activity_labels.txt")
  for (k in 1:6) {
    step_2$Activity <- replace(step_2$Activity,
                               step_2$Activity == k, 
                               as.character(activity.lables[activity.lables$V1 == k, 2]))
  }
  
  
  # create a tidy data set with the group average of each variable for Activity and Subject
  step_3 <- aggregate(. ~ Subject+Activity, step_2, ave)
  
  dim(step_3)
  #[1] 180  68
  
  
  final.dataset <- data.frame()
  for(i in 1:nrow(step_3))
    for(j in 1:ncol(step_3))
      final.dataset[i,j] <- step_3[i,][j][1,][[1]][[1]]
  
  
  final.names <- colnames(step_3)
  
  final.names <- gsub(".mean...X", "X-Mean average", final.names)
  final.names <- gsub(".mean...Y", "Y-Mean average", final.names)
  final.names <- gsub(".mean...Z", "Z-Mean average", final.names)
  
  final.names <- gsub(".std...X", "X-Std average", final.names)
  final.names <- gsub(".std...Y", "Y-Std average", final.names)
  final.names <- gsub(".std...Z", "Z-Std average", final.names)
  
  final.names <- gsub(".std..", "-Std average", final.names)
  final.names <- gsub(".mean..", "-Mean average", final.names)
  
  colnames(final.dataset) <- final.names
  
  
  write.csv(x=final.dataset, file="final.csv", row.names=FALSE)
  
}


# call the run_analysis function
run_analysis()

