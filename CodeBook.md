Codebook
========

Subject
-------

This Codebook describes following process:

1.  Tidying the **Human Activity Recognition Using Smartphones Data
    Set**
    -   Merging the trainings- and test-dataset
    -   adding the acivities and descriptive activity-names
    -   adding the subject-no

2.  Extracting all variables for mean and standard deviation on the
    measurements in the dataset
3.  Creating desciptive variable names for the taken variables
4.  Create a new dataset, in which a mean on all variables has been
    calculated for each activity and subject

The Origin Dataset
------------------

The origin dataset on which this tidying-process is based on can be
downloaded here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A detailed description of the study design is available at the website
of the UCI Machine Learning Repository:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The Dataset.zip file consists of the following single files:

1.  **README.txt**
    -   Describes also the study design and the different files of the
        dataset

2.  **features\_info.txt**
    -   Shows information about the variables used on the feature
        vector.

3.  **features.txt**
    -   List of all features (561 features and column-reference to the
        test- and training set)

4.  **activity\_labels.txt**
    -   Links the activity labels (1-6) with their activity name
        (1-WALKING, 2-WALKING\_UPSTAIRS, 3-WALKING\_DOWNSTAIRS,
        4-SITTING, 5-STANDING, 6-LAYING)

5.  **train/X\_train.txt**
    -   Training set (7352 observations, 561 variables)

6.  **train/y\_train.txt**
    -   Activity labels for the training set (7532 observations, range
        of labels 1-6)

7.  **test/X\_test.txt**
    -   Test set (2947 observations, 561 variables)

8.  **test/y\_test.txt**
    -   Activity labels for the test set (2947 observations, range of
        labels 1-6)

9.  **train/subject\_train.txt**
    -   Each row identifies the subject who performed the activity for
        each window sample (range of subject identifiers 1-30) for the
        training dataset

10. **test/subject\_test.txt**
    -   Each row identifies the subject who performed the activity for
        each window sample (range of subject identifiers 1-30) for the
        test dataset

11. **train/Inertial Signals/total\_acc\_x\_train.txt**
    -   The acceleration signal from the smartphone accelerometer X axis
        in standard gravity units 'g'. Every row shows a 128 element
        vector. The same description applies for the
        'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files
        for the Y and Z axis.

12. **train/Inertial Signals/body\_acc\_x\_train.txt**
    -   The body acceleration signal obtained by subtracting the gravity
        from the total acceleration.

13. **train/Inertial Signals/body\_gyro\_x\_train.txt**
    -   The angular velocity vector measured by the gyroscope for each
        window sample. The units are radians/second.

Data transformation
-------------------

All of the following tranformation steps are performed by a script
called **run\_analysis.R**. The script is stored in the same repo like
this codebook. More information, how to run this script you can find in
the **README.md** file also stored in this repo.

### 1) Needed files

The first step for preparing the data transformation is to identify the
files needed from the origin dataset. As the task was to extract only
variables containing the **mean** or **standard deviation** all files in
the "Inertial"-Folder (files 11, 12 and 13) are not needed, because they
do not contain any of this variables. Contrario all other files
containing data (files 3-10) are taken into consideration.

### 2) Selecting needed variables

In the second step the needed variables are identified from the
features.txt-file which contains 561 variable names with
reference-numbers in a 2nd column ("1", "2", ..., "561") which are
corresponding with the columns of the test- and training datasets
(X\_test.txt and X\_train.txt).

Corresponding to the features\_info.txt-file all variables containing a
computed mean or standard deviation are marked with **mean()** for mean
or **std()** for standard deviation. There are also some other variables
with "Mean" or "Std" contained in the name, but these were not
necessarily pure means or standard deviations, but e.g. a weighted mean.
Therefore they were not inculuded in the further processing.

The variables including "mean()" or "std()" in their name can be easily
identified in the features.txt with the statement
`grepl("mean\\(\\)|std\\(\\)"`.

For documentation the features.txt-file and all further steps of
selecting and changing variable names are stored in a separate dataframe
called **features.doc**. The content of this file you can see in the
table at the end of this codebook. In this table all the origin variable
names and the variables are taken for further processing are listed.
Additionally it is mentioned, which operations are performed on them and
how they are named in the result data set called **resultDat.txt**.

### 3) Create descriptive variable names

For creating descriptive variable names I decided to break down the
variable names by separate name components. Each component starts with
an uppercase character. This kind of composed variable names are also
accepted by the
[R-Google-Styleguide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
and are not to far from the origin names.

Each part of the name-components could still be an abbreviation to
prevent the variable names to become to long and confusing. Therefore
please find a short explanation of all of the components and used
abbreviations below:

<table>
<thead>
<tr class="header">
<th align="left">Abbreviation</th>
<th align="left">Complete Name</th>
<th align="left">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Mean</td>
<td align="left">Mean</td>
<td align="left">Mean of origin variable per Subject, Activity</td>
</tr>
<tr class="even">
<td align="left">Time</td>
<td align="left">Time</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Freq</td>
<td align="left">Frequency</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Body</td>
<td align="left">Body</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Gravity</td>
<td align="left">Gravity</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Acc</td>
<td align="left">Acceleration</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Gyro</td>
<td align="left">Gyroscope</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Jerk</td>
<td align="left">Jerk</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Mag</td>
<td align="left">Magnitude</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Mean</td>
<td align="left">Mean</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Std</td>
<td align="left">Standard deviation</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">X, Y, Z</td>
<td align="left">X, Y, Z</td>
<td align="left">3-axial signals</td>
</tr>
</tbody>
</table>

For a detailed description of all the components from the origin
variable name please refer to the features\_info.txt-file.

The change of the variable names were performed by grep-commands. The
results were stored in the features.doc-dataframe.

### 4) Drop not needed columns

After the needed variables are selected from features.txt and have been
renamed, all not needed columns can be removed from the test- and train
datasets. This was performed via the reference-column in the
features.txt ("1", "2",...). The assumption is, that every number stored
in the "V1"-column in the features.txt are directly refer to a column
("V1", "V2",..., "V562") of the test- and training dataset. Doing so,
this would also work, if the columns in the test- and training datasets
or the rows in the features.txt are not sorted as long as the reference
is properly assigned (but in this particular dataset both are already
sorted). In the same step the descriptive variable names are assigned to
the remaining columns in the test- and training datasets.

### 5) Add activity labels

In this step the activity labels provided in the file
**test/y\_test.txt** were added to the test dataset and from the
**train/y\_train.txt** to training dataset. The assumption was, that
both files are ordered correspondingly already. Anyway there was no
other way to combine the files in a senseful manner.

### 6) Add subject labels

As like adding the activity labels, the subject labels are added in the
same manner with the same assumptions. The subject labels provided in
the file **test/subject\_test.txt** were added to the test dataset and
from the **train/subject\_train.txt** to training dataset.

### 7) Merge activity names

In this step the descriptive activity names described in the
**activity\_labels.txt**-file are merged to the test- and training
dataset referring to the already added numeric activiy labels. After
that the numeric activity-labels are removed for preventing redundancy.

### 8) Combining test- and training datasets

As the test- and training datasets are having the same column count and
columnnames they can be combined using the rbind-function in R.

### 9) Create result dataset

Here the result dataset is generated by grouping the already combined
test- and training dataset by subject-no and activity-name and
calculating a mean on each column by this grouping.

### 10) Write result dataset to disc

In the last step the resutl dataset is saved to disc in the file
**resultDat.txt** which can be found also in this repo.

### List of all variables

Below you can find a list of all origin variables in the original order
in the **features.txt**-file.

The table consists of 5 columns:

1.  **Ref**
    -   Column-number of variable derived from the first column of the
        features.txt-file

2.  **OrigFeatureName**
    -   Origin variable name taken form the second column of the
        features.txt-file

3.  **Used**
    -   logical values, which are defining, wether the variable is used
        in the further processing or not (TRUE=used, FALSE=removed)

4.  **Operation**
    -   Information, which calculation was performend on the variable

5.  **FinalFeatureName**
    -   Shows the final descriptive variable name from the result
        dataset stored in the file **resultDat.txt**

The list can be found also in this repo stored in file
**featuresdoc.csv**.

<table>
<thead>
<tr class="header">
<th align="left">Ref</th>
<th align="left">OrigFeatureName</th>
<th align="left">Used</th>
<th align="left">Operation</th>
<th align="left">FinalFeatureName</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">V1</td>
<td align="left">tBodyAcc-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccMeanX</td>
</tr>
<tr class="even">
<td align="left">V2</td>
<td align="left">tBodyAcc-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccMeanY</td>
</tr>
<tr class="odd">
<td align="left">V3</td>
<td align="left">tBodyAcc-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccMeanZ</td>
</tr>
<tr class="even">
<td align="left">V4</td>
<td align="left">tBodyAcc-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccStdX</td>
</tr>
<tr class="odd">
<td align="left">V5</td>
<td align="left">tBodyAcc-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccStdY</td>
</tr>
<tr class="even">
<td align="left">V6</td>
<td align="left">tBodyAcc-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccStdZ</td>
</tr>
<tr class="odd">
<td align="left">V7</td>
<td align="left">tBodyAcc-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V8</td>
<td align="left">tBodyAcc-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V9</td>
<td align="left">tBodyAcc-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V10</td>
<td align="left">tBodyAcc-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V11</td>
<td align="left">tBodyAcc-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V12</td>
<td align="left">tBodyAcc-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V13</td>
<td align="left">tBodyAcc-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V14</td>
<td align="left">tBodyAcc-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V15</td>
<td align="left">tBodyAcc-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V16</td>
<td align="left">tBodyAcc-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V17</td>
<td align="left">tBodyAcc-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V18</td>
<td align="left">tBodyAcc-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V19</td>
<td align="left">tBodyAcc-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V20</td>
<td align="left">tBodyAcc-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V21</td>
<td align="left">tBodyAcc-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V22</td>
<td align="left">tBodyAcc-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V23</td>
<td align="left">tBodyAcc-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V24</td>
<td align="left">tBodyAcc-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V25</td>
<td align="left">tBodyAcc-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V26</td>
<td align="left">tBodyAcc-arCoeff()-X,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V27</td>
<td align="left">tBodyAcc-arCoeff()-X,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V28</td>
<td align="left">tBodyAcc-arCoeff()-X,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V29</td>
<td align="left">tBodyAcc-arCoeff()-X,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V30</td>
<td align="left">tBodyAcc-arCoeff()-Y,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V31</td>
<td align="left">tBodyAcc-arCoeff()-Y,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V32</td>
<td align="left">tBodyAcc-arCoeff()-Y,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V33</td>
<td align="left">tBodyAcc-arCoeff()-Y,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V34</td>
<td align="left">tBodyAcc-arCoeff()-Z,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V35</td>
<td align="left">tBodyAcc-arCoeff()-Z,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V36</td>
<td align="left">tBodyAcc-arCoeff()-Z,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V37</td>
<td align="left">tBodyAcc-arCoeff()-Z,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V38</td>
<td align="left">tBodyAcc-correlation()-X,Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V39</td>
<td align="left">tBodyAcc-correlation()-X,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V40</td>
<td align="left">tBodyAcc-correlation()-Y,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V41</td>
<td align="left">tGravityAcc-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccMeanX</td>
</tr>
<tr class="even">
<td align="left">V42</td>
<td align="left">tGravityAcc-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccMeanY</td>
</tr>
<tr class="odd">
<td align="left">V43</td>
<td align="left">tGravityAcc-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccMeanZ</td>
</tr>
<tr class="even">
<td align="left">V44</td>
<td align="left">tGravityAcc-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccStdX</td>
</tr>
<tr class="odd">
<td align="left">V45</td>
<td align="left">tGravityAcc-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccStdY</td>
</tr>
<tr class="even">
<td align="left">V46</td>
<td align="left">tGravityAcc-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccStdZ</td>
</tr>
<tr class="odd">
<td align="left">V47</td>
<td align="left">tGravityAcc-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V48</td>
<td align="left">tGravityAcc-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V49</td>
<td align="left">tGravityAcc-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V50</td>
<td align="left">tGravityAcc-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V51</td>
<td align="left">tGravityAcc-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V52</td>
<td align="left">tGravityAcc-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V53</td>
<td align="left">tGravityAcc-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V54</td>
<td align="left">tGravityAcc-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V55</td>
<td align="left">tGravityAcc-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V56</td>
<td align="left">tGravityAcc-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V57</td>
<td align="left">tGravityAcc-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V58</td>
<td align="left">tGravityAcc-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V59</td>
<td align="left">tGravityAcc-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V60</td>
<td align="left">tGravityAcc-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V61</td>
<td align="left">tGravityAcc-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V62</td>
<td align="left">tGravityAcc-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V63</td>
<td align="left">tGravityAcc-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V64</td>
<td align="left">tGravityAcc-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V65</td>
<td align="left">tGravityAcc-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V66</td>
<td align="left">tGravityAcc-arCoeff()-X,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V67</td>
<td align="left">tGravityAcc-arCoeff()-X,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V68</td>
<td align="left">tGravityAcc-arCoeff()-X,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V69</td>
<td align="left">tGravityAcc-arCoeff()-X,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V70</td>
<td align="left">tGravityAcc-arCoeff()-Y,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V71</td>
<td align="left">tGravityAcc-arCoeff()-Y,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V72</td>
<td align="left">tGravityAcc-arCoeff()-Y,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V73</td>
<td align="left">tGravityAcc-arCoeff()-Y,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V74</td>
<td align="left">tGravityAcc-arCoeff()-Z,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V75</td>
<td align="left">tGravityAcc-arCoeff()-Z,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V76</td>
<td align="left">tGravityAcc-arCoeff()-Z,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V77</td>
<td align="left">tGravityAcc-arCoeff()-Z,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V78</td>
<td align="left">tGravityAcc-correlation()-X,Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V79</td>
<td align="left">tGravityAcc-correlation()-X,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V80</td>
<td align="left">tGravityAcc-correlation()-Y,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V81</td>
<td align="left">tBodyAccJerk-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkMeanX</td>
</tr>
<tr class="even">
<td align="left">V82</td>
<td align="left">tBodyAccJerk-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkMeanY</td>
</tr>
<tr class="odd">
<td align="left">V83</td>
<td align="left">tBodyAccJerk-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkMeanZ</td>
</tr>
<tr class="even">
<td align="left">V84</td>
<td align="left">tBodyAccJerk-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkStdX</td>
</tr>
<tr class="odd">
<td align="left">V85</td>
<td align="left">tBodyAccJerk-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkStdY</td>
</tr>
<tr class="even">
<td align="left">V86</td>
<td align="left">tBodyAccJerk-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkStdZ</td>
</tr>
<tr class="odd">
<td align="left">V87</td>
<td align="left">tBodyAccJerk-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V88</td>
<td align="left">tBodyAccJerk-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V89</td>
<td align="left">tBodyAccJerk-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V90</td>
<td align="left">tBodyAccJerk-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V91</td>
<td align="left">tBodyAccJerk-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V92</td>
<td align="left">tBodyAccJerk-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V93</td>
<td align="left">tBodyAccJerk-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V94</td>
<td align="left">tBodyAccJerk-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V95</td>
<td align="left">tBodyAccJerk-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V96</td>
<td align="left">tBodyAccJerk-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V97</td>
<td align="left">tBodyAccJerk-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V98</td>
<td align="left">tBodyAccJerk-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V99</td>
<td align="left">tBodyAccJerk-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V100</td>
<td align="left">tBodyAccJerk-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V101</td>
<td align="left">tBodyAccJerk-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V102</td>
<td align="left">tBodyAccJerk-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V103</td>
<td align="left">tBodyAccJerk-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V104</td>
<td align="left">tBodyAccJerk-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V105</td>
<td align="left">tBodyAccJerk-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V106</td>
<td align="left">tBodyAccJerk-arCoeff()-X,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V107</td>
<td align="left">tBodyAccJerk-arCoeff()-X,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V108</td>
<td align="left">tBodyAccJerk-arCoeff()-X,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V109</td>
<td align="left">tBodyAccJerk-arCoeff()-X,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V110</td>
<td align="left">tBodyAccJerk-arCoeff()-Y,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V111</td>
<td align="left">tBodyAccJerk-arCoeff()-Y,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V112</td>
<td align="left">tBodyAccJerk-arCoeff()-Y,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V113</td>
<td align="left">tBodyAccJerk-arCoeff()-Y,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V114</td>
<td align="left">tBodyAccJerk-arCoeff()-Z,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V115</td>
<td align="left">tBodyAccJerk-arCoeff()-Z,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V116</td>
<td align="left">tBodyAccJerk-arCoeff()-Z,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V117</td>
<td align="left">tBodyAccJerk-arCoeff()-Z,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V118</td>
<td align="left">tBodyAccJerk-correlation()-X,Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V119</td>
<td align="left">tBodyAccJerk-correlation()-X,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V120</td>
<td align="left">tBodyAccJerk-correlation()-Y,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V121</td>
<td align="left">tBodyGyro-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroMeanX</td>
</tr>
<tr class="even">
<td align="left">V122</td>
<td align="left">tBodyGyro-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroMeanY</td>
</tr>
<tr class="odd">
<td align="left">V123</td>
<td align="left">tBodyGyro-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroMeanZ</td>
</tr>
<tr class="even">
<td align="left">V124</td>
<td align="left">tBodyGyro-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroStdX</td>
</tr>
<tr class="odd">
<td align="left">V125</td>
<td align="left">tBodyGyro-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroStdY</td>
</tr>
<tr class="even">
<td align="left">V126</td>
<td align="left">tBodyGyro-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroStdZ</td>
</tr>
<tr class="odd">
<td align="left">V127</td>
<td align="left">tBodyGyro-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V128</td>
<td align="left">tBodyGyro-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V129</td>
<td align="left">tBodyGyro-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V130</td>
<td align="left">tBodyGyro-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V131</td>
<td align="left">tBodyGyro-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V132</td>
<td align="left">tBodyGyro-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V133</td>
<td align="left">tBodyGyro-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V134</td>
<td align="left">tBodyGyro-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V135</td>
<td align="left">tBodyGyro-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V136</td>
<td align="left">tBodyGyro-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V137</td>
<td align="left">tBodyGyro-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V138</td>
<td align="left">tBodyGyro-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V139</td>
<td align="left">tBodyGyro-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V140</td>
<td align="left">tBodyGyro-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V141</td>
<td align="left">tBodyGyro-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V142</td>
<td align="left">tBodyGyro-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V143</td>
<td align="left">tBodyGyro-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V144</td>
<td align="left">tBodyGyro-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V145</td>
<td align="left">tBodyGyro-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V146</td>
<td align="left">tBodyGyro-arCoeff()-X,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V147</td>
<td align="left">tBodyGyro-arCoeff()-X,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V148</td>
<td align="left">tBodyGyro-arCoeff()-X,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V149</td>
<td align="left">tBodyGyro-arCoeff()-X,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V150</td>
<td align="left">tBodyGyro-arCoeff()-Y,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V151</td>
<td align="left">tBodyGyro-arCoeff()-Y,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V152</td>
<td align="left">tBodyGyro-arCoeff()-Y,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V153</td>
<td align="left">tBodyGyro-arCoeff()-Y,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V154</td>
<td align="left">tBodyGyro-arCoeff()-Z,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V155</td>
<td align="left">tBodyGyro-arCoeff()-Z,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V156</td>
<td align="left">tBodyGyro-arCoeff()-Z,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V157</td>
<td align="left">tBodyGyro-arCoeff()-Z,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V158</td>
<td align="left">tBodyGyro-correlation()-X,Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V159</td>
<td align="left">tBodyGyro-correlation()-X,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V160</td>
<td align="left">tBodyGyro-correlation()-Y,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V161</td>
<td align="left">tBodyGyroJerk-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkMeanX</td>
</tr>
<tr class="even">
<td align="left">V162</td>
<td align="left">tBodyGyroJerk-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkMeanY</td>
</tr>
<tr class="odd">
<td align="left">V163</td>
<td align="left">tBodyGyroJerk-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkMeanZ</td>
</tr>
<tr class="even">
<td align="left">V164</td>
<td align="left">tBodyGyroJerk-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkStdX</td>
</tr>
<tr class="odd">
<td align="left">V165</td>
<td align="left">tBodyGyroJerk-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkStdY</td>
</tr>
<tr class="even">
<td align="left">V166</td>
<td align="left">tBodyGyroJerk-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkStdZ</td>
</tr>
<tr class="odd">
<td align="left">V167</td>
<td align="left">tBodyGyroJerk-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V168</td>
<td align="left">tBodyGyroJerk-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V169</td>
<td align="left">tBodyGyroJerk-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V170</td>
<td align="left">tBodyGyroJerk-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V171</td>
<td align="left">tBodyGyroJerk-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V172</td>
<td align="left">tBodyGyroJerk-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V173</td>
<td align="left">tBodyGyroJerk-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V174</td>
<td align="left">tBodyGyroJerk-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V175</td>
<td align="left">tBodyGyroJerk-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V176</td>
<td align="left">tBodyGyroJerk-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V177</td>
<td align="left">tBodyGyroJerk-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V178</td>
<td align="left">tBodyGyroJerk-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V179</td>
<td align="left">tBodyGyroJerk-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V180</td>
<td align="left">tBodyGyroJerk-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V181</td>
<td align="left">tBodyGyroJerk-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V182</td>
<td align="left">tBodyGyroJerk-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V183</td>
<td align="left">tBodyGyroJerk-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V184</td>
<td align="left">tBodyGyroJerk-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V185</td>
<td align="left">tBodyGyroJerk-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V186</td>
<td align="left">tBodyGyroJerk-arCoeff()-X,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V187</td>
<td align="left">tBodyGyroJerk-arCoeff()-X,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V188</td>
<td align="left">tBodyGyroJerk-arCoeff()-X,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V189</td>
<td align="left">tBodyGyroJerk-arCoeff()-X,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V190</td>
<td align="left">tBodyGyroJerk-arCoeff()-Y,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V191</td>
<td align="left">tBodyGyroJerk-arCoeff()-Y,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V192</td>
<td align="left">tBodyGyroJerk-arCoeff()-Y,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V193</td>
<td align="left">tBodyGyroJerk-arCoeff()-Y,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V194</td>
<td align="left">tBodyGyroJerk-arCoeff()-Z,1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V195</td>
<td align="left">tBodyGyroJerk-arCoeff()-Z,2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V196</td>
<td align="left">tBodyGyroJerk-arCoeff()-Z,3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V197</td>
<td align="left">tBodyGyroJerk-arCoeff()-Z,4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V198</td>
<td align="left">tBodyGyroJerk-correlation()-X,Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V199</td>
<td align="left">tBodyGyroJerk-correlation()-X,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V200</td>
<td align="left">tBodyGyroJerk-correlation()-Y,Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V201</td>
<td align="left">tBodyAccMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccMagMean</td>
</tr>
<tr class="even">
<td align="left">V202</td>
<td align="left">tBodyAccMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccMagStd</td>
</tr>
<tr class="odd">
<td align="left">V203</td>
<td align="left">tBodyAccMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V204</td>
<td align="left">tBodyAccMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V205</td>
<td align="left">tBodyAccMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V206</td>
<td align="left">tBodyAccMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V207</td>
<td align="left">tBodyAccMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V208</td>
<td align="left">tBodyAccMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V209</td>
<td align="left">tBodyAccMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V210</td>
<td align="left">tBodyAccMag-arCoeff()1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V211</td>
<td align="left">tBodyAccMag-arCoeff()2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V212</td>
<td align="left">tBodyAccMag-arCoeff()3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V213</td>
<td align="left">tBodyAccMag-arCoeff()4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V214</td>
<td align="left">tGravityAccMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccMagMean</td>
</tr>
<tr class="odd">
<td align="left">V215</td>
<td align="left">tGravityAccMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeGravityAccMagStd</td>
</tr>
<tr class="even">
<td align="left">V216</td>
<td align="left">tGravityAccMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V217</td>
<td align="left">tGravityAccMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V218</td>
<td align="left">tGravityAccMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V219</td>
<td align="left">tGravityAccMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V220</td>
<td align="left">tGravityAccMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V221</td>
<td align="left">tGravityAccMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V222</td>
<td align="left">tGravityAccMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V223</td>
<td align="left">tGravityAccMag-arCoeff()1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V224</td>
<td align="left">tGravityAccMag-arCoeff()2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V225</td>
<td align="left">tGravityAccMag-arCoeff()3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V226</td>
<td align="left">tGravityAccMag-arCoeff()4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V227</td>
<td align="left">tBodyAccJerkMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkMagMean</td>
</tr>
<tr class="even">
<td align="left">V228</td>
<td align="left">tBodyAccJerkMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyAccJerkMagStd</td>
</tr>
<tr class="odd">
<td align="left">V229</td>
<td align="left">tBodyAccJerkMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V230</td>
<td align="left">tBodyAccJerkMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V231</td>
<td align="left">tBodyAccJerkMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V232</td>
<td align="left">tBodyAccJerkMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V233</td>
<td align="left">tBodyAccJerkMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V234</td>
<td align="left">tBodyAccJerkMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V235</td>
<td align="left">tBodyAccJerkMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V236</td>
<td align="left">tBodyAccJerkMag-arCoeff()1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V237</td>
<td align="left">tBodyAccJerkMag-arCoeff()2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V238</td>
<td align="left">tBodyAccJerkMag-arCoeff()3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V239</td>
<td align="left">tBodyAccJerkMag-arCoeff()4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V240</td>
<td align="left">tBodyGyroMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroMagMean</td>
</tr>
<tr class="odd">
<td align="left">V241</td>
<td align="left">tBodyGyroMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroMagStd</td>
</tr>
<tr class="even">
<td align="left">V242</td>
<td align="left">tBodyGyroMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V243</td>
<td align="left">tBodyGyroMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V244</td>
<td align="left">tBodyGyroMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V245</td>
<td align="left">tBodyGyroMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V246</td>
<td align="left">tBodyGyroMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V247</td>
<td align="left">tBodyGyroMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V248</td>
<td align="left">tBodyGyroMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V249</td>
<td align="left">tBodyGyroMag-arCoeff()1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V250</td>
<td align="left">tBodyGyroMag-arCoeff()2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V251</td>
<td align="left">tBodyGyroMag-arCoeff()3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V252</td>
<td align="left">tBodyGyroMag-arCoeff()4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V253</td>
<td align="left">tBodyGyroJerkMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkMagMean</td>
</tr>
<tr class="even">
<td align="left">V254</td>
<td align="left">tBodyGyroJerkMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanTimeBodyGyroJerkMagStd</td>
</tr>
<tr class="odd">
<td align="left">V255</td>
<td align="left">tBodyGyroJerkMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V256</td>
<td align="left">tBodyGyroJerkMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V257</td>
<td align="left">tBodyGyroJerkMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V258</td>
<td align="left">tBodyGyroJerkMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V259</td>
<td align="left">tBodyGyroJerkMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V260</td>
<td align="left">tBodyGyroJerkMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V261</td>
<td align="left">tBodyGyroJerkMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V262</td>
<td align="left">tBodyGyroJerkMag-arCoeff()1</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V263</td>
<td align="left">tBodyGyroJerkMag-arCoeff()2</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V264</td>
<td align="left">tBodyGyroJerkMag-arCoeff()3</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V265</td>
<td align="left">tBodyGyroJerkMag-arCoeff()4</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V266</td>
<td align="left">fBodyAcc-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccMeanX</td>
</tr>
<tr class="odd">
<td align="left">V267</td>
<td align="left">fBodyAcc-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccMeanY</td>
</tr>
<tr class="even">
<td align="left">V268</td>
<td align="left">fBodyAcc-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccMeanZ</td>
</tr>
<tr class="odd">
<td align="left">V269</td>
<td align="left">fBodyAcc-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccStdX</td>
</tr>
<tr class="even">
<td align="left">V270</td>
<td align="left">fBodyAcc-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccStdY</td>
</tr>
<tr class="odd">
<td align="left">V271</td>
<td align="left">fBodyAcc-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccStdZ</td>
</tr>
<tr class="even">
<td align="left">V272</td>
<td align="left">fBodyAcc-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V273</td>
<td align="left">fBodyAcc-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V274</td>
<td align="left">fBodyAcc-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V275</td>
<td align="left">fBodyAcc-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V276</td>
<td align="left">fBodyAcc-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V277</td>
<td align="left">fBodyAcc-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V278</td>
<td align="left">fBodyAcc-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V279</td>
<td align="left">fBodyAcc-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V280</td>
<td align="left">fBodyAcc-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V281</td>
<td align="left">fBodyAcc-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V282</td>
<td align="left">fBodyAcc-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V283</td>
<td align="left">fBodyAcc-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V284</td>
<td align="left">fBodyAcc-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V285</td>
<td align="left">fBodyAcc-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V286</td>
<td align="left">fBodyAcc-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V287</td>
<td align="left">fBodyAcc-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V288</td>
<td align="left">fBodyAcc-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V289</td>
<td align="left">fBodyAcc-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V290</td>
<td align="left">fBodyAcc-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V291</td>
<td align="left">fBodyAcc-maxInds-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V292</td>
<td align="left">fBodyAcc-maxInds-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V293</td>
<td align="left">fBodyAcc-maxInds-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V294</td>
<td align="left">fBodyAcc-meanFreq()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V295</td>
<td align="left">fBodyAcc-meanFreq()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V296</td>
<td align="left">fBodyAcc-meanFreq()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V297</td>
<td align="left">fBodyAcc-skewness()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V298</td>
<td align="left">fBodyAcc-kurtosis()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V299</td>
<td align="left">fBodyAcc-skewness()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V300</td>
<td align="left">fBodyAcc-kurtosis()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V301</td>
<td align="left">fBodyAcc-skewness()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V302</td>
<td align="left">fBodyAcc-kurtosis()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V303</td>
<td align="left">fBodyAcc-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V304</td>
<td align="left">fBodyAcc-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V305</td>
<td align="left">fBodyAcc-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V306</td>
<td align="left">fBodyAcc-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V307</td>
<td align="left">fBodyAcc-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V308</td>
<td align="left">fBodyAcc-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V309</td>
<td align="left">fBodyAcc-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V310</td>
<td align="left">fBodyAcc-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V311</td>
<td align="left">fBodyAcc-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V312</td>
<td align="left">fBodyAcc-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V313</td>
<td align="left">fBodyAcc-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V314</td>
<td align="left">fBodyAcc-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V315</td>
<td align="left">fBodyAcc-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V316</td>
<td align="left">fBodyAcc-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V317</td>
<td align="left">fBodyAcc-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V318</td>
<td align="left">fBodyAcc-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V319</td>
<td align="left">fBodyAcc-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V320</td>
<td align="left">fBodyAcc-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V321</td>
<td align="left">fBodyAcc-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V322</td>
<td align="left">fBodyAcc-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V323</td>
<td align="left">fBodyAcc-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V324</td>
<td align="left">fBodyAcc-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V325</td>
<td align="left">fBodyAcc-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V326</td>
<td align="left">fBodyAcc-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V327</td>
<td align="left">fBodyAcc-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V328</td>
<td align="left">fBodyAcc-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V329</td>
<td align="left">fBodyAcc-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V330</td>
<td align="left">fBodyAcc-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V331</td>
<td align="left">fBodyAcc-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V332</td>
<td align="left">fBodyAcc-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V333</td>
<td align="left">fBodyAcc-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V334</td>
<td align="left">fBodyAcc-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V335</td>
<td align="left">fBodyAcc-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V336</td>
<td align="left">fBodyAcc-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V337</td>
<td align="left">fBodyAcc-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V338</td>
<td align="left">fBodyAcc-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V339</td>
<td align="left">fBodyAcc-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V340</td>
<td align="left">fBodyAcc-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V341</td>
<td align="left">fBodyAcc-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V342</td>
<td align="left">fBodyAcc-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V343</td>
<td align="left">fBodyAcc-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V344</td>
<td align="left">fBodyAcc-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V345</td>
<td align="left">fBodyAccJerk-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkMeanX</td>
</tr>
<tr class="even">
<td align="left">V346</td>
<td align="left">fBodyAccJerk-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkMeanY</td>
</tr>
<tr class="odd">
<td align="left">V347</td>
<td align="left">fBodyAccJerk-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkMeanZ</td>
</tr>
<tr class="even">
<td align="left">V348</td>
<td align="left">fBodyAccJerk-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkStdX</td>
</tr>
<tr class="odd">
<td align="left">V349</td>
<td align="left">fBodyAccJerk-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkStdY</td>
</tr>
<tr class="even">
<td align="left">V350</td>
<td align="left">fBodyAccJerk-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkStdZ</td>
</tr>
<tr class="odd">
<td align="left">V351</td>
<td align="left">fBodyAccJerk-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V352</td>
<td align="left">fBodyAccJerk-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V353</td>
<td align="left">fBodyAccJerk-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V354</td>
<td align="left">fBodyAccJerk-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V355</td>
<td align="left">fBodyAccJerk-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V356</td>
<td align="left">fBodyAccJerk-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V357</td>
<td align="left">fBodyAccJerk-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V358</td>
<td align="left">fBodyAccJerk-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V359</td>
<td align="left">fBodyAccJerk-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V360</td>
<td align="left">fBodyAccJerk-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V361</td>
<td align="left">fBodyAccJerk-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V362</td>
<td align="left">fBodyAccJerk-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V363</td>
<td align="left">fBodyAccJerk-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V364</td>
<td align="left">fBodyAccJerk-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V365</td>
<td align="left">fBodyAccJerk-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V366</td>
<td align="left">fBodyAccJerk-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V367</td>
<td align="left">fBodyAccJerk-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V368</td>
<td align="left">fBodyAccJerk-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V369</td>
<td align="left">fBodyAccJerk-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V370</td>
<td align="left">fBodyAccJerk-maxInds-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V371</td>
<td align="left">fBodyAccJerk-maxInds-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V372</td>
<td align="left">fBodyAccJerk-maxInds-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V373</td>
<td align="left">fBodyAccJerk-meanFreq()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V374</td>
<td align="left">fBodyAccJerk-meanFreq()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V375</td>
<td align="left">fBodyAccJerk-meanFreq()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V376</td>
<td align="left">fBodyAccJerk-skewness()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V377</td>
<td align="left">fBodyAccJerk-kurtosis()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V378</td>
<td align="left">fBodyAccJerk-skewness()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V379</td>
<td align="left">fBodyAccJerk-kurtosis()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V380</td>
<td align="left">fBodyAccJerk-skewness()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V381</td>
<td align="left">fBodyAccJerk-kurtosis()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V382</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V383</td>
<td align="left">fBodyAccJerk-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V384</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V385</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V386</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V387</td>
<td align="left">fBodyAccJerk-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V388</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V389</td>
<td align="left">fBodyAccJerk-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V390</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V391</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V392</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V393</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V394</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V395</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V396</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V397</td>
<td align="left">fBodyAccJerk-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V398</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V399</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V400</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V401</td>
<td align="left">fBodyAccJerk-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V402</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V403</td>
<td align="left">fBodyAccJerk-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V404</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V405</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V406</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V407</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V408</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V409</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V410</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V411</td>
<td align="left">fBodyAccJerk-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V412</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V413</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V414</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V415</td>
<td align="left">fBodyAccJerk-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V416</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V417</td>
<td align="left">fBodyAccJerk-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V418</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V419</td>
<td align="left">fBodyAccJerk-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V420</td>
<td align="left">fBodyAccJerk-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V421</td>
<td align="left">fBodyAccJerk-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V422</td>
<td align="left">fBodyAccJerk-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V423</td>
<td align="left">fBodyAccJerk-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V424</td>
<td align="left">fBodyGyro-mean()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroMeanX</td>
</tr>
<tr class="odd">
<td align="left">V425</td>
<td align="left">fBodyGyro-mean()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroMeanY</td>
</tr>
<tr class="even">
<td align="left">V426</td>
<td align="left">fBodyGyro-mean()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroMeanZ</td>
</tr>
<tr class="odd">
<td align="left">V427</td>
<td align="left">fBodyGyro-std()-X</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroStdX</td>
</tr>
<tr class="even">
<td align="left">V428</td>
<td align="left">fBodyGyro-std()-Y</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroStdY</td>
</tr>
<tr class="odd">
<td align="left">V429</td>
<td align="left">fBodyGyro-std()-Z</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroStdZ</td>
</tr>
<tr class="even">
<td align="left">V430</td>
<td align="left">fBodyGyro-mad()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V431</td>
<td align="left">fBodyGyro-mad()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V432</td>
<td align="left">fBodyGyro-mad()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V433</td>
<td align="left">fBodyGyro-max()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V434</td>
<td align="left">fBodyGyro-max()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V435</td>
<td align="left">fBodyGyro-max()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V436</td>
<td align="left">fBodyGyro-min()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V437</td>
<td align="left">fBodyGyro-min()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V438</td>
<td align="left">fBodyGyro-min()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V439</td>
<td align="left">fBodyGyro-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V440</td>
<td align="left">fBodyGyro-energy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V441</td>
<td align="left">fBodyGyro-energy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V442</td>
<td align="left">fBodyGyro-energy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V443</td>
<td align="left">fBodyGyro-iqr()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V444</td>
<td align="left">fBodyGyro-iqr()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V445</td>
<td align="left">fBodyGyro-iqr()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V446</td>
<td align="left">fBodyGyro-entropy()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V447</td>
<td align="left">fBodyGyro-entropy()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V448</td>
<td align="left">fBodyGyro-entropy()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V449</td>
<td align="left">fBodyGyro-maxInds-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V450</td>
<td align="left">fBodyGyro-maxInds-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V451</td>
<td align="left">fBodyGyro-maxInds-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V452</td>
<td align="left">fBodyGyro-meanFreq()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V453</td>
<td align="left">fBodyGyro-meanFreq()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V454</td>
<td align="left">fBodyGyro-meanFreq()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V455</td>
<td align="left">fBodyGyro-skewness()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V456</td>
<td align="left">fBodyGyro-kurtosis()-X</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V457</td>
<td align="left">fBodyGyro-skewness()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V458</td>
<td align="left">fBodyGyro-kurtosis()-Y</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V459</td>
<td align="left">fBodyGyro-skewness()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V460</td>
<td align="left">fBodyGyro-kurtosis()-Z</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V461</td>
<td align="left">fBodyGyro-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V462</td>
<td align="left">fBodyGyro-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V463</td>
<td align="left">fBodyGyro-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V464</td>
<td align="left">fBodyGyro-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V465</td>
<td align="left">fBodyGyro-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V466</td>
<td align="left">fBodyGyro-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V467</td>
<td align="left">fBodyGyro-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V468</td>
<td align="left">fBodyGyro-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V469</td>
<td align="left">fBodyGyro-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V470</td>
<td align="left">fBodyGyro-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V471</td>
<td align="left">fBodyGyro-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V472</td>
<td align="left">fBodyGyro-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V473</td>
<td align="left">fBodyGyro-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V474</td>
<td align="left">fBodyGyro-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V475</td>
<td align="left">fBodyGyro-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V476</td>
<td align="left">fBodyGyro-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V477</td>
<td align="left">fBodyGyro-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V478</td>
<td align="left">fBodyGyro-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V479</td>
<td align="left">fBodyGyro-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V480</td>
<td align="left">fBodyGyro-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V481</td>
<td align="left">fBodyGyro-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V482</td>
<td align="left">fBodyGyro-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V483</td>
<td align="left">fBodyGyro-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V484</td>
<td align="left">fBodyGyro-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V485</td>
<td align="left">fBodyGyro-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V486</td>
<td align="left">fBodyGyro-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V487</td>
<td align="left">fBodyGyro-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V488</td>
<td align="left">fBodyGyro-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V489</td>
<td align="left">fBodyGyro-bandsEnergy()-1,8</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V490</td>
<td align="left">fBodyGyro-bandsEnergy()-9,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V491</td>
<td align="left">fBodyGyro-bandsEnergy()-17,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V492</td>
<td align="left">fBodyGyro-bandsEnergy()-25,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V493</td>
<td align="left">fBodyGyro-bandsEnergy()-33,40</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V494</td>
<td align="left">fBodyGyro-bandsEnergy()-41,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V495</td>
<td align="left">fBodyGyro-bandsEnergy()-49,56</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V496</td>
<td align="left">fBodyGyro-bandsEnergy()-57,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V497</td>
<td align="left">fBodyGyro-bandsEnergy()-1,16</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V498</td>
<td align="left">fBodyGyro-bandsEnergy()-17,32</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V499</td>
<td align="left">fBodyGyro-bandsEnergy()-33,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V500</td>
<td align="left">fBodyGyro-bandsEnergy()-49,64</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V501</td>
<td align="left">fBodyGyro-bandsEnergy()-1,24</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V502</td>
<td align="left">fBodyGyro-bandsEnergy()-25,48</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V503</td>
<td align="left">fBodyAccMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccMagMean</td>
</tr>
<tr class="even">
<td align="left">V504</td>
<td align="left">fBodyAccMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccMagStd</td>
</tr>
<tr class="odd">
<td align="left">V505</td>
<td align="left">fBodyAccMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V506</td>
<td align="left">fBodyAccMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V507</td>
<td align="left">fBodyAccMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V508</td>
<td align="left">fBodyAccMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V509</td>
<td align="left">fBodyAccMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V510</td>
<td align="left">fBodyAccMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V511</td>
<td align="left">fBodyAccMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V512</td>
<td align="left">fBodyAccMag-maxInds</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V513</td>
<td align="left">fBodyAccMag-meanFreq()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V514</td>
<td align="left">fBodyAccMag-skewness()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V515</td>
<td align="left">fBodyAccMag-kurtosis()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V516</td>
<td align="left">fBodyBodyAccJerkMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkMagMean</td>
</tr>
<tr class="odd">
<td align="left">V517</td>
<td align="left">fBodyBodyAccJerkMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyAccJerkMagStd</td>
</tr>
<tr class="even">
<td align="left">V518</td>
<td align="left">fBodyBodyAccJerkMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V519</td>
<td align="left">fBodyBodyAccJerkMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V520</td>
<td align="left">fBodyBodyAccJerkMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V521</td>
<td align="left">fBodyBodyAccJerkMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V522</td>
<td align="left">fBodyBodyAccJerkMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V523</td>
<td align="left">fBodyBodyAccJerkMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V524</td>
<td align="left">fBodyBodyAccJerkMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V525</td>
<td align="left">fBodyBodyAccJerkMag-maxInds</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V526</td>
<td align="left">fBodyBodyAccJerkMag-meanFreq()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V527</td>
<td align="left">fBodyBodyAccJerkMag-skewness()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V528</td>
<td align="left">fBodyBodyAccJerkMag-kurtosis()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V529</td>
<td align="left">fBodyBodyGyroMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroMagMean</td>
</tr>
<tr class="even">
<td align="left">V530</td>
<td align="left">fBodyBodyGyroMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroMagStd</td>
</tr>
<tr class="odd">
<td align="left">V531</td>
<td align="left">fBodyBodyGyroMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V532</td>
<td align="left">fBodyBodyGyroMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V533</td>
<td align="left">fBodyBodyGyroMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V534</td>
<td align="left">fBodyBodyGyroMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V535</td>
<td align="left">fBodyBodyGyroMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V536</td>
<td align="left">fBodyBodyGyroMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V537</td>
<td align="left">fBodyBodyGyroMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V538</td>
<td align="left">fBodyBodyGyroMag-maxInds</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V539</td>
<td align="left">fBodyBodyGyroMag-meanFreq()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V540</td>
<td align="left">fBodyBodyGyroMag-skewness()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V541</td>
<td align="left">fBodyBodyGyroMag-kurtosis()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V542</td>
<td align="left">fBodyBodyGyroJerkMag-mean()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroJerkMagMean</td>
</tr>
<tr class="odd">
<td align="left">V543</td>
<td align="left">fBodyBodyGyroJerkMag-std()</td>
<td align="left">TRUE</td>
<td align="left">Mean by Subject, Activity</td>
<td align="left">MeanFreqBodyGyroJerkMagStd</td>
</tr>
<tr class="even">
<td align="left">V544</td>
<td align="left">fBodyBodyGyroJerkMag-mad()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V545</td>
<td align="left">fBodyBodyGyroJerkMag-max()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V546</td>
<td align="left">fBodyBodyGyroJerkMag-min()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V547</td>
<td align="left">fBodyBodyGyroJerkMag-sma()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V548</td>
<td align="left">fBodyBodyGyroJerkMag-energy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V549</td>
<td align="left">fBodyBodyGyroJerkMag-iqr()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V550</td>
<td align="left">fBodyBodyGyroJerkMag-entropy()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V551</td>
<td align="left">fBodyBodyGyroJerkMag-maxInds</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V552</td>
<td align="left">fBodyBodyGyroJerkMag-meanFreq()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V553</td>
<td align="left">fBodyBodyGyroJerkMag-skewness()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V554</td>
<td align="left">fBodyBodyGyroJerkMag-kurtosis()</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V555</td>
<td align="left">angle(tBodyAccMean,gravity)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V556</td>
<td align="left">angle(tBodyAccJerkMean),gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V557</td>
<td align="left">angle(tBodyGyroMean,gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V558</td>
<td align="left">angle(tBodyGyroJerkMean,gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V559</td>
<td align="left">angle(X,gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">V560</td>
<td align="left">angle(Y,gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">V561</td>
<td align="left">angle(Z,gravityMean)</td>
<td align="left">FALSE</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
</tbody>
</table>
