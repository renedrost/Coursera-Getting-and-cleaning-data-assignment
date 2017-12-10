Code book
---
### Input data
The input data consists of the following files:

- **activity_label.txt**<br>
The enumeration of all activities.
- **features.txt**<br>
The complete list of variables found in the data files (*train/X_train.txt* and *test/X_test.txt*).
- **train / X_train.txt**<br>
All observations done in the experiment by the training group.
- **train / y_train.txt**<br>
Per observation a reference to the activity.
- **train / subject_train.txt**<br>
Per observation a reference to the person who performed the activity.
- **test / X_test.txt**<br>
All observations done in the experiment by the test group.
- **test / y_test.txt**<br>
Per observation a reference to the activity.
- **test / subject_test.txt**<br>
Per observation a reference to the person who performed the activity.

### Transformation
The following steps were taken to transform the data into tidy data:

- Activity enumeration (*activity_label.txt*) is read, and provided with readable columnnames.
- Features (*features.txt*) are read:
    - determine the features we are interested in. The name of these features contain *mean()* or *std()*.
    - provide feature tabel with a readable columnname. 
    - tidy the names by performing the following actions:
        - remove *(* and *)*
        - remove - and uppercase next character
        - replace starting *t* with *time*
        - replace starting *f* with *frequency*
- Read trainingset (*X_train.txt*, *y_train.txt* and *subject_train.txt*) and perform the following transformations:
    - Remove unwanted columns from the training data.
    - Add colnames (the features read before) to the training data.
    - Add colnames to the activity data and subject data.
    - Convert activity data to activity names.
    - Add columns with activity names and subject IDs to the training data.
- Read testset (*X_test.txt*, *y_test.txt* and *subject_test.txt*) and perform the following transformations:
    - Remove unwanted columns from the training data.
    - Add colnames (the features read before) to the test data.
    - Add colnames to the activity data and subject data.
    - Convert activity data to activity names.
    - Add columns with activity names and subject IDs to the test data.
- Combine the rows of the training and test sets.

### Result
For computing the mean the following steps were taken:

- group by subject and activity
- compute mean for each subject/activity pair

At the end the resulting set was written to the file *tidy_data.txt*.

The resulting data set consists of the following variables:

- subjectID 
- activityName 
- timeBodyAccMeanX 
- timeBodyAccMeanY 
- timeBodyAccMeanZ 
- timeBodyAccStdX 
- timeBodyAccStdY 
- timeBodyAccStdZ 
- timeGravityAccMeanX 
- timeGravityAccMeanY 
- timeGravityAccMeanZ 
- timeGravityAccStdX 
- timeGravityAccStdY 
- timeGravityAccStdZ
- timeBodyAccJerkMeanX 
- timeBodyAccJerkMeanY
- timeBodyAccJerkMeanZ
- timeBodyAccJerkStdX
- timeBodyAccJerkStdY
- timeBodyAccJerkStdZ
- timeBodyGyroMeanX
- timeBodyGyroMeanY
- timeBodyGyroMeanZ
- timeBodyGyroStdX
- timeBodyGyroStdY
- timeBodyGyroStdZ
- timeBodyGyroJerkMeanX
- timeBodyGyroJerkMeanY
- timeBodyGyroJerkMeanZ
- timeBodyGyroJerkStdX
- timeBodyGyroJerkStdY
- timeBodyGyroJerkStdZ
- timeBodyAccMagMean
- timeBodyAccMagStd
- timeGravityAccMagMean
- timeGravityAccMagStd
- timeBodyAccJerkMagMean
- timeBodyAccJerkMagStd
- timeBodyGyroMagMean
- timeBodyGyroMagStd
- timeBodyGyroJerkMagMean
- timeBodyGyroJerkMagStd
- frequencyBodyAccMeanX
- frequencyBodyAccMeanY
- frequencyBodyAccMeanZ
- frequencyBodyAccStdX
- frequencyBodyAccStdY
- frequencyBodyAccStdZ
- frequencyBodyAccJerkMeanX
- frequencyBodyAccJerkMeanY
- frequencyBodyAccJerkMeanZ
- frequencyBodyAccJerkStdX
- frequencyBodyAccJerkStdY
- frequencyBodyAccJerkStdZ
- frequencyBodyGyroMeanX
- frequencyBodyGyroMeanY
- frequencyBodyGyroMeanZ
- frequencyBodyGyroStdX
- frequencyBodyGyroStdY
- frequencyBodyGyroStdZ
- frequencyBodyAccMagMean
- frequencyBodyAccMagStd
- frequencyBodyBodyAccJerkMagMean
- frequencyBodyBodyAccJerkMagStd
- frequencyBodyBodyGyroMagMean
- frequencyBodyBodyGyroMagStd
- frequencyBodyBodyGyroJerkMagMean
- frequencyBodyBodyGyroJerkMagStd
