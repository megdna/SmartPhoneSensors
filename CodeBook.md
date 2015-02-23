This is a code book that describes the data, the variables, its values, and any transformations or work that was performed to clean up the data.  It modifies and updates the codebooks available with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

#### Study Design

For information on how the data was collected for this experiment, please view the full description of the Human Activity Recognition Using Smartphones Data Set at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For a detailed breakdown of the processing and analysis performed on this data set, please refer to the README in this repository.  In short, the raw data from activity sensors in the Samsung Galazy S smartphone was converted to a tidy data set containing the average of the mean and standard deviation for each variable for each activity and each subject (see below).

#### Code Book

The resulting labels and variables are as follows:

##### Subject
30 subjects (from training and test sets) identified anonymously with the numbers 1 through 30.

##### Activity
6 activities of daily living (ADL) were performed by each subject and labeled descriptively as:

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

##### Features
66 variables resulted from the tidy data set containing 180 observations measured in Hz:

Average.tBodyAcc.mean.X
Average.tBodyAcc.mean.Y
Average.tBodyAcc.mean.Z
Average.tBodyAcc.std.X
Average.tBodyAcc.std.Y
Average.tBodyAcc.std.Z
Average.tGravityAcc.mean.X
Average.tGravityAcc.mean.Y
Average.tGravityAcc.mean.Z
Average.tGravityAcc.std.X
Average.tGravityAcc.std.Y
Average.tGravityAcc.std.Z
Average.tBodyAccJerk.mean.X
Average.tBodyAccJerk.mean.Y
Average.tBodyAccJerk.mean.Z
Average.tBodyAccJerk.std.X
Average.tBodyAccJerk.std.Y
Average.tBodyAccJerk.std.Z
Average.tBodyGyro.mean.X
Average.tBodyGyro.mean.Y
Average.tBodyGyro.mean.Z
Average.tBodyGyro.std.X
Average.tBodyGyro.std.Y
Average.tBodyGyro.std.Z
Average.tBodyGyroJerk.mean.X
Average.tBodyGyroJerk.mean.Y
Average.tBodyGyroJerk.mean.Z
Average.tBodyGyroJerk.std.X
Average.tBodyGyroJerk.std.Y
Average.tBodyGyroJerk.std.Z
Average.tBodyAccMag.mean
Average.tBodyAccMag.std
Average.tGravityAccMag.mean
Average.tGravityAccMag.std
Average.tBodyAccJerkMag.mean
Average.tBodyAccJerkMag.std
Average.tBodyGyroMag.mean
Average.tBodyGyroMag.std
Average.tBodyGyroJerkMag.mean
Average.tBodyGyroJerkMag.std
Average.fBodyAcc.mean.X
Average.fBodyAcc.mean.Y
Average.fBodyAcc.mean.Z
Average.fBodyAcc.std.X
Average.fBodyAcc.std.Y
Average.fBodyAcc.std.Z
Average.fBodyAccJerk.mean.X
Average.fBodyAccJerk.mean.Y
Average.fBodyAccJerk.mean.Z
Average.fBodyAccJerk.std.X
Average.fBodyAccJerk.std.Y
Average.fBodyAccJerk.std.Z
Average.fBodyGyro.mean.X
Average.fBodyGyro.mean.Y
Average.fBodyGyro.mean.Z
Average.fBodyGyro.std.X
Average.fBodyGyro.std.Y
Average.fBodyGyro.std.Z
Average.fBodyAccMag.mean
Average.fBodyAccMag.std
Average.fBodyAccJerkMag.mean
Average.fBodyAccJerkMag.std
Average.fBodyGyroMag.mean
Average.fBodyGyroMag.std
Average.fBodyGyroJerkMag.mean
Average.fBodyGyroJerkMag.std

The characters in the above names can be described as follows:

Average - represents the mean of the given recordings
t and f - denote time and frequency domain signals, respectively
Body - estimated body acceleration
Gravity - gravitational force (from sensor acceleration signal)
Acc - linear acceleration from the accelerometer (total acceleration)
Gyro - angular velocity from the gyroscope
Jerk - time rate of change of acceleration
Mag - magnitude of the three-dimensional signals
mean - mean value
std - standard deviation
XYZ - triaxial (3-axial) signals in the X, Y and Z directions