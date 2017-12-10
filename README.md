Coursera Getting and cleaning data - Programming Assignment
---
### Introduction
This respostory has been created for the Coursera Getting and cleaning data week 4 assignment.

For running the R-script properly you should copy both the script *run_analysis.R* and the directory *UCI HAR Dataset* into your working directory.

### Input dataset
In the directory *UCI HAR Dataset* is the complete dataset available. This assignment only uses the following files:

+ activity_labels.txt
+ features_info.txt
+ features.txt
+ train / subject_train.txt
+ train / X_train.txt
+ train / y_train.txt
+ test / subject_test.txt
+ test / X_test.txt
+ test / y_test.txt

### The script
In general the script is performing the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Output
After running the script the file *tidy_data.txt* has been created in the working directory.
This file contains the means for all features for each pair subject/activity.
