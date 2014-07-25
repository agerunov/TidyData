###########################################################
Script for Cleaning the Human Activity Recognition Dataset
###########################################################


## Downolad and unzip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "activity.zip")
unzip(activity.zip)

## Read-in data
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Put existing labels on data
names(xtrain) <- features[,2]
names(xtest) <- features[,2]

## Give a descriptive name to variable which classifies activity and respondent
names(subject.test) <- "subject"
names(subject.train) <- "subject"
names(ytrain) <- "activity"
names(ytest) <- "activity"

## Add activity classification to the two datasets
xtest <- cbind(subject.test, xtest, ytest)
xtrain <- cbind(subject.train, xtrain, ytrain)

## Investigate subject numbers in training and test datasets
summary(as.factor(subject.train$subject))
summary(as.factor(subject.test$subject))

## Task 1: Merge the training and the test sets to create one data set
complete <- rbind(xtrain, xtest)


## Task 2: Extract only the measurements on the mean and standard deviation for each measurement
# To do this one can use the grep command looking for patterns "mean" and "std"
# Then we add also identfiers for subject and activity and subset acccordingly
final <- complete[, grep("subject|mean|std|activity",names(complete))]

## Task 3: Use descriptive activity names to name the activities in the data set
library(car)
final$activity <- recode(final$activity, "1='Walking'; 2='Walk.Upstairs'; 3='Walk.Downstairs'; 4='Sitting'; 5='Standing'; 6='Laying' ")

## Task 4: Appropriately label the data set with descriptive variable names
# We have already put decriptive labels on the measured data (via the features file)
# We will now convert them to valid names and remove brackets, dashes and underscores to improve human readability
names(final) <- make.names(names(final))
names(final) <- sub("std..", "std", names(final))
names(final) <- sub("mean..", "mean", names(final))
names(final) <- sub("meaneq..", "meanFrequency", names(final))

# Variables are renamed so that it is clear whether they refer to the "time" or the "frequency" domain
names(final) <- sub("^t", "time.", names(final))
names(final) <- sub("^f", "frequency.", names(final))

# Variables are renamed so that it is clear whether measurements come from accelerometer or gyroscope
names(final) <- sub("Gyro", "Gyroscope", names(final))
names(final) <- sub("Acc", "Accelerometer", names(final))

# Variables are renamed so that dimensions (axes), standard deviations and magnitutes are clearly spelled out
names(final) <- sub("X", "axisX", names(final))
names(final) <- sub("Y", "axisY", names(final))
names(final) <- sub("Z", "axisZ", names(final))
names(final) <- sub("Mag", "Magnitude", names(final))
names(final) <- sub("std", "StandardDeviation", names(final))

## Task 5: Create a second, independent tidy data set and save it as a .txt file
write.table(final, file="Activity.TidyData.txt")
