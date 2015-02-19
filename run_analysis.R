#load data.table 
library(data.table)
library(dplyr)

#Load data
testDataX <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testDataY <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
trainDataX <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainDataY <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Load: activity labels and data column names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#1. Merges the training and the test sets
Xdata <- rbind(testDataX, trainDataX)
Ydata <- rbind(testDataY, trainDataY)
Subject <- rbind(testSubject, trainSubject)

#Name collumns
colnames(Xdata) <- features
colnames(Ydata) <- "Activity"
colnames(Subject) <- "Subject"

#Create one dataset
data <- cbind(Xdata, Ydata, Subject)

#2.Extracts only the measurements on the mean and standard deviation for each measurement
dataSubset <- data[,grepl("mean|std|Activity|Subject", names(data), ignore.case=TRUE)]

#3.Uses descriptive activity names to name the activities in the data set
dataSubset$Activity <- activity_labels[dataSubset$Activity]

#4.Appropriately labels the data set with descriptive variable names. 
#Already done when we named the collumns before

#5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
newDataset <- dataSubset %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

#create a txt file with write.table() 
write.table(newDataset, file = "finalDataset.txt", row.names = FALSE)

