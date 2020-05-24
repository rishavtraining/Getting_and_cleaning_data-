##Set the working directory
##Download and unzip the zip file

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,"./data/dataset.zip")
unzip("./data/dataset.zip")
path=file.path("./data","UCI HAR Dataset")

##reading different text files as table

activities=read.table(file.path(path,"activity_labels.txt"),col.names=c("code","activity"))

features=read.table(file.path(path,"features.txt"),col.names=c("number","functions"))

subjecttest=read.table(file.path(path,"test","subject_test.txt"),col.names=c("subject"))

subjecttrain=read.table(file.path(path,"train","subject_train.txt"),col.names=c("subject"))

xtest=read.table(file.path(path,"test","X_test.txt"),col.names=features$functions)

ytest=read.table(file.path(path,"test","Y_test.txt"),col.names="code")

xtrain=read.table(file.path(path,"train","X_train.txt"),col.names=features$functions)

ytrain=read.table(file.path(path,"train","Y_train.txt"),col.names="code")

X<-rbind(xtrain,xtest)

Y<-rbind(ytrain,ytest)

Subject<-rbind(subjecttrain,subjecttest)

mergeddata<-cbind(Subject,Y,X)

Tidydata<-mergeddata%>%select(subject,code,contains("mean"),contains("std"))

Tidydata$coded<-activities[Tidydata$code,2]

##Appropriate labels for Tidydata


names(Tidydata)[2]="activity"

names(Tidydata)<-gsub("Acc","accelometer",names(Tidydata))

names(Tidydata)<-gsub("Gyro","Gyroscope",names(Tidydata))

names(Tidydata)<-gsub("BodyBody","Body",names(Tidydata))

names(Tidydata)<-gsub("Mag","magnitude",names(Tidydata))

names(Tidydata)<-gsub("^t","Time",names(Tidydata))

names(Tidydata)<-gsub("^f","Frequency",names(Tidydata))

names(Tidydata)<-gsub("tBody","Timebody",names(Tidydata))

names(Tidydata)<-gsub("-mean()","mean",names(Tidydata))

names(Tidydata)<-gsub("-std()","std",names(Tidydata))

names(Tidydata)<-gsub("-freq()","Frequency()",names(Tidydata))

##Creating new dataset with avreage of each activity and subject

Finaldata<-Tidydata%>%
  group_by(subject,activity)%>%
  summarise_all(funs(mean))
write.table(Finaldata,"FinalData.txt",row.name=FALSE)
