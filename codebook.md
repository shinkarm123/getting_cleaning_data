Codebook for Tidy Dataset
Identifiers
subject:
Integer representing the ID of the subject who performed the activity (ranges from 1 to 30).

activity:
Descriptive name of the activity performed. Possible values are:

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
Measurements
The remaining variables are the mean values of measurements on the mean or standard deviation for each activity and subject. The measurements are normalized and bounded within [-1, 1].

tBodyAcc-mean-X, tBodyAcc-mean-Y, tBodyAcc-mean-Z: Mean of body acceleration signals along X, Y, and Z axes.
tBodyAcc-std-X, tBodyAcc-std-Y, tBodyAcc-std-Z: Standard deviation of body acceleration signals along X, Y, and Z axes.
tGravityAcc-mean-X, tGravityAcc-mean-Y, tGravityAcc-mean-Z: Mean of gravity acceleration signals along X, Y, and Z axes.
tGravityAcc-std-X, tGravityAcc-std-Y, tGravityAcc-std-Z: Standard deviation of gravity acceleration signals along X, Y, and Z axes.
tBodyAccJerk-mean-X, tBodyAccJerk-mean-Y, tBodyAccJerk-mean-Z: Mean of body jerk signals along X, Y, and Z axes.
tBodyAccJerk-std-X, tBodyAccJerk-std-Y, tBodyAccJerk-std-Z: Standard deviation of body jerk signals along X, Y, and Z axes.
tBodyGyro-mean-X, tBodyGyro-mean-Y, tBodyGyro-mean-Z: Mean of body gyroscopic signals along X, Y, and Z axes.
tBodyGyro-std-X, tBodyGyro-std-Y, tBodyGyro-std-Z: Standard deviation of body gyroscopic signals along X, Y, and Z axes.
Additional variables follow a similar naming convention for other measurements, such as "tBodyGyroJerk," "fBodyAcc," "fBodyGyro," etc.
Notes
Variable names follow the format <domain><signal>-<metric>-<axis>, where:
domain: t (time domain) or f (frequency domain).
signal: Signal type (e.g., BodyAcc, GravityAcc).
metric: Measurement type (mean or std).
axis: Spatial axis (X, Y, or Z).
