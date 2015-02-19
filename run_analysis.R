library(dplyr)

BuildDataSet <- function () {
#
# creates and returns the test and train data merged into
# a single data frame
#
# then selects the mean / stddev columns and
# returns a dataframe of these columns
  
  cat("Loading testing data...\n\n")
  x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  
  cat("Loading training data...\n\n")
  x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")

  cat("Selecting features and applying names...\n\n")
  features <- read.table("./UCI HAR Dataset/features.txt")
    
  #select only the features which represent mean or standard deviations of the data
  #these are features whose names end with "mean()" or "std()" and DOES NOT include
  #features which are based upon another feature's mean or std calculation
  features.final <- grep("\\S+(?:mean|std)\\(\\)\\S*", features[,2])
  
  data.set <- rbind(x.test, x.train)[, features.final]
  
  names(data.set) <- features[features.final,2]

  return (data.set)
}

ApplyActivityLabels <- function (data) {
#
#  Applies activity labels as factors to the data set
#  in a separate column labeled "activity"

  cat("Loading and applying activity labels...\n\n")
  
  activity.ids <- rbind(
    read.table("./UCI HAR Dataset/test/y_test.txt"),
    read.table("./UCI HAR Dataset/train/y_train.txt")
  )

  activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

  activity.column <- factor(activity.ids[,1],
                            levels = activity.labels[,1],
                            labels = activity.labels[,2])

  return (cbind(activity=activity.column, data))
}

ApplySubjectLabels <- function (data) {
#
# Applies subject data labels to data frame
#
  
  cat("Loading and applying subject testing labels...\n\n")
  
  subject.column <- rbind(
    read.table("./UCI HAR Dataset/test/subject_test.txt"),
    read.table("./UCI HAR Dataset/train/subject_train.txt")
  )[,1]
  
  return (cbind(subject=subject.column, data))
}

AggregateMeans <- function (data) {
#
# Aggregates results grouping by subject and activity
# and applying the mean(0 function to the remaining columns
#
  return (data %>% group_by(subject, activity) %>% summarise_each(funs(mean)))
}

LoadAndMergeData <- function() {
  
  data.set <- BuildDataSet()
  data.set <- ApplyActivityLabels(data.set)
  data.set <- ApplySubjectLabels(data.set)
  data.set <- AggregateMeans(data.set)

  return(data.set)
}

View (LoadAndMergeData())