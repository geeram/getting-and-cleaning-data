## DEPENDANCE
require(plyr)

## EXTRACT DATA FROM DATA SETS
features <- read.table("features.txt", sep = "", colClasses = c("character"))
activity.labels <- read.table("activity_labels.txt", sep = "", col.names = c("ActivityId", "Activity"))
xtrain <- read.table("train/X_train.txt", sep = "")
ytrain <- read.table("train/y_train.txt", sep = "")
strain <- read.table("train/subject_train.txt", sep = "")
xtest <- read.table("test/X_test.txt", sep = "")
ytest <- read.table("test/y_test.txt", sep = "")
stest <- read.table("test/subject_test.txt", sep = "")

## MERGE TRAIN AND TEST DATA SETS
train.sensor.data <- cbind(cbind(xtrain, strain), ytrain)
test.sensor.data <- cbind(cbind(xtest, stest), ytest)
sensor.data <- rbind(train.sensor.data, test.sensor.data)

## COLUMN LABELS
sensor.labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor.data) <- sensor.labels

## EXTRACT ONLY THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
sensor.data.mean.std <- sensor.data[,grepl("mean|std|Subject|ActivityId", names(sensor.data))]

## ASSIGN DESCRIPTIVE ACTIVITY NAMES
sensor.data.mean.std <- join(sensor.data.mean.std, activity.labels, by = "ActivityId", match = "first")
sensor.data.mean.std <- sensor.data.mean.std[,-1]

## REMOVE PARENTHESES
names(sensor.data.mean.std) <- gsub('\\(|\\)',"",names(sensor.data.mean.std), perl = TRUE)

## MAKE SYNTACTICALLY VALID NAMES
names(sensor.data.mean.std) <- make.names(names(sensor.data.mean.std))

## TIDY UP THE COLUMN NAMES
names(sensor.data.mean.std) <- gsub('Acc',"Acceleration",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('GyroJerk',"AngularAcceleration",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('Gyro',"AngularSpeed",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('Mag',"Magnitude",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('^t',"TimeDomain.",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('^f',"FrequencyDomain.",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('\\.mean',".Mean",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('\\.std',".StandardDeviation",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('Freq\\.',"Frequency.",names(sensor.data.mean.std))
names(sensor.data.mean.std) <- gsub('Freq$',"Frequency",names(sensor.data.mean.std))

## CREATE AN INDEPENDANT TIDY DATA SET AND SAVE AS "tidydata.txt"
sensor.tidydata = ddply(sensor.data.mean.std, c("Subject","Activity"), numcolwise(mean))
write.table(sensor.tidydata, file = "tidydata.txt")
