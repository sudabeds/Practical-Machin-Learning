---
title: "CodeBook"
author: "Sudabe"
date: "December 27, 2015"
output: html_document
---

ProjData: A character vector containing all the addresses in your computer for the original datasets.

subj_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. These are subjects who are part of test group.

X_test: test set

Y_test: test labels

subj_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. These are subjects who are part of train group. 

X_train: training set

Y_train: training labels

test_set: this file is obtained from putting together these three files (subj_test, X_test and Y_test). Therefore it has all the information and measurements for all subjects who were part of test group.

train_set: this file is obtained from putting together these three files (subj_train, X_train and Y_train). Therefore it has all the information and measurements for all subjects who were part of train group.

train_test: this file is simply obtained from (test_set and train_set). Therefore it has all the information and measurements for all 30 subjects.

features: it contains the label for each measurement that are columns of the "train_test" dataset. To label the columns of "train_test" dataset we need this file.

mean_col: it is a numeric vector containing the column numbers in "train_tets" dataset that contains mean values. 

meanFreq_col: it is a numeric vector containing the column numbers in "train_tets" dataset that contains meanFreq values.

std_col: it is a numeric vector containing the column numbers in "train_tets" dataset that contains std values.

mean_std_col: it is a numeric vector containing the column numbers in "train_tets" dataset that contains mean and std values, but not meanFreq.

data_mean_std: this is a subset of "train_test" dataset that only contains mean and std values (columns).

y: it is an Integer vector containing the activity code ("Test Labels" column of data_mean_std dataset). I just made it to make my job easier in for loop. 

fact: It contains subject numbers and their activities ("test labels"). It is the factor that I use to group the "data_mean_std" dataset by subject and activity.

data_mean_std_split: It is the dataset we obtain after grouping data_men_std by subject and activity.

data_mean_std_5: this is the dataset we obtain after finding the average of each measurement for each subject and each activity.

final_data: It is the transpose of data_mean_std_5. Because we want observations in rows and variables in colemns.
