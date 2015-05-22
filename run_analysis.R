####
#
# filename  : run_analysis.R
# format    : R script
# objective : collect and clean a data set
# system    : Linux
# directory : working directory is "~/tmp/data"
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only mean and standard deviation measurement data.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#

###
#
# Install R packages (namespaces) this script uses :
#   "data.table"
#   "reshape2"
# note : the namespace "reshape2" is automatically imported by "data.table"
#
if (!require("data.table")) {
    install.packages("data.table")
}
library("data.table")
library("reshape2")

###
#
# Directory - create if necessary and go to a working directory
#
# save user's current directory to restore at the end of this script
save_dir <- getwd()
# set working directory to users default directory
setwd("~")
# Put data in user's working directory under "~/tmp/data"
if (!file.exists("tmp")) {
    dir.create("tmp")
}
setwd("tmp")
if (!file.exists("data")) {
    dir.create("data")
}

###
#
# Download from the Internet the project data
# Human Activity Recognition Using Smartphones Data Set
#
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(url, temp, method="curl", mode="wb")
unzip(temp, exdir = "./data")
rm(temp)

###
#
# 1. Read the activity labels (same labels for the test and training data sets)
# 2. Read the column names for the measurements (same names for the test and
#    training data sets)
#
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]
column_names    <- read.table("./data/UCI HAR Dataset/features.txt")[,2]

###
#
# Read and consolidate (rbind) the "test" and "training" measurement data sets
#
X_test  <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
X_data  =  rbind(X_test, X_train)
# clean up no-longer-needed data frames to free up some memory
rm(X_test); rm(X_train)

y_test  <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
y_data  =  rbind(y_test, y_train)
# clean up no-longer-needed data frames to free up some memory
rm(y_test); rm(y_train)

subject_test  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_data  =  rbind(subject_test, subject_train)
# clean up no-longer-needed data frames to free up some memory
rm(subject_test); rm(subject_train)

# give the columns proper names!
names(X_data) = column_names

# extract only columns concerning mean and standard deviation mesurements
X_data = X_data[,grepl("mean|std", column_names)]

# use descriptive activity names to name the activities in the data set
y_data[,2] = activity_labels[y_data[,1]]
names(y_data) = c("Activity_ID", "Activity_Label")
names(subject_data) = "subject"

# bind the data
data <- cbind(as.data.table(subject_data), y_data, X_data)

id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels <- names(data)[-seq(along=id_labels)]
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# apply mean function to dataset using dcast function
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./data/tidy_data.txt", row.names=FALSE)

# restore the user's original current directory
setwd(save_dir)
