GalaxyTidyData
==============

### Project Getting and Cleaning Data

The Project was to tidy up a dataset.

### Instructions

To run the analysis you have to follow several steps as this repository has no data. 

1. Clone the Repo https://github.com/ClaRaBo/GalaxyTidyData to get the file run_analysis.R. When you have the folder on your own PC follow step 2.

2. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip the dataset into the Repo so you get the UCI HAR Dataset folder at the samle level like the run_analysis.R file

4. Open R Studio and set the working directory to your Repo, where the run_analysis.R file is located, too.

5. Run the file with run_analysis()

6. A tidy ouput file called tidAverage.txt will be generated in the Workspace folder. It contains the averages of each user and each activity.

### Overwiew of tidy-up steps

A detailed version is found in the Codebook.md

Overview:

1. The dataset contains train and test data as well as info about the subject and activity. First the data is read and  connected column-wise with the subject and activity. After this the train and test data is connected row-wise.

2. Then I extract only the measurements of the mean and standard deviation for each measurement. Subject and activity will stay, too. 

3. Descriptive activity names like Walking are given to name the activities in the data, that are still numbers [1..6].

4. The dataset columns get appropriate labels with descriptive variable names. For detailed info look at the column-names in the CodeBook.

5. From the data set created in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is summarized an written to a file.

### CodeBook 

The CodeBook is found in the file CodeBook.md. It contains a description of the original dataset, the tidy-up process,  and the variables.

