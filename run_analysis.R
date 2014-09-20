## COURSERA - GETTING AND CLEANING DATA - COURSE PROJECT, SEP 2014.
## Create one R script called 'run_analysis.R' that does the following: 
## Merges the 'train' and the 'test' sets to create one 'newdata'.
## Extracts only the measurements on the 'mean' and 'standard deviation' for each measurement. 
## Uses descriptive activity 'labels' to name the activities in the 'newdata'.
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each
## activity and each subject.

## Set the working directory. (Eg: setwd("~/Documents/Coursera/UCI HAR Dataset")
## read and organize data
testlabels <- read.table("test/y_test.txt", col.names="label")
testsubjects <- read.table("test/subject_test.txt", col.names="subject")
testdata <- read.table("test/X_test.txt")
trainlabels <- read.table("train/y_train.txt", col.names="label")
trainsubjects <- read.table("train/subject_train.txt", col.names="subject")
traindata <- read.table("train/X_train.txt")

## code to merge data sets.
newdata <- rbind(cbind(testsubjects, testlabels, testdata),
              cbind(trainsubjects, trainlabels, traindata))

## read the features.txt
newfeatures <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

## extract mean and standard deviation. Increment by 2 because data has subjects and labels in ## the beginning.
newfeatures.meansd <- newfeatures[grep("mean\\(\\)|std\\(\\)", newfeatures$V2), ]
newdata.meansd <- newdata[, c(1, 2, newfeatures.meansd$V1+2)]

## read activity_labels.txt and replace with label names
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
newdata.meansd$label <- labels[newdata.meansd$label, 2]

## List column names and feature names, remove non-alphabetic character.
newcolnames <- c("subject", "label", newfeatures.meansd$V2)
newcolnames <- gsub("[^[:alpha:]]", "", newcolnames)
colnames(newdata.meansd) <- newcolnames

## get the means for subject and label
newdata2 <- aggregate(newdata.meansd[, 3:ncol(newdata.meansd)],
                       by=list(subject = newdata.meansd$subject, 
                               label = newdata.meansd$label),
                       mean)

## write to tidydata.txt
write.table(format(newdata2, scientific=T), "tidydata.txt",
            row.names=F, col.names=F, quote=2)

