#Coursera Course 3 Final Project
#run_analysis.R

#Goals:
#1. Merge test and training datasets
#2. Extract measurements on mean and standard dev
#3. Use descriptive names to label the data set
#4. Appropriately label variables
#5. Create a second, independent tidy data set w/ avg of each variable for each activity/subject

#Relevant packages
library(dplyr)

#Function that changes numerals to its corresponding activity description; from activity_labels.txt
DescribeActivity <- function(x){
  x <- gsub("1","Walking",x)
  x <- gsub("2", "Walking Upstairs", x)
  x <- gsub("3", "Walking Downstairs", x)
  x <- gsub("4", "Sitting", x)
  x <- gsub("5", "Standing",x)
  x <- gsub("6", "Laying",x)
  
  x
  
}

#Reading in Training Data(set wd to Cleaninng-Data-Final-Project Folder )
TrainX <- read.csv("UCI HAR Dataset/train/X_train.txt", header = F, sep = "")
TrainY <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = F, sep = "")
TrainSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = F, sep = "")

#Reading in Test Data(set wd to Cleaninng-Data-Final-Project Folder )
TestX <- read.csv("UCI HAR Dataset/test/X_test.txt", header = F, sep = "")
TestY <- read.csv("UCI HAR Dataset/test/Y_test.txt", header = F, sep = "")
TestSubject <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = F, sep = "")

#Import and set vector for variable names
FeatureVector <- read.delim("UCI HAR Dataset/features.txt", header = F, sep = "")
FeatureVector <- as.character(FeatureVector$V2)

#Extract index of mean() and std() measurements; trim variables and data.frames
Indexer <- sort(c(grep("mean[(]",FeatureVector), grep("std()",FeatureVector)))
FeatureVector <- FeatureVector[Indexer]


#Add Variable names utilizing the Feature Vector
TrainX <- select(TrainX, Indexer)
TestX <- select(TestX, Indexer)
names(TrainX) <- c(as.character(FeatureVector))
names(TestX)  <- c(as.character(FeatureVector))

#Created a function that converts Activity number into a more descriptive format
TrainY$V1 <- DescribeActivity(as.character(TrainY$V1))
TestY$V1 <- DescribeActivity(as.character(TestY$V1))

#Add other useful variable names and then bind the datasets together
names(TrainY) <- "Activity"
names(TestY) <- "Activity"

names(TrainSubject) <- "SubjectID"
names(TestSubject) <- "SubjectID"

TrainFrame <- cbind(TrainSubject, TrainY, TrainX)
TestFrame <- cbind(TestSubject, TestY, TestX)


#Combine Training and Test Data
OverallFrame <- arrange(rbind(TrainFrame,TestFrame), SubjectID)

