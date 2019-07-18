# Getting and Cleaning Data Project
1. **Set the directory**
2. **Download the dataset and unzip it under the folder called UCI HAR Dataset**
3. **Read the data and assign variables**
    * **read header and activity code**
header <- read.delim("./UCI HAR Dataset/features.txt",sep = " ", header = FALSE)
header[,2] <- as.character(header[,2])
activity <- fread("./UCI HAR Dataset/activity_labels.txt"); colnames(activity) <- c("number","names")
    * **read test data**
test <- fread("./UCI HAR Dataset/test/X_test.txt" )
colnames(test) <- header[,2]
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
colnames(subject_test) <- "Subject"
activity_test <- fread("./UCI HAR Dataset/test/y_test.txt")
colnames(activity_test) <- "Activity"
    * **merge test data**
ftest <- cbind(subject_test,activity_test,test)
    * **read train data**
train <- fread("./UCI HAR Dataset/train/X_train.txt" )
colnames(train) <- header[,2]
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(subject_train) <- "Subject"
activity_train <- fread("./UCI HAR Dataset/train/y_train.txt")
colnames(activity_train) <- "Activity"
    * **merge test data**
ftrain <- cbind(subject_train,activity_train,train)
#merge test and train
merged <- rbind(ftest,ftrain)
merged <- merged[,!duplicated(colnames(merged))]
4. **use descriptive activity names to name the activities in data set** 
for(i in 1:6) { merged$Activity <-  sub(i,activity$names[i], merged$Activity)}
        # Does work, can be used as an alternative    #merged$Activity[activity$number %in% merged$Activity] <- activity$names
        #Does not work, why?    #merged$Activity <- lapply(1:6, function(x) gsub(x,activity$names[x], merged$Activity))
5. **Extracts only the measurements on the mean and standard deviation for each measurement**
selected <- tbl_df(merged)%>% select(Subject:Activity,contains("mean"),contains("std"))
6. **Appropriately labels the data set with descriptive variable names**
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
7. **create a tidy data set with the average of each variable for each activity and each subject**
grouped <- group_by(selected, Subject,Activity, add=TRUE ) 
tidyData <- summarize_all(grouped, list(mean))       
write.csv (tidyData,file = "./tidyData.csv", row.names = FALSE)  
