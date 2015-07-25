##Getting and Cleaning Data - Course Project

This repo contains files for the submission of the course project:
* `run_analysis.R` - the script used to process the data to get the tidy data set
* `CodeBook.md` - describes all variables used in the script
* `tidy.txt` - the tidy data as the outcome of the script

The `run_analysis.R` script does the following:
1. Download and unzip the raw data if it's not found
2. Read both the train and the test data sets respectively
3. Merge both train and test data sets into single data set
4. Read the feature names and map it to the columns of the data set
5. Filter columns of the data set with the features that we want, the mean and std features
6. Read the activity names and bind to the data set
7. Bind subjects to data set
8. Melt the data into narrow format
9. Cast the melted data back into wide format, to get average of each variable for each activity and each subject.
10. Output the tidy data as "tidy.txt"