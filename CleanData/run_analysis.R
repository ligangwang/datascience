#combined activity with train and test
acts <- rbind(read.table('./UCI HAR Dataset/train/y_train.txt'), read.table('./UCI HAR Dataset/test/y_test.txt'))
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
acts <- merge(act, activities, by="V1")[2]

#combined subject with train and test
subs <- rbind(read.table('./UCI HAR Dataset/train/subject_train.txt'), read.table('./UCI HAR Dataset/test/subject_test.txt'))

#combined features with train and set
x <- rbind(read.table('./UCI HAR Dataset/train/X_train.txt'), read.table('./UCI HAR Dataset/test/X_test.txt'))
raw_features <- read.table('./UCI HAR Dataset/features.txt')
features <- subset(raw_features, grepl('mean', raw_features[[2]]) | grepl('std', raw_features[[2]]))

#extract on mean and std columns
x <- subset(x, select = features[[1]])
colnames(x) <- features[[2]]
colnames(subs)[1] <- 'subject'
colnames(acts)[1] <- 'activity'

#combine subject, activity and features into one data frame
df <- cbind(subs, acts, x)

#get avg data by subject, activity
result <- aggregate(df[, 3:ncol(df)], list(df$subject, df$activity), mean)
colnames(result)[1] <- 'subject'
colnames(result)[2] <- 'activity'

#output into text file
write.table(result, file="./avg_per_subject_activity.txt", row.names = FALSE)