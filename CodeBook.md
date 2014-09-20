## COURSERA - GETTING AND CLEANING DATA - COURSE PROJECT, SEP 2014.
## CodeBook

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

## The Source of Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## UCI HAR Data set:

The data set is known as **UCI HAR data set** and consists of the folowing directories and files:

## Directories

* UCI HAR Dataset/test/
* UCI HAR Dataset/test/Inertial Signals 
* UCI HAR Dataset/train/
* UCI HAR Dataset/train/Inertial Signals

## Files 

* UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test
* UCI HAR Dataset/train/Inertial Signals/body_acc_x_test.txt
* UCI HAR Dataset/train/Inertial Signals/body_acc_y_test.txt
* UCI HAR Dataset/train/Inertial Signals/body_acc_z_test.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_x_test.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_y_test.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_z_test.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_x_test.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_y_test.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_z_test.txt
* UCI HAR Dataset/train/subject_test.txt
* UCI HAR Dataset/train/X_test.txt
* UCI HAR Dataset/train/y_test
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/features_info.txt
* UCI HAR Dataset/README.txt

## Transformation

Train and test data sets have been merged into a single data set. 
Extracted the mean and standard deviation for each measurement.
Used descriptive activity names to the activities in the data set.
Appropriately labeled.
Created an independant tidy data set from the above data set.
The non alphabetic characters in column names have been removed.

## Tidy data Output

All the values are means, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns. The saved file will be named **"tidydata.txt"**

## Notes

The codes in the file **'run_analysis.R'** executes with the standard libraries in R. No additional libraries are needed.

