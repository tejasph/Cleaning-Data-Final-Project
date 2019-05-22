# Cleaning-Data-Final-Project

In this project, we read in the UCI HAR Datasets; both training and test datasets. Using the variable label textfile, we annotated the imported dataset table and cleaned up the variable naming using the gsub() function.

Initially, activity type is listed by number. Using the function DescribeActivity(), the activity numbers were replaced with descriptive names for each activity. 

The project description tells us to only extract mean() and std() measurements. I created an indexer that finds which columns contain these types of measurements, using grep(). That indexer was used to select the columns of focus

Finally, an independent table was created to contain the average of each activity and each subject. This was done by grouping the inital table by Activity and SubjectID, followed by the computation of the mean for each activity/subject.