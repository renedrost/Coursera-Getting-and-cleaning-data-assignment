library(dplyr)

createSet <- function(dataSet, labelSet, subjectSet, activityNames, wantedFeatures, featureSet) {
    ## Remove unwanted columns
    dataSet <- dataSet[, wantedFeatures]
    ## Set columnnames in dataset
    colnames(dataSet) <- featureSet$Description[wantedFeatures]
    ## Set columnname of labelset
    colnames(labelSet) <- c("activityID")
    ## Set columnname of subjectset
    colnames(subjectSet) <- c("subjectID")
    ## Retrieve activitynames for the labelset
    labelSet <- inner_join(labelSet, activityNames, by = "activityID")
    ## Add column with activitynames to dataset
    dataSet <- cbind(activityName = labelSet$activityName, dataSet)
    ## Add cojumn with id's of the subjects
    dataSet <- cbind(subjectID = subjectSet$subjectID, dataSet)
}

## Read activities
activityLabels <- read.table("./UDI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("activityID", "activityName")

## Read features for the training and test set
features <- read.table("./UDI HAR Dataset/features.txt")
## Find all features with mean or std
wantedFeatures <- grep("(mean\\(\\)|std\\(\\))", features[,2], value=FALSE)
## Tidy featurenames
## - remove ()
## - remove - and uppercase next character
## - replace starting t with time
## - replace starting f with frequency
features <- lapply(features, gsub, pattern="\\(\\)", replacement="")
features <- lapply(features, gsub, pattern="\\-m", replacement="M")
features <- lapply(features, gsub, pattern="\\-s", replacement="S")
features <- lapply(features, gsub, pattern="\\-X", replacement="X")
features <- lapply(features, gsub, pattern="\\-Y", replacement="Y")
features <- lapply(features, gsub, pattern="\\-Z", replacement="Z")
features <- lapply(features, gsub, pattern="^t", replacement="time")
features <- lapply(features, gsub, pattern="^f", replacement="frequency")
## Convert to a data.frame
features <- data.frame(features)
## Add colnames to the features data.frame
colnames(features) <- c("ID", "Description")

## Reading all trainig-datafiles
trainSet      <- read.table("./UDI HAR Dataset/train/X_train.txt")
trainLabels   <- read.table("./UDI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("./UDI HAR Dataset/train/subject_train.txt")

## Create merged trainingset
trainSet <- createSet(trainSet, trainLabels, trainSubjects, activityLabels, wantedFeatures, features)


## Reading all test-datafiles
testSet      <- read.table("./UDI HAR Dataset/test/X_test.txt")
testLabels   <- read.table("./UDI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./UDI HAR Dataset/test/subject_test.txt")
## Create merged trainingset
testSet <- createSet(testSet, testLabels, testSubjects, activityLabels, wantedFeatures, features)

## Merge training and test sets
totalSet <- bind_rows(trainSet, testSet)

## Compute mean for each subject/activity/feature.
meanSet <- totalSet %>% group_by(subjectID, activityName) %>% dplyr::summarise_all(funs(mean))

## Write table to "tidy_data.txt"
write.table(meanSet, "./UDI HAR Dataset/tidy_data.txt")
