#set the directory
setwd("C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Assignment")
# download the zip file and unzip it
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
        download.file(fileurl, "UCI HAR Dataset.zip", method="curl" )
        unzip("UCI HAR Dataset.zip", overwrite = FALSE)  
        file.remove("UCI HAR Dataset.zip")  }
#load required libraries
library(data.table)
library(dplyr)
## read header and activity code
header <- read.delim("./UCI HAR Dataset/features.txt",sep = " ", header = FALSE)
header[,2] <- as.character(header[,2])
activity <- fread("./UCI HAR Dataset/activity_labels.txt"); colnames(activity) <- c("number","names")
## read test data
test <- fread("./UCI HAR Dataset/test/X_test.txt" )
colnames(test) <- header[,2]
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
colnames(subject_test) <- "Subject"
activity_test <- fread("./UCI HAR Dataset/test/y_test.txt")
colnames(activity_test) <- "Activity"
## merge test data
ftest <- cbind(subject_test,activity_test,test)
## read train data
train <- fread("./UCI HAR Dataset/train/X_train.txt" )
colnames(train) <- header[,2]
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(subject_train) <- "Subject"
activity_train <- fread("./UCI HAR Dataset/train/y_train.txt")
colnames(activity_train) <- "Activity"
## merge test data
ftrain <- cbind(subject_train,activity_train,train)
#merge test and train
merged <- rbind(ftest,ftrain)
merged <- merged[,!duplicated(colnames(merged))]
# use descriptive activity names to name the activities in data set.
for(i in 1:6) { merged$Activity <-  sub(i,activity$names[i], merged$Activity)}    
##Extracts only the measurements on the mean and standard deviation for each measurement.
selected <- tbl_df(merged)%>% select(Subject:Activity,contains("mean"),contains("std"))
#Appropriately labels the data set with descriptive variable names
names(selected) <-  gsub("^t","Time", names(selected))
names(selected) <-  gsub("Acc","Acceleration", names(selected))
names(selected) <-  gsub("BodyBody","Body", names(selected))
names(selected) <-  gsub("-mean","Mean", names(selected))
names(selected) <-  gsub("-std","STD", names(selected))
names(selected) <-  gsub("^f","Frequency", names(selected))
names(selected) <-  gsub("-Freq","Frequency", names(selected))
names(selected) <-  gsub("angle","Angle", names(selected))
names(selected) <-  gsub("gravity","Gravity", names(selected))
names(selected) <-  gsub("tBody","TimeBody", names(selected))
names(selected) <-  gsub("Gyro","Gyroscope", names(selected))
names(selected) <-  gsub("Mag","Magnitude", names(selected))
names(selected) <-  gsub("uencyuency","uency", names(selected))
##create a tidy data set with the average of each variable for each activity and each subject.
grouped <- group_by(selected, Subject,Activity, add=TRUE ) 
tidyData <- summarize_all(grouped, list(mean))       
write.csv (tidyData,file = "./tidyData.csv", row.names = FALSE)        
        
