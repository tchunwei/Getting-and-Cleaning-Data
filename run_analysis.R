# Download and unzip data
filename <- "data.zip"
if (!file.exists(filename)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = filename, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

# Read train data set
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data set
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merges the train and test data sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Read features name and put as col name of x
features <- read.table("UCI HAR Dataset/features.txt")
colnames(x) <- features[,2]

# Only need col with mean() and std(), filter col of x
selected_features <- grep("-(mean|std)\\(\\)", features[,2])
x <- x[,selected_features]

# Read activity names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Bind activity (y) to x with a descriptive activity names, put result in 'data'
y_names <- activity_labels[y[,1], 2]
data <- cbind(activity = y_names, x)

# Bind subject to data
data <- cbind(subject = subject[,1], data)

# Melt the data into narrow format
melted <- melt(data, c("activity", "subject"))

# Cast the melted data back into wide format, to get average of each variable for each activity and each subject.
tidy <- dcast(melted, subject + activity ~ variable, mean)

# Write the tidy data into tidy.txt
write.table(tidy, "tidy.txt", row.name=FALSE)