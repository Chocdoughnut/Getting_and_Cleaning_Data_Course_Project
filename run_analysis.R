## Load Required Libraries

library(data.table)
library(dplyr)

##### Downloading And Unzipping Data Into Directory ##### 

if(!file.exists("./data")){
  
  dir.create("./data")
  
}

if(!file.exists("./data/Database.zip")){
  
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(zipurl,destfile="./data/Database.zip")

}

if (!file.exists("UCI HAR Dataset")) { 
  
unzip(zipfile="./data/Database.zip",exdir="./data")
  
}

##### Reading and Assigning Features + Activity labels ##### 

features <- read.table("./data/UCI HAR Dataset/features.txt", as.is = TRUE)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")


##### Reading And Assigning Training + Test data ##### 

trainsubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

testsubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

##### Assigning Column Names ##### 

colnames(trainx) <- features$V2
colnames(testx) <- features$V2
colnames(trainy) <- 'Activity'
colnames(testy) <- 'Activity'
colnames(activity_labels) <- c('Code', 'Activity')
colnames(testsubjects) <- 'Subject'
colnames(trainsubjects) <- 'Subject'

##### STEP 1: Merge All The Test and Training Data ##### 

fulldataset <- cbind(rbind(trainsubjects, testsubjects), rbind(trainy, testy), rbind(trainx, testx))

##### STEP 2: Extract only measurements for mean and standard deviation ('std') ##### 

fulldataset <- select(fulldataset, Subject, Activity, contains("mean"), contains("std"))

##### STEP 3: Convert All Activity Code Numbers Into Descriptive Names Using activity_labels Table ##### 

fulldataset$Activity <- activity_labels[fulldataset$Activity, 2]

##### STEP 4: Appropriately labels the data set with descriptive variable names. ##### 

names(fulldataset)<-gsub("Acc", "Accelerometer", names(fulldataset))
names(fulldataset)<-gsub("Gyro", "Gyroscope", names(fulldataset))
names(fulldataset)<-gsub("BodyBody", "Body", names(fulldataset))
names(fulldataset)<-gsub("Mag", "Magnitude", names(fulldataset))
names(fulldataset)<-gsub("^t", "Time", names(fulldataset))
names(fulldataset)<-gsub("^f", "Frequency", names(fulldataset))
names(fulldataset)<-gsub("tBody", "TimeBody", names(fulldataset))
names(fulldataset)<-gsub("-mean()", "Mean", names(fulldataset), ignore.case = TRUE)
names(fulldataset)<-gsub("-std()", "STD", names(fulldataset), ignore.case = TRUE)
names(fulldataset)<-gsub("-freq()", "Frequency", names(fulldataset), ignore.case = TRUE)
names(fulldataset)<-gsub("angle", "Angle", names(fulldataset))
names(fulldataset)<-gsub("gravity", "Gravity", names(fulldataset))

##### STEP 5: Use fulldataset to create and export a independent tidy data set      ##### 
#####         with the average of each variable for each activity and each subject. ##### 

cleandataset <- summarise_all(group_by(fulldataset,Subject,Activity),funs(mean))

write.table(cleandataset, "CleanData.txt", row.name=FALSE)



