##PA Getting and Cleaning Data

#Task
#You should create one R script called run_analysis.R that does the following: 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load libraries
library(dplyr)

#Setting Working directory
WorkingDirectory <- "Q:/Eigenes/Joerg/Buero/Coursera/Data Science Specialization/3-Getting and Cleaning Data/Programming Assignments"
setwd(WorkingDirectory)

#The dataset must be placed directly in the Working directory as extracted from the file getdata_projectfiles_UCI HAR Dataset.zip.
#As in the zip-file the datasets are stored in the "UCI HAR Dataset"-folder.
#The structure must be like this: <Working directory>/UCI HAR Dataset

##Define pathes to the files to read from Working Directory
myfile.features <- "./UCI HAR Dataset/features.txt"
myfile.acivity.labels <- "./UCI HAR Dataset/activity_labels.txt"
myfile.train.set <- "./UCI HAR Dataset/train/X_train.txt"
myfile.train.labels <- "./UCI HAR Dataset/train/y_train.txt"
myfile.train.subject <- "./UCI HAR Dataset/train/subject_train.txt"
myfile.test.set <- "./UCI HAR Dataset/test/X_test.txt"
myfile.test.labels <- "./UCI HAR Dataset/test/y_test.txt"
myfile.test.subject <- "./UCI HAR Dataset/test/subject_test.txt"

##Read all defined files
features <- read.table(myfile.features)
activity.labels <- read.table(myfile.acivity.labels)
train.set <- read.table(myfile.train.set, colClasses = "numeric")
train.labels <- read.table(myfile.train.labels) 
train.subject <- read.table((myfile.train.subject))
test.set <- read.table(myfile.test.set, colClasses = "numeric")
test.labels <- read.table(myfile.test.labels)
test.subject <- read.table(myfile.test.subject)

##Identify and clean (make descriptive) needed columns

#Create a new dataframe called features.doc from original features (features.txt) for performing
#and documenting the cleaning process
#Columns of features.doc:
#- Ref              :Contains the reference to the test and train data set columns (e.g. "V1", "V2", etc. )
#- OrigFeatureName  :Contains the original feature names defined in features (from features.txt)
#- Used             :Contains logical values (TRUE/FALSE). TRUE in case of using the feature in the
#                   :cleaned data set. FALSE in case of dropping the feature during the cleaning process
#- CleanFeatureName :Descriptive variable name of all variables (also variable dropped later on)
#- Operation        :Contains calculation-steps performed on this variable (column added later on)
#- FinalFeatureName :Contains the final variable name as used in the result dataset (column added later on)

#Create dataframe features.doc initially and compute Ref-Column
#Identify columns to be needed for tidy data set (features with "mean()" or "std()" in the name
#corresponding to the features.info-file

features.doc <- data.frame(Ref=as.character(paste0("V",features$V1)), OrigFeatureName=as.character(features$V2), stringsAsFactors = FALSE)
features.doc$Used <- grepl("mean\\(\\)|std\\(\\)", features.doc$OrigFeatureName)

#Create new dataframe column named "CleanFeatureName" to store cleaned feature name
#Remove inconsistency corresponding to the features_info.txt (fBodyBody...-features must be named fBody...)
#Start mean and std with an upper-case character and substitute some abbreviations with the longer, more descriptive version
#Run make.names() to remove illegal characters (like minus and brackets) and remove the resulting dots completely

features.doc$CleanFeatureName <- features.doc$OrigFeatureName
features.doc$CleanFeatureName <- gsub("BodyBody","Body", features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- gsub("mean","Mean", features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- gsub("std","Std", features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- gsub("^t","Time", features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- gsub("^f","Freq", features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- make.names(features.doc$CleanFeatureName)
features.doc$CleanFeatureName <- gsub("\\.","", features.doc$CleanFeatureName)

#Subset features.doc on only the Columns to be used
#Drop all columns not to be used from test and train data set corresponding to the reference
#(from features.txt column "V1")
UsedCol <- features.doc[features.doc$Used==TRUE,"Ref"]
test.set <- test.set[,UsedCol]
train.set <- train.set[,UsedCol]

#Extract all CleanFeatureName's which should be used and assign them as
#columnnames to the test and train data set
CleanedNames <- features.doc[features.doc$Used==TRUE,"CleanFeatureName"]
colnames(test.set) <- CleanedNames
colnames(train.set) <- CleanedNames

#Add activity-labels from test.labels and train.labels to test.set and train.set
test.set <- cbind(ActivityNo=test.labels$V1, test.set)
train.set <- cbind(ActivityNo=train.labels$V1, train.set)

#Add subject-labels from test.subject and train.subject to test.set and train.set
test.set <- cbind(SubjectNo=test.subject$V1, test.set)
train.set <- cbind(SubjectNo=train.subject$V1, train.set)

#Merge activity-names
#to the test and train data set. After that, drop the Activity Number, 
#because now the more descriptive Activity Name is present
colnames(activity.labels)<-c("ActivityNo","ActivityName")
test.set <- merge(activity.labels,test.set, by="ActivityNo", all=TRUE)
train.set <- merge(activity.labels,train.set, by="ActivityNo", all=TRUE)
test.set$ActivityNo=NULL
train.set$ActivityNo=NULL

#Combine the test and train data set in one new dataframe
data.set <- rbind(test.set,train.set)

#Group data.set by SubjectNo and ActivityName and calculate the mean of all columns
#Store result in data.res and change columnnames correspondingly
data.res <- data.set %>% 
                group_by(SubjectNo, ActivityName) %>% 
                summarise_each(funs(mean))

colnames(data.res)[-c(1,2)] <- paste0("Mean", colnames(data.res)[-c(1,2)])

#Update features.doc for documentation
features.doc$Operation <- "Mean by Subject, Activity"
features.doc$FinalFeatureName <- paste0("Mean", features.doc$CleanFeatureName)
features.doc[features.doc$Used==FALSE,c("CleanFeatureName", "Operation", "FinalFeatureName")] <- NA

#Write features.doc to disc
write.csv(features.doc, file="featuresdoc.csv", row.names = FALSE)

#Write cleaned data from data.res to disc
write.csv(data.res, file="resultDat.csv", row.names = FALSE)

