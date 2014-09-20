## COURSERA - GETTING AND CLEANING DATA
COURSE PROJECT, SEP 2014.

## PROJECT DETAILS:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## TASKS:
Create one R script called **'run_analysis.R'** that does the following: 
- Merges the *'training'* and the *'test'* sets to create one *'newdata'*.
- Extracts only the measurements on the *'mean'* and *'standard deviation'* for each measurement. 
- Uses descriptive activity *'labels'* to name the activities in the *'newdata'*.
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## STEPS:
1. Download the data set from the above URL and unzip the contents.
2. Change to the working directory: **"UCI HAR Dataset"**.
3. Run the file **"run_analysis.R"**.
4. A new tidy data set will be created and saved in to a file **"tidydata.txt"**

## Files included.
* **README.md** : This file
* **CodeBook.md** : The codebook describing variables, the data and transformations
* **run_analysis.R** : The R code to run to transform the data.
* A new file named **tidydata.txt** will be generated when yo run the code

## DEPENDANCE:
The code runs with the *standard libraries* of R without needing additional packages.

