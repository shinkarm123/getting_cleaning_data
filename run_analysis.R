# Load required libraries
library(dplyr)

# Set the paths to the data directories
data_dir <- "UCI HAR Dataset"

# Load activity labels and features
activity_labels <- read.table(file.path(data_dir, "activity_labels.txt"), col.names = c("id", "activity"))
features <- read.table(file.path(data_dir, "features.txt"), col.names = c("id", "feature"))

# Extract only the measurements on the mean and standard deviation
selected_features <- grep("-(mean|std)\\(\\)", features$feature)
selected_feature_names <- features$feature[selected_features]

# Load and prepare the training dataset
train_data <- read.table(file.path(data_dir, "train", "X_train.txt"))[, selected_features]
train_labels <- read.table(file.path(data_dir, "train", "y_train.txt"), col.names = "activity_id")
train_subjects <- read.table(file.path(data_dir, "train", "subject_train.txt"), col.names = "subject")
train_dataset <- cbind(train_subjects, train_labels, train_data)

# Load and prepare the test dataset
test_data <- read.table(file.path(data_dir, "test", "X_test.txt"))[, selected_features]
test_labels <- read.table(file.path(data_dir, "test", "y_test.txt"), col.names = "activity_id")
test_subjects <- read.table(file.path(data_dir, "test", "subject_test.txt"), col.names = "subject")
test_dataset <- cbind(test_subjects, test_labels, test_data)

# Merge the training and test datasets
merged_dataset <- rbind(train_dataset, test_dataset)

# Add descriptive activity names
merged_dataset <- merge(merged_dataset, activity_labels, by.x = "activity_id", by.y = "id")
merged_dataset$activity_id <- NULL

# Appropriately label the dataset with descriptive variable names
names(merged_dataset)[3:ncol(merged_dataset) - 1] <- gsub("-", "_", selected_feature_names)
names(merged_dataset) <- gsub("\\(\\)", "", names(merged_dataset))

# Create a second tidy dataset with the average of each variable for each activity and subject
tidy_dataset <- merged_dataset %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Save the tidy dataset to a file
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)

