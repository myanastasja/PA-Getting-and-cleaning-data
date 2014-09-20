## Instructions: 
## After downloading and unzipping file
## leave "UCI HAR Dataset" Directory as it was originaly formed by unzipping
## If you have already downloaded and extracted the file, skip the commands commented with "SKIP":
## fileUrl... 
## download.file...
## unzip...

library("stringr")
library("plyr")
library("reshape")

# SKIP
# DOWNLOADING ZIP FILE...IT WILL TAKE FEW MINUTES... Skip if downloaded manually
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile="UCI HAR Dataset.zip")
# SKIP
## UNZIP FILE... Skip if unzipped manually
unzip("UCI HAR Dataset.zip")

## FUNCTION FOR EXPLORING ALL FILES IN UNZIPPED DIRECTORY
explore_dir <- function (root="UCI HAR Dataset", k=1) {
    library("stringr")
    library("reshape")
    library("plyr")
    folder <- root
    if (length(dir(root)) > 0) {
        n <- length(dir(root))
        infolder <- dir(root)
        for (i in 1:n) {
            full_infolder <- str_c(folder, infolder[i], sep = "/")
            if (length(dir(full_infolder)) == 0) {
                print(full_infolder)
                data_name <- str_sub(infolder[i], start = 1, end = (str_length(infolder[i])-4))
                k <- k+1
            } else {
                explore_dir(full_infolder, k)
            }                
        }
    } else {
        print("root is file or non-existing")
        print(root)
    }
}

## CHECKING ALL FILES... Result must be same like commented below
explore_dir()
# [1] "UCI HAR Dataset/activity_labels.txt"
# [1] "UCI HAR Dataset/features.txt"
# [1] "UCI HAR Dataset/features_info.txt"
# [1] "UCI HAR Dataset/README.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"
# [1] "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"
# [1] "UCI HAR Dataset/test/subject_test.txt"
# [1] "UCI HAR Dataset/test/X_test.txt"
# [1] "UCI HAR Dataset/test/y_test.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
# [1] "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
# [1] "UCI HAR Dataset/train/subject_train.txt"
# [1] "UCI HAR Dataset/train/X_train.txt"
# [1] "UCI HAR Dataset/train/y_train.txt"


## READING COMMON DATA AND NAMING COLUMNS
features <-  read.csv("UCI HAR Dataset/features.txt", header=FALSE, sep="") 
colnames(features) <- c("feature_id", "feature")
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE,sep="")
colnames(activity_labels) <- c("activity_id", "activity")

##READING TEST DATA AND NAMING COLUMNS
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="") ## who performed 1-30
colnames(subject_test) <- c("subject")
X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
colnames(X_test) <- make.names(features$feature, unique = TRUE, allow_ = TRUE)
y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="") ## activity performed 1-6
colnames(y_test) <- "activity_id"


body_acc_x_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE, sep="")
colnames(body_acc_x_test) <- make.names(rep("body_acc_x", 128), unique = TRUE, allow_ = TRUE)

body_acc_y_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header=FALSE, sep="")
colnames(body_acc_y_test) <- make.names(rep("body_acc_y", 128), unique = TRUE, allow_ = TRUE)

body_acc_z_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header=FALSE, sep="")
colnames(body_acc_z_test) <- make.names(rep("body_acc_z", 128), unique = TRUE, allow_ = TRUE)

body_gyro_x_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE, sep="")
colnames(body_gyro_x_test) <- make.names(rep("body_gyro_x", 128), unique = TRUE, allow_ = TRUE)

body_gyro_y_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header=FALSE, sep="")
colnames(body_gyro_y_test) <- make.names(rep("body_gyro_y", 128), unique = TRUE, allow_ = TRUE)

body_gyro_z_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header=FALSE, sep="")
colnames(body_gyro_z_test) <- make.names(rep("body_gyro_z", 128), unique = TRUE, allow_ = TRUE)

total_acc_x_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE, sep="")
colnames(total_acc_x_test) <- make.names(rep("total_acc_x", 128), unique = TRUE, allow_ = TRUE)

total_acc_y_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header=FALSE, sep="")
colnames(total_acc_y_test) <- make.names(rep("total_acc_y", 128), unique = TRUE, allow_ = TRUE)

total_acc_z_test <- read.csv("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE, sep="")
colnames(total_acc_z_test) <- make.names(rep("total_acc_z", 128), unique = TRUE, allow_ = TRUE)

##READING TRAIN DATA AND NAMING COLUMNS
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="") ## who performed 1-30
colnames(subject_train) <- c("subject")
x_train <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
colnames(x_train) <- make.names(features$feature, unique = TRUE, allow_ = TRUE)
y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="") ## activity performed 1-6
colnames(y_train) <- "activity_id"


body_acc_x_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE, sep="")
colnames(body_acc_x_train) <- make.names(rep("body_acc_x", 128), unique = TRUE, allow_ = TRUE)

body_acc_y_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE, sep="")
colnames(body_acc_y_train) <- make.names(rep("body_acc_y", 128), unique = TRUE, allow_ = TRUE)

body_acc_z_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE, sep="")
colnames(body_acc_z_train) <- make.names(rep("body_acc_z", 128), unique = TRUE, allow_ = TRUE)

body_gyro_x_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE, sep="")
colnames(body_gyro_x_train) <- make.names(rep("body_gyro_x", 128), unique = TRUE, allow_ = TRUE)

body_gyro_y_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE, sep="")
colnames(body_gyro_y_train) <- make.names(rep("body_gyro_y", 128), unique = TRUE, allow_ = TRUE)

body_gyro_z_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE, sep="")
colnames(body_gyro_z_train) <- make.names(rep("body_gyro_z", 128), unique = TRUE, allow_ = TRUE)

total_acc_x_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE, sep="")
colnames(total_acc_x_train) <- make.names(rep("total_acc_x", 128), unique = TRUE, allow_ = TRUE)

total_acc_y_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE, sep="")
colnames(total_acc_y_train) <- make.names(rep("total_acc_y", 128), unique = TRUE, allow_ = TRUE)

total_acc_z_train <- read.csv("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE, sep="")
colnames(total_acc_z_train) <- make.names(rep("total_acc_z", 128), unique = TRUE, allow_ = TRUE)

## BINDING TEST AND TRAIN DATA
subject <-rbind(subject_test, subject_train)
x <- rbind(X_test, x_train)
y <- rbind(y_test, y_train)
body_acc_x <- rbind(body_acc_x_test, body_acc_x_train) 
body_acc_y <- rbind(body_acc_y_test, body_acc_y_train) 
body_acc_z <- rbind(body_acc_z_test, body_acc_z_train) 
body_gyro_x <- rbind(body_gyro_x_test, body_gyro_x_train) 
body_gyro_y <- rbind(body_gyro_y_test, body_gyro_y_train) 
body_gyro_z <- rbind(body_gyro_z_test, body_gyro_z_train) 
total_acc_x <- rbind(total_acc_x_test, total_acc_x_train) 
total_acc_y <- rbind(total_acc_y_test, total_acc_y_train) 
total_acc_z <- rbind(total_acc_z_test, total_acc_z_train) 


##JOINING ACTIVITY_LABELS WITH ACTIVITY_DATA y
y_activity <- join(y, activity_labels, by = "activity_id", type = "inner", match = "all")
##JOINING SUBJECT TO ACTIVITY_LABELS AND ACTIVITY_DATA
y_activity_subject <- as.data.frame(list(y_activity, subject))
##JOINING x TO SUBJECT AND ACTIVITY_LABELS AND ACTIVITY_DATA
overall <- as.data.frame(list(y_activity_subject, x))
##JOINING ALL MEASUREMENTS TO x AND SUBJECT AND ACTIVITY_LABELS AND ACTIVITY_DATA
alldetails <- as.data.frame(list(
    overall,
    body_acc_x, 
    body_acc_y, 
    body_acc_z,
    body_gyro_x,
    body_gyro_y,
    body_gyro_z,
    total_acc_x,
    total_acc_y,
    total_acc_z
))

## EXTRACTING COLUMNS WITH MEAN AND STANDARD DEVIATION VALUES
mean_std <- as.data.frame(cbind(
    as.data.frame(overall$activity_id),
    as.data.frame(overall$activity),
    as.data.frame(overall$subject),
    overall[,grep("std",colnames(overall))], 
    overall[,grep("Std",colnames(overall))], 
    overall[,grep("mean",colnames(overall))], 
    overall[,grep("Mean",colnames(overall))]))

##INITIALIZING VARIABLES FOR CREATING NEW CLEAN DATA SET
mean_col <- mean_std[1,1]
mean_values <- mean_std[1,]

##SPLITTING DATA SET BY SUBJECTS
mean_std_by_subject <- split(mean_std, overall$subject)

##SPLITTING EACH SUBJECT GROUP BY ACTIVITIES
for (i in 1:length(mean_std_by_subject)) {
    mean_std_by_sub_act  <- split(mean_std_by_subject[[i]], mean_std_by_subject[[i]][,1])

##CALCULATING MEAN VALUE FOR EACH ACTIVITY OF ONE SUBJECT
    for (j in 1:length(mean_std_by_sub_act)) {
        for (k in 4:ncol(mean_std_by_sub_act[[j]])) {
            value <- mean(mean_std_by_sub_act[[j]][,k])
            names(value) <- names(mean_std_by_sub_act[[j]][,k])
            if (k==4) {mean_col <- value} else {mean_col <- cbind(mean_col, value)}
        }
        new_row <- cbind(mean_std_by_sub_act[[j]][1,1:3], mean_col)
        if (j==1 && i==1) {mean_values <- new_row} else {mean_values <- rbind(mean_values,new_row)}
        mean_col <- mean_std[1,1]
    }
    
}
names(mean_values) <- names(mean_std)

## SHOWING HEAD OF FIRST FEW COLUMNS OF CLEAN DATA SET
head(mean_values[,1:5])

## WRITING CLEAN DATA SET INTO FILE 
# write.csv(mean_values, file = "Clean data set.csv")
write.table(mean_values, file = "Clean data set.txt", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE)
