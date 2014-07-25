# Code Book for Human Activity Recognition Dataset  

This documents aims to describe the data in the Human Activity Recognition dataset, its origins, the experimental design, the variables in the set, and all the transformations applied to them to reach the tidy data set.

### Source of Data and Experimental Design

The data is sourced from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and downloaded via link posted in [Getting and Cleaning Data course web-site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Data is downloaded via **download.file** command and then unzipped via the **unzip** command.

The dataset contains experimental measurements of 30 human subject aged 19 to 48 performing daily activities with a Galaxy S2 smartphone attached to their waist. The complete data is divided into training and test datasets. Its proposed usage is for machine learning tasks - classification and clustering.

### Variables Information

For each record in the original dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 

* Triaxial Angular velocity from the gyroscope. 

* A 561-feature vector with time and frequency domain variables. 

* Its activity label. 

* An identifier of the subject who carried out the experiment.

Data for each measurement of the accelerometer and gyroscope comes in already summarized form. The dataset is contains their means, standard deviations, mean average deviaaions, maximums, minimums, energy levels, correlations, autoregressive coefficients, entropy levels and other relevant numerical summeries. For a full list of variables, please refer to the Appendix of the current document.  

The **units** of the data differ across original variables:

* Readings from the accelerometer (acceleration) are reported as total body acceleration minus gravity, and therefore the units are meters per second squared. 

* Reading from the gyroscope (angular velocity) are reported as radians per second.

* Corresponding descriptive statistics such as mean, maximum, minimum, standard deviation, etc. are reported in the same units as the measurement itself.

* Correlations, autoregressive coefficients and other measures of association are reported on their respective scales (without units).

For the purposes of this project, we are using **normalized values** in the range [-1;1].

### Summary Choices and Transformation Procedures

First we will need to merge the two datasets. As observatoins come from one and the same dataset it is interesting to see how these were separated into two datasets. First we investigate the subject numbers of the training datasets. It contains subjects:
**Levels: 1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30**.

On the other hand, the test dataset contains subject with numbers:
**Levels: 2 4 9 10 12 13 18 20 24**

Therefore, it is clear that the two datasets contain observations from different subjects on the same variables. This makes it inappropriate to use the function **merge** to merge the dataset. A better approach, which we use here, is to bind the two datasets via the **rbind**, effectively adding the test set after the training set. This is possible as the columns of the two sets are completely identical.

Next we extract the means and standard deviations of all variables via their names, using the **grep** command and have a new dataset with the means, standard deviations, subject and activity names. Using the **recode** function from the **car** package we give descriptive names to the activities that were initially coded with numbers. The mapping guideline is found in the file *activity_labels.txt*. 

### Appendix: Full List of Variables in the Final Dataset: Activity.TidyData

     [,1] [,2]                                                            
 [1,] "1"  "subject"                                                       
 [2,] "2"  "time.BodyAccelerometer.mean.axisX"                             
 [3,] "3"  "time.BodyAccelerometer.mean.axisY"                             
 [4,] "4"  "time.BodyAccelerometer.mean.axisZ"                             
 [5,] "5"  "time.BodyAccelerometer.StandardDeviation.axisX"                
 [6,] "6"  "time.BodyAccelerometer.StandardDeviation.axisY"                
 [7,] "7"  "time.BodyAccelerometer.StandardDeviation.axisZ"                
 [8,] "8"  "time.GravityAccelerometer.mean.axisX"                          
 [9,] "9"  "time.GravityAccelerometer.mean.axisY"                          
[10,] "10" "time.GravityAccelerometer.mean.axisZ"                          
[11,] "11" "time.GravityAccelerometer.StandardDeviation.axisX"             
[12,] "12" "time.GravityAccelerometer.StandardDeviation.axisY"             
[13,] "13" "time.GravityAccelerometer.StandardDeviation.axisZ"             
[14,] "14" "time.BodyAccelerometerJerk.mean.axisX"                         
[15,] "15" "time.BodyAccelerometerJerk.mean.axisY"                         
[16,] "16" "time.BodyAccelerometerJerk.mean.axisZ"                         
[17,] "17" "time.BodyAccelerometerJerk.StandardDeviation.axisX"            
[18,] "18" "time.BodyAccelerometerJerk.StandardDeviation.axisY"            
[19,] "19" "time.BodyAccelerometerJerk.StandardDeviation.axisZ"            
[20,] "20" "time.BodyGyroscope.mean.axisX"                                 
[21,] "21" "time.BodyGyroscope.mean.axisY"                                 
[22,] "22" "time.BodyGyroscope.mean.axisZ"                                 
[23,] "23" "time.BodyGyroscope.StandardDeviation.axisX"                    
[24,] "24" "time.BodyGyroscope.StandardDeviation.axisY"                    
[25,] "25" "time.BodyGyroscope.StandardDeviation.axisZ"                    
[26,] "26" "time.BodyGyroscopeJerk.mean.axisX"                             
[27,] "27" "time.BodyGyroscopeJerk.mean.axisY"                             
[28,] "28" "time.BodyGyroscopeJerk.mean.axisZ"                             
[29,] "29" "time.BodyGyroscopeJerk.StandardDeviation.axisX"                
[30,] "30" "time.BodyGyroscopeJerk.StandardDeviation.axisY"                
[31,] "31" "time.BodyGyroscopeJerk.StandardDeviation.axisZ"                
[32,] "32" "time.BodyAccelerometerMagnitude.mean"                          
[33,] "33" "time.BodyAccelerometerMagnitude.StandardDeviation"             
[34,] "34" "time.GravityAccelerometerMagnitude.mean"                       
[35,] "35" "time.GravityAccelerometerMagnitude.StandardDeviation"          
[36,] "36" "time.BodyAccelerometerJerkMagnitude.mean"                      
[37,] "37" "time.BodyAccelerometerJerkMagnitude.StandardDeviation"         
[38,] "38" "time.BodyGyroscopeMagnitude.mean"                              
[39,] "39" "time.BodyGyroscopeMagnitude.StandardDeviation"                 
[40,] "40" "time.BodyGyroscopeJerkMagnitude.mean"                          
[41,] "41" "time.BodyGyroscopeJerkMagnitude.StandardDeviation"             
[42,] "42" "frequency.BodyAccelerometer.mean.axisX"                        
[43,] "43" "frequency.BodyAccelerometer.mean.axisY"                        
[44,] "44" "frequency.BodyAccelerometer.mean.axisZ"                        
[45,] "45" "frequency.BodyAccelerometer.StandardDeviation.axisX"           
[46,] "46" "frequency.BodyAccelerometer.StandardDeviation.axisY"           
[47,] "47" "frequency.BodyAccelerometer.StandardDeviation.axisZ"           
[48,] "48" "frequency.BodyAccelerometer.meanFrequency.axisX"               
[49,] "49" "frequency.BodyAccelerometer.meanFrequency.axisY"               
[50,] "50" "frequency.BodyAccelerometer.meanFrequency.axisZ"               
[51,] "51" "frequency.BodyAccelerometerJerk.mean.axisX"                    
[52,] "52" "frequency.BodyAccelerometerJerk.mean.axisY"                    
[53,] "53" "frequency.BodyAccelerometerJerk.mean.axisZ"                    
[54,] "54" "frequency.BodyAccelerometerJerk.StandardDeviation.axisX"       
[55,] "55" "frequency.BodyAccelerometerJerk.StandardDeviation.axisY"       
[56,] "56" "frequency.BodyAccelerometerJerk.StandardDeviation.axisZ"       
[57,] "57" "frequency.BodyAccelerometerJerk.meanFrequency.axisX"           
[58,] "58" "frequency.BodyAccelerometerJerk.meanFrequency.axisY"           
[59,] "59" "frequency.BodyAccelerometerJerk.meanFrequency.axisZ"           
[60,] "60" "frequency.BodyGyroscope.mean.axisX"                            
[61,] "61" "frequency.BodyGyroscope.mean.axisY"                            
[62,] "62" "frequency.BodyGyroscope.mean.axisZ"                            
[63,] "63" "frequency.BodyGyroscope.StandardDeviation.axisX"               
[64,] "64" "frequency.BodyGyroscope.StandardDeviation.axisY"               
[65,] "65" "frequency.BodyGyroscope.StandardDeviation.axisZ"               
[66,] "66" "frequency.BodyGyroscope.meanFrequency.axisX"                   
[67,] "67" "frequency.BodyGyroscope.meanFrequency.axisY"                   
[68,] "68" "frequency.BodyGyroscope.meanFrequency.axisZ"                   
[69,] "69" "frequency.BodyAccelerometerMagnitude.mean"                     
[70,] "70" "frequency.BodyAccelerometerMagnitude.StandardDeviation"        
[71,] "71" "frequency.BodyAccelerometerMagnitude.meanFrequency"            
[72,] "72" "frequency.BodyBodyAccelerometerJerkMagnitude.mean"             
[73,] "73" "frequency.BodyBodyAccelerometerJerkMagnitude.StandardDeviation"
[74,] "74" "frequency.BodyBodyAccelerometerJerkMagnitude.meanFrequency"    
[75,] "75" "frequency.BodyBodyGyroscopeMagnitude.mean"                     
[76,] "76" "frequency.BodyBodyGyroscopeMagnitude.StandardDeviation"        
[77,] "77" "frequency.BodyBodyGyroscopeMagnitude.meanFrequency"            
[78,] "78" "frequency.BodyBodyGyroscopeJerkMagnitude.mean"                 
[79,] "79" "frequency.BodyBodyGyroscopeJerkMagnitude.StandardDeviation"    
[80,] "80" "frequency.BodyBodyGyroscopeJerkMagnitude.meanFrequency"        
[81,] "81" "activity"