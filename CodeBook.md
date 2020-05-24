---
title: "Untitled"
output:
  html_document:
    df_print: paged
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
The *run_analysis.R* script performs the data preparationand then followed by different steps as described in course project's definition.

## 1.Download the dataset
     -Download the dataset from given url and the unzip the zip file in your working directory.

## 2.Assign each data to variabels
     -Read all the required text as table and give the appropriate names to the variabels.
     -*xtest <- test/X_test.txt*:Contains recorded features test data
     -*ytest <- test/Y_test.txt*:Contains test data of activity code labels
     -*subjecttrain <= train/subject_train.txt*: Contains train data of subjects being observed
     -*subjecttest <- test/subject_test.txt*: Contains test data of volunteer test subjects             being observed
     -*xtrain <-train/X_train.txt*: Contains recored features train data
     -*ytrain <- train/Y_train.txt*: Contains train data of activities codde labels

## 3.Merge the train an test dataset to create one dataset
     -Using **rbind()**merge xtest and xtrain and this X coloumn of Tidydata
     -Using **rbind()**merge ytest and ytrain and this Y coloumn of Tidydata
     -*Subjects* is created using **rbind** on *subjecttrain* and *subjecttest*
     -*mergeddata* is created by merging Subjects,Y,X using**cbind**
## 4.Extract mean and standard deviation for each measument
     -*Tidydata* is created using *mergeddata*,selecting coloumns *subject,code* and measurements       on *mean and std*.
## 5.Changing variabels names to desriptive name
     -change names to descriptive variable names
## 6.Findaldata
     -*Finaldata* is created by summarising *Tidydata* and taking mean of each variable after         being grouped by subject and activity.
     -Export*Finaldata* to *FinalData.txt* file
     
     

```{r cars}
summary(Tidydata)
summary(Finaldata)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
