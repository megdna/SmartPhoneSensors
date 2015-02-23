## Download and unzip the raw data

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp, mode="wb")
unzip(temp)
unlink(temp)
dateDownloaded <- date()

## Read the local files into R

library(data.table)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", sep="\n", header=FALSE)
y_train <- fread("./UCI HAR Dataset/train/y_train.txt", sep="\n", header=FALSE)
X_train <- data.table(read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE))

subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", sep="\n", header=FALSE)
y_test <- fread("./UCI HAR Dataset/test/y_test.txt", sep="\n", header=FALSE)
X_test <- data.table(read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE))

## Merge the train and test data sets, appending correct column names

subject <- rbind(subject_train, subject_test)
setnames(subject, 1, "Subject")

y <- rbind(y_train, y_test)
setnames(y, 1, "Activity")

X <- rbind(X_train, X_test)
setnames(X, 1:561, features[,2])

combined <- as.data.frame(cbind(subject, y, X))

## Subset the data only on the mean and standard deviation for each measurement

meanstd <- combined[,grep("(mean|std)\\(\\)", colnames(combined))]
subset <- as.data.frame(cbind(subject, y, meanstd))

## Add descriptive activity names to the activities in the data set

subset$Activity <- gsub("1", "WALKING", subset$Activity)
subset$Activity <- gsub("2", "WALKING_UPSTAIRS", subset$Activity)
subset$Activity <- gsub("3", "WALKING_DOWNSTAIRS", subset$Activity)
subset$Activity <- gsub("4", "SITTING", subset$Activity)
subset$Activity <- gsub("5", "STANDING", subset$Activity)
subset$Activity <- gsub("6", "LAYING", subset$Activity)

## Apply descriptive variable names to the features in the data set

colnames(subset) <- gsub("-", ".", colnames(subset))
colnames(subset) <- gsub("\\(", "", colnames(subset))
colnames(subset) <- gsub(")", "", colnames(subset))
colnames(subset) <- gsub("BodyBody", "Body", colnames(subset))

## Create a tidy data set with the average of each variable for each activity and each subject

library(dplyr)
tidy <- subset %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

colnames(tidy) <- gsub("tB", "Average.tB", colnames(tidy))
colnames(tidy) <- gsub("tG", "Average.tG", colnames(tidy))
colnames(tidy) <- gsub("fB", "Average.fB", colnames(tidy))

write.table(tidy, file="./UCI HAR Dataset/tidy.txt", row.names=FALSE, sep="\t", quote=FALSE)
read.table(file="./UCI HAR Dataset/tidy.txt", header=TRUE)
View(tidy)