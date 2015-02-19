## CodeBook

This codebook describes the variables, the data and any transformations or work perfomed to clean up the data.

### Variables

* `testDataX`, `testDataY`, `testSubject`, `trainDataX`, `trainDataY`, `trainSubject` are temponary variables to load the data 
* `Xdata`, `Ydata` and `Subject` are temponary variables to merge the train and test data
* `activity_labels` is used to load activity labels and is used to name the activities in the dataset
* `features` is used to load the features and has the collumn names for `Xdata`
* `data` is the dataset containing all the data 
* `dataSub` a subset of the `data` which contains only only the measurements on the mean and standard deviation for each measurement
* `newDataset` is a dataset created from `dataSub` with the average of each variable for each activity and each subject.

### Data

*  The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Transformations

* The `run_analysis.R` has comments inside the code. The most commands used are straightforward: 
... * `read.table()` to load the data
... * `rbind()` will merging data to add rows
... * `colnames()` to five collumn names
... * `cbind()` to add collumn
... * `grepl()` to retrive rows matching the a certain pattern
... * At `dataSubset %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))`, we use the dply packages capabilities to group and summarise data. A usefull cheatsheet for dplyr: http://www.rstudio.com/resources/cheatsheets/
... * `write.table` to create a txt file

