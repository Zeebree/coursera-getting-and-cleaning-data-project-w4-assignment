# Code Book

This code book is for "tidy_data.txt". Provides:
* Summarizes the resulting data fields.
* Information about downloading and loading data.
* Manipulating data.

## Identifiers

* "subject" - The ID of the test subject
* "activity" - The type of activity

## Measurements

* "TimeBodyAccelerometerMean()-X"                              
* "TimeBodyAccelerometerMean()-Z"                              
* "TimeBodyAccelerometerStandardDeviation()-Y"                 
* "TimeGravityAccelerometerMean()-X"                           
* "TimeGravityAccelerometerMean()-Z"                           
* "TimeGravityAccelerometerStandardDeviation()-Y"              
* "TimeBodyAccelerometerJerkMean()-X"                          
* "TimeBodyAccelerometerJerkMean()-Z"                          
* "TimeBodyAccelerometerJerkStandardDeviation()-Y"             
* "TimeBodyGyroscopeMean()-X"                                  
* "TimeBodyGyroscopeMean()-Z"                                  
* "TimeBodyGyroscopeStandardDeviation()-Y"                     
* "TimeBodyGyroscopeJerkMean()-X"                              
* "TimeBodyGyroscopeJerkMean()-Z"                              
* "TimeBodyGyroscopeJerkStandardDeviation()-Y"                 
* "TimeBodyAccelerometerMagnitudeMean()"                       
* "TimeGravityAccelerometerMagnitudeMean()"                    
* "TimeBodyAccelerometerJerkMagnitudeMean()"                   
* "TimeBodyGyroscopeMagnitudeMean()"                           
* "TimeBodyGyroscopeJerkMagnitudeMean()"                       
* "FrequencyBodyAccelerometerMean()-X"                         
* "FrequencyBodyAccelerometerMean()-Z"                         
* "FrequencyBodyAccelerometerStandardDeviation()-Y"            
* "FrequencyBodyAccelerometerJerkMean()-X"                     
* "FrequencyBodyAccelerometerJerkMean()-Z"                     
* "FrequencyBodyAccelerometerJerkStandardDeviation()-Y"        
* "FrequencyBodyGyroscopeMean()-X"                             
* "FrequencyBodyGyroscopeMean()-Z"                             
* "FrequencyBodyGyroscopeStandardDeviation()-Y"                
* "FrequencyBodyAccelerometerMagnitudeMean()"                  
* "FrequencyBodyAccelerometerJerkMagnitudeMean()"              
* "FrequencyBodyGyroscopeMagnitudeMean()"                      
* "FrequencyBodyGyroscopeJerkMagnitudeMean()"                  
* "TimeBodyAccelerometerMean()-Y"                             
* "TimeBodyAccelerometerStandardDeviation()-X"                
* "TimeBodyAccelerometerStandardDeviation()-Z"                
* "TimeGravityAccelerometerMean()-Y"                          
* "TimeGravityAccelerometerStandardDeviation()-X"             
* "TimeGravityAccelerometerStandardDeviation()-Z"             
* "TimeBodyAccelerometerJerkMean()-Y"                         
* "TimeBodyAccelerometerJerkStandardDeviation()-X"            
* "TimeBodyAccelerometerJerkStandardDeviation()-Z"            
* "TimeBodyGyroscopeMean()-Y"                                 
* "TimeBodyGyroscopeStandardDeviation()-X"                    
* "TimeBodyGyroscopeStandardDeviation()-Z"                    
* "TimeBodyGyroscopeJerkMean()-Y"                             
* "TimeBodyGyroscopeJerkStandardDeviation()-X"                
* "TimeBodyGyroscopeJerkStandardDeviation()-Z"                
* "TimeBodyAccelerometerMagnitudeStandardDeviation()"         
* "TimeGravityAccelerometerMagnitudeStandardDeviation()"      
* "TimeBodyAccelerometerJerkMagnitudeStandardDeviation()"     
* "TimeBodyGyroscopeMagnitudeStandardDeviation()"             
* "TimeBodyGyroscopeJerkMagnitudeStandardDeviation()"         
* "FrequencyBodyAccelerometerMean()-Y"                        
* "FrequencyBodyAccelerometerStandardDeviation()-X"           
* "FrequencyBodyAccelerometerStandardDeviation()-Z"           
* "FrequencyBodyAccelerometerJerkMean()-Y"                    
* "FrequencyBodyAccelerometerJerkStandardDeviation()-X"       
* "FrequencyBodyAccelerometerJerkStandardDeviation()-Z"       
* "FrequencyBodyGyroscopeMean()-Y"                            
* "FrequencyBodyGyroscopeStandardDeviation()-X"               
* "FrequencyBodyGyroscopeStandardDeviation()-Z"               
* "FrequencyBodyAccelerometerMagnitudeStandardDeviation()"    
* "FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation()"
* "FrequencyBodyGyroscopeMagnitudeStandardDeviation()"        
* "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation()"    

## Activity Labels

* "WALKING" (value "1"): subject was walking during the test
* "WALKING_UPSTAIRS" (value "2"): subject was walking up a staircase during the test
* "WALKING_DOWNSTAIRS" (value "3"): subject was walking down a staircase during the test
* "SITTING" (value "4"): subject was sitting during the test
* "STANDING" (value "5"): subject was standing during the test
* "LAYING" (value "6"): subject was laying down during the test

## Downloading and loading data

* Downloads the UCI HAR zip file
* Unzip file
* Reads files and load it into memory (e.g. "features.txt")

## Manipulating data

* Merges test data and trainning data
* Extracts only the measurements on the mean and standard deviation for each measurement, plus activity and subject.
* Set names and transforms columns activity and subject into a factor .
* Creates tidy data set with the average of each variable for each activity and each subject.

Final data frame looks like this:

		> head(subsetDataMean[,1:5])
	  subject           activity TimeBodyAccelerometerMean()-X TimeBodyAccelerometerMean()-Y TimeBodyAccelerometerMean()-Z
	1       1            WALKING                     0.2773308                  -0.017383819                    -0.1111481
	2       1   WALKING_UPSTAIRS                     0.2554617                  -0.023953149                    -0.0973020
	3       1 WALKING_DOWNSTAIRS                     0.2891883                  -0.009918505                    -0.1075662
	4       1            SITTING                     0.2612376                  -0.001308288                    -0.1045442
	5       1           STANDING                     0.2789176                  -0.016137590                    -0.1106018
	6       1             LAYING                     0.2215982                  -0.040513953                    -0.1132036