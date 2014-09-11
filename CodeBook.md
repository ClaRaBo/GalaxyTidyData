# CodeBook for Samsung Galaxy Tidy Data

## Study design
Original at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


## Variable Description
The time domain signals timeAccelerator-XYZ and timeGyroscope-XYZ were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, timeBodyAccelerationJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagniude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, fBodyAccelerationJerk-XYZ, fBodyGyroscope-XYZ, fBodyAccelerationJerkMagnitude, fBodyGyroscopeMagnitude, fBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Column names

  - Subject    [1..30]  30 people were taking the test
  - Activity   [Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, Laying] 
  - timeBodyAccelerationMeanX
  - timeBodyAccelerationMeanY
  - timeBodyAccelerationMeanZ 
  
  the following column names follow the example above, but they are abreviated together with XYZ:
  
  - timeBodyAccelerationStdDeviationXYZ                     
  - timeGravityAccelerationMeanXYZ
  - timeGravityAccelerationStdDeviationXYZ
  - timeBodyAccelerationJerkMeanXYZ
  - timeBodyAccelerationJerkStdDeviationXYZ
  - timeBodyGyroscopeMeanXYZ
  - timeBodyGyroscopeStdDeviationXYZ
  - timeBodyGyroscopeJerkMeanXYZ
  - timeBodyGyroscopeJerkStdDeviationXYZ
  - timeBodyAccelerationMagnitudeMean
  - timeBodyAccelerationMagnitudeStdDeviation
  - timeGravityAccelerationMagnitudeMean
  - timeGravityAccelerationMagnitudeStdDeviation
  - timeBodyAccelerationJerkMagnitudeMean
  - timeBodyAccelerationJerkMagnitudeStdDeviation
  - timeBodyGyroscopeMagnitudeMean
  - timeBodyGyroscopeMagnitudeStdDeviation
  - timeBodyGyroscopeJerkMagnitudeMean
  - timeBodyGyroscopeJerkMagnitudeStdDeviation
  - frequencyBodyAccelerationMeanXYZ
  - frequencyBodyAccelerationStdDeviationXYZ
  - frequencyBodyAccelerationJerkMeanXYZ
  - frequencyBodyAccelerationJerkStdDeviationXYZ
  - frequencyBodyGyroscopeMeanXYZ
  - frequencyBodyGyroscopeStdDeviationXYZ
  - frequencyBodyAccelerationMagnitudeMean
  - frequencyBodyAccelerationMagnitudeStdDeviation
  - frequencyBodyBodyAccelerationJerkMagnitudeMean
  - frequencyBodyBodyAccelerationJerkMagnitudeStdDeviation
  - frequencyBodyBodyGyroscopeMagnitudeMean
  - frequencyBodyBodyGyroscopeMagnitudeStdDeviation
  - frequencyBodyBodyGyroscopeJerkMagnitudeMean
  - frequencyBodyBodyGyroscopeJerkMagnitudeStdDeviation 


## Info about summary choices
In step 5 (see below) a tidy data set with the average of each variable for each activity and each subject was created. I exptect to get 180 datasets as there are 30 subjects an each has 6 activities.
The dataset is grouped by subject and activity, then the mean / deviation is calculated for every feature.

## Instructions list
### STEP 1: Merges the training and the test sets to create one data set.

Read all data from the given datasets test and training. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

First stick together column-wise the subject, activity and data for the train set. Also stick together column-wise the subject, activity and data for the test set.
Then stick together those two sets row-wise to get a big dataset with first column is the Subject (User), the second is his activity and all other columns are the collected data.

### STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

I read the label information from the given features_info.txt file. To get the wanted data I select only columns that have std() or mean() in the name. 
After knowing the column numbers I can take the subset from the complete data.
      
### STEP 3: Uses descriptive activity names to name the activities in the data set

The data contains information about the activity only a numbers. I change the numbers to the activity-name. For better readability I did not use the exact names of the given activity_labels.txt file.
1 -> Walking, 2 -> WalkingUpstairs, 3 -> WalkingDownstairs, 4 -> Sitting, 5 -> Standing, 6 -> Laying

### STEP 4: Appropriately labels the data set with descriptive variable names. 
      
Now the data get descriptive columns Names instead of V1, V2 ... I decided to replace abbreviations with complete names
t -> time
f -> frequency
Mag -> Magnitude
Acc -> Acceleration
Gyro -> Gyroscope
std -> StdDeviation (i think std is well known)
Freq -> Frequency
Also I removed brackets() and -
      
Then I give the column names to the matrix subset.

### STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I exptect to get 180 datasets as there are 30 subjects an each has 6 activities.

The dataset is grouped by subject and activity, then the mean is calculated for every feature.
      
### FINISH 

Finally we write out the tidy dataset with all the mean data into a file called tidyAverage.txt

