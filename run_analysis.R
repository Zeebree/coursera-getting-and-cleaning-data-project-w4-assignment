## 0. Download data for the project and unzip data.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

library(reshape2)


## Download data for the project
if(!file.exists("./data")) {
        dir.create("./data")
}
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(data_url, destfile= "./data/human-activity.zip")
## Unzip data
unzip(zipfile="./data/human-activity.zip",exdir="./data")


## Read files and load data
### List of all features which coresponds to data from files X_test.txt and X_train.txt
features <- read.table("./data/UCI HAR Dataset/features.txt", head=FALSE)
### Test data values 30%
testSet <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE) 
### Training data values 70%
trainSet <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE) 
### Test labels activity
testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE) 
### Training labels activity
trainLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE) 
### Identifies the subject who performed the activity
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE) 
### Identifies the subject who performed the activity 
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE) 


## 1. Merges the training and the test sets to create one data set
### Merge by rows appropriate test and training data tables
set <- rbind(testSet, trainSet)
labels <- rbind(testLabels, trainLabels)
subject <- rbind(testSubject, trainSubject)
### Add names
names(set) <- features$V2
names(labels) <- c("activity")
names(subject) <- c("subject")
### Merge all by columns to one data frame
data <- cbind(set, labels, subject)


## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement.
subsetData <- data[,grep("activity|subject|mean\\(|std\\(", names(data))]


## 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", head=FALSE)
subsetData$activity <- factor(subsetData$activity, levels = activityLabels$V1, labels = activityLabels$V2)
subsetData$subject <- as.factor(subsetData$subject)


## 4. Appropriately labels the data set with descriptive variable names.
names(subsetData)<-gsub("^t", "Time", names(subsetData))
names(subsetData)<-gsub("^f", "Frequency", names(subsetData))
names(subsetData)<-gsub("Acc", "Accelerometer", names(subsetData))
names(subsetData)<-gsub("Gyro", "Gyroscope", names(subsetData))
names(subsetData)<-gsub("Mag", "Magnitude", names(subsetData))
names(subsetData)<-gsub("BodyBody", "Body", names(subsetData))
names(subsetData)<-gsub("-mean", "Mean", names(subsetData))
names(subsetData)<-gsub("-std", "StandardDeviation", names(subsetData))


## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
subsetDataMelted <- melt(subsetData, id = c("subject", "activity"))
subsetDataMean <- dcast(subsetDataMelted, subject + activity ~ variable, mean)
write.table(subsetDataMean, "tidy_data.txt", row.names = FALSE, quote = FALSE)


