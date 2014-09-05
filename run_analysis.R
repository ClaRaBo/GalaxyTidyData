run_analysis <- function() {
 
      # -------------- STEP 1
      # Merges the training and the test sets to create one data set.
      
      dataSetTest <- read.table("UCI HAR Dataset\\test\\X_test.txt")
      dataLabelsTest <- read.table("UCI HAR Dataset\\test\\y_test.txt")
      dataSubjectTest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
      dataSetTrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")
      dataLabelsTrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")
      dataSubjectTrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
      

      #First Col: Who; Second Col: What; Else: Data
      allTest <- cbind(dataSubjectTest, dataLabelsTest, dataSetTest)
      allTrain <- cbind(dataSubjectTrain, dataLabelsTrain, dataSetTrain)

      # Now make the whole Dataset to attach Train below Test
      cplData <- rbind(allTest, allTrain)
      

      # ---------------------------- STEP 2
      # Extracts only the measurements on the mean and standard deviation for each measurement. 
      
      # Get labels for Data
      dataFeatures <- read.table("UCI HAR Dataset\\features.txt")
      
      # extract all Column -Numbers that have std() or mean()  // should be 79
      # fetch std() mean() but also meanFreq() 
      # as the angle contains Mean with capital letter I get only necessary measures
      relevantFeatures <- subset(dataFeatures, grepl("std", dataFeatures$V2) |  grepl("mean", dataFeatures$V2))
      
      #make a subset with only relevant Columns
      #Need No 1 (Subject), 2 (Activity), Else: alls std and mean (have to be shifted as we have 2 additional rows)
      subset <- cplData[,c(1,2,relevantFeatures$V1 + 2)]
 
      # ----------------------------- STEP 3
      # Uses descriptive activity names to name the activities in the data set
      
      
      # Now give the second column Names of the Activities instead of integers
      # Decided to not use the Labels to avoid everything written in capitals for better readability
      # original mapping is found in activity_labels.txt
      subset[[2]] <- sub("1", "Walking", subset[[2]])
      subset[[2]] <- sub("2", "WalkingUpstairs", subset[[2]])
      subset[[2]] <- sub("3", "WalkingDownstairs", subset[[2]])
      subset[[2]] <- sub("4", "Sitting", subset[[2]])
      subset[[2]] <- sub("5", "Standing", subset[[2]])
      subset[[2]] <- sub("6", "Laying", subset[[2]])
      

      # ------------------------------- STEP 4
      # Appropriately labels the data set with descriptive variable names. 
      
      # Now the data get descriptive Names instead of V1 .. V52
      # Decided to replave abbreviations with complete names
      relevantFeatures[[2]] <- sub("tBody", "timeBody", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("fBody", "frequencyBody", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("Mag", "Magnitude", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("Acc", "Acceleration", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("Gyro", "Gyroscope", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("mean", "Mean", relevantFeatures[[2]])
      # As std ist very common I decided to leave it to save a bit space
      relevantFeatures[[2]] <- sub("std", "StdDeviation", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("\\(\\)", "", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("\\-", "", relevantFeatures[[2]])
      relevantFeatures[[2]] <- sub("Freq", "Frequency", relevantFeatures[[2]])
      
      
      colNames <- c("Subject", "Activity", relevantFeatures[[2]])
      colnames(subset) <- colNames
      
      # ------------------------------ STEP 5
      # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      
      
      # Each activity / each subject -> 30*6 maximum / expect 180 as I think every subject has every activity
      # average of each Feature
      # to have it easier I use a dataTable
      library(data.table)
      dt<- data.table(subset)
      tidyMean<- dt[, lapply(.SD, mean), by=c("Subject", "Activity")]
      
      # To check if every Subject has 6 entries I order it
      tidyMean <- tidyMean[order(tidyMean$Subject),]
      
      # ------------------------------ FINISH 
      # writeTableOut as .txt
      # write.table() using row.name=FALSE
      
      write.table(tidyMean, "tidyAverage.txt", row.names = FALSE)
      
      # return Tidy Average
      tidyMean
}
      
      
      
      
      
      
      
      
      
      
      
}