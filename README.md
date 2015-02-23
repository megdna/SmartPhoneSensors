This markdown explains how all of the scripts in this repository work together to merge, subset and transform the raw data collected from activity sensors in the Samsung Galaxy S smartphone into a tidy data set for analysis.  It will allow us to reproducibley go from:

Raw data -> processing script -> tidy data -> data analysis -> data communication


The R script "run_analysis" is used to performs the following steps:
 
1. Downloads and unzips the smartphone sensor data (using download.file and unzip, repectively).  For convenience, a temporary zipped folder is created and then removed from the local machine (using tempfile and unlink, respectively).  Also, the time of download is recorded for reference (using date). 

2. Reads the data sets into R using fread (for subject_train, subject_test, y_train and y_test) and read.table (for activity_labels, features, X_train and X_test).  In the latter case, the X sets are converted to the compatible format using data.frame.  Note: you must first load data.table from the packages library.

3. Merges the training and test data by first using rbind (binding rows from subject_train with subject_test, y_train with y_test, and X_train with X_test).  Column names are appended to these data sets using the setnames function, where features names are applied to X data.  The resulting three sets (subject, y and X) are then column binded using cbind to create one data frame called combined.
               
4. Extracts only the measurements on the mean (excluding meanFreq) and standard deviation (std) for each measurement. This is accomplished using the grep function with / syntax to escape special characters and | for alternation match.  The resulting 66 variables are then column binded back to subject and y (using cbind) to give the final subset of 68 in a data frame.

5. Adds descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) to the activities in the data set using gsub.

6. Cleans up the descriptive variable names (features that were appended to columns in step 3 above) using gsub.  The dashes were replaced with periods, the parentheses removed, and the duplicate body text was made singular like the others.  Refer to the CodeBook in this repository for all labels and descriptions.

7. Creates an independent tidy data set (from the subset data in step 6 above) with the average of each variable for each activity and each subject.  This is accomplished using the group_by and summarize_each functions in the dplyr package.  Finally, The column names are corrected using gsub to reflect this average.  The final data set is then saved as a txt file using write.table, which can be accessed for further analysis or viewing in R using read.table.