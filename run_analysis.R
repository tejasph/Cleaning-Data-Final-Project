#Coursera Course 3 Final Project
#run_analysis.R

#Goals:
#1. Merge test and training datasets
#2. Extract measurements on mean and standard dev
#3. Use descriptive names to label the data set
#4. Appropriately label variables
#5. Create a second, independent tidy data set w/ avg of each variable for each activity/subject


#Reading in Training Data(set wd to Cleaninng-Data-Final-Project Folder )
TrainX <- read.csv("UCI HAR Dataset/train/X_train.txt", header = F, sep = "")
TrainY <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = F, sep = "")
TrainSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = F, sep = "")
FeatureVector <- read.delim("UCI HAR Dataset/features.txt", header = F, sep = "")
