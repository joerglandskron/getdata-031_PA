README
======

This repo is about the peer review Programming Assignment from the Data
Science Specialization Track Course **Getting and Cleaning Data**
(getdata-031).

Purpose
-------

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis. You will be graded by your peers on a
series of yes/no questions related to the project. You will be required
to submit: 1) a tidy data set as described below, 2) a link to a Github
repository with your script for performing the analysis, and 3) a code
book that describes the variables, the data, and any transformations or
work that you performed to clean up the data called CodeBook.md. You
should also include a README.md in the repo with your scripts. This repo
explains how all of the scripts work and how they are connected.

Tasks
-----

You should create one R script called run\_analysis.R that does the
following.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

Files stored in this repo
-------------------------

-   **README.md**
    -   this file
-   **CodeBook.md**
    -   Codebook which explaines the tidying process and the
        transformation steps performed by run\_analysis.R
-   **makeCodebook.Rmd**
    -   .Rmd-file from which the Codebook.md was created via RStudio
-   **featuresdoc.csv**
    -   File which documents the variable names and the transformations
        done during the tidying process
    -   Used by makeCodebook.Rmd to generate the final codebook-file
        CodeBook.md
-   **run\_analysis.R**
    -   R-Script for performing the tidying process (task 1-4) and the
        production of the result dataset (task 5)
-   **resultDat.csv**
    -   Result dataset created as described in task 5)
    -   Could be read in R with **read.csv("resultDat.csv")**

Usage of run\_analysis.R
------------------------

### Prerequisits

-   Libraries

For running run\_analysis.R the library "dplyr" should be installed

-   Data

The **UCI HAR Dataset** should be present in the Working Directory. That
means in the current R-Working Directory should be a folder named "UCI
HAR Dataset" (./UCI HAR Dataset). This could be archieved by simply
extracting the UCI HAR Dataset in the Working Directory. The internal
structure of the dataset should be untouched.

The **UCI HAR Dataset** can be obtained by clicking on the following
link:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### Running run\_analysis.R

run\_analysis.R could be run e.g. directly from RStudio and performs all
tasks 1-5 as long as the prerequisits mentioned above are fulfilled.

### Output of run\_analysis.R

run\_analysis.R creates two output-files in the Working Directory:

-   featuresdoc.csv
-   resultDat.csv

**featuresdoc.csv** is a documentation of the tidying process (Selection
of variables, Change of variable names and transormation processes like
the calculation of the mean of all selected columns). This file was only
needed to create the CodeBook.md-file with help of the
makeCodebook.Rmd-file.

**resultDat.csv** is the tidy datset requested in task 5). It can be
read in in R simply by using read.csv("resultDat.csv").
