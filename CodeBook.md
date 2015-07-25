#Code Book

Below explains each of the variable used in the process to get the tidy data set:
* `x_train`, `y_train` and `subject_train` refer to the raw data read in from the train data sets
* `x_test`, `y_test` and `subject_test` refer to the raw data read in from the test data sets
* `x`, `y` and `subject` contain raw data merged from both the train and test data sets
* `features` contains the feature names that represent each of the columns in `x`
* `selected_features` is a subset of `features` that contains only the features we need, the mean and std value
* `activity_labels` contains the loaded activity labels
* `y_names` is actually `y`, but replace the numeric values in `y` with descriptive activity names
* `data` contains all the data that binds `x` - the selected features values, `y_names` - the activity with descriptive names and `subject` altogether
* `melted` contains narrow version of `data`
* `tidy` contains the tidy data set of each variable for each activity and each subject

Outcome of the script is a file named `tidy.txt` that contains data of `tidy`