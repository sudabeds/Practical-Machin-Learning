

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./Samsung.zip")
ProjData <- unzip("./Samsung.zip")
install.packages("stringr")
library(stringr)
subj_test=read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test=read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test=read.table("./UCI HAR Dataset/test/Y_test.txt")

subj_train=read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train=read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train=read.table("./UCI HAR Dataset/train/Y_train.txt")

test_set=cbind(subj_test, Y_test, X_test)
train_set=cbind(subj_train, Y_train, X_train)
train_test=rbind(test_set,train_set)
###2
features=read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)
colnames(train_test)=c("Subject", "Test Labels", features$V2 )
features$mean=str_match(features$V2, "mean")
features$meanFreq=str_match(features$V2, "meanFreq")
features$std=str_match(features$V2, "std")
mean_col=which(!is.na(features$mean))+2
meanFreq_col=which(!is.na(features$meanFreq))+2
mean_col=mean_col[!(mean_col %in% meanFreq_col)]
std_col=which(!is.na(features$std))+2
mean_std_col=c(mean_col,std_col)
#sort(mean_std_col)
mean_std_col=sort(mean_std_col)
data_mean_std=train_test[,c(1,2,mean_std_col)]


########labeling
y=data_mean_std$`Test Labels`

for(i in 1:nrow(train_test)){
  if(y[i]==1)
  {data_mean_std[i,2]="WALKING"}
  else if(y[i]==2){data_mean_std[i,2]="WALKING_UPSTAIRS"}
  else if(y[i]==3){data_mean_std[i,2]="WALKING_DOWNSTAIRS"}
  else  if(y[i]==4){data_mean_std[i,2]="SITTING"}
  else if(y[i]==5){data_mean_std[i,2]="STANDING"}
  else {data_mean_std[i,2]="LAYING"}
}

fact=data_mean_std[,2:1]
data_mean_std_split=split(data_mean_std,fact)
data_mean_std_5=sapply(data_mean_std_split,function(x){colMeans(x[,3:ncol(data_mean_std)])})
final_data=t(data_mean_std_5)

View(final_data)

