activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
raw_features <- read.table('./UCI HAR Dataset/features.txt')
features <- subset(raw_features, grepl('mean', features[[2]]) | grepl('std', features[[2]]))

acts <- rbind(read.table('./UCI HAR Dataset/train/y_train.txt'), read.table('./UCI HAR Dataset/test/y_test.txt'))
acts <- merge(act, activities, by="V1")[2]
subs <- rbind(read.table('./UCI HAR Dataset/train/subject_train.txt'), read.table('./UCI HAR Dataset/test/subject_test.txt'))
x <- rbind(read.table('./UCI HAR Dataset/train/X_train.txt'), read.table('./UCI HAR Dataset/test/X_test.txt'))
x <- subset(x, select = features[[1]])
colnames(x) <- features[[2]]
colnames(subs)[1] <- 'subject'
colnames(acts)[1] <- 'activity'
df <- cbind(subs, acts, x)

#step 5
result <- aggregate(df[, 3:ncol(df)], list(df$subject, df$activity), mean)
colnames(result)[1] <- 'subject'
colnames(result)[2] <- 'activity'

write.table(result, file="./avg_per_subject_activity.txt", row.names = FALSE)