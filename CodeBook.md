# CodeBook
Antonela Tomić  
Saturday, September 20, 2014  
  
Data in "Clean data set" file
---

Dataset "Clean data set.txt" contains merged train and test data calculated out of the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Signals notation is explained below the list of data and data itself follows the same naming rules.

Calculated data is identified with activity performed and the subject who perfomed it. 
Each subject is presented with different number.

List of data for one observation:

1.  overall$activity_id      
2.	overall$activity         
3.	overall$subject                   
4.	tBodyAcc.std...Y                  
5.	tGravityAcc.std...X               
6.	tGravityAcc.std...Z               
7.	tBodyAccJerk.std...Y              
8.	tBodyGyro.std...X                 
9.	tBodyGyro.std...Z                 
10.	tBodyGyroJerk.std...Y             
11.	tBodyAccMag.std..                 
12.	tBodyAccJerkMag.std..             
13.	tBodyGyroJerkMag.std..            
14.	fBodyAcc.std...Y                  
15.	fBodyAccJerk.std...X              
16.	fBodyAccJerk.std...Z              
17.	fBodyGyro.std...Y                 
18.	fBodyAccMag.std..                 
19.	fBodyBodyGyroMag.std..            
20.	tBodyAcc.mean...X                 
21.	tBodyAcc.mean...Z                 
22.	tGravityAcc.mean...Y              
23.	tBodyAccJerk.mean...X             
24.	tBodyAccJerk.mean...Z             
25.	tBodyGyro.mean...Y                
26.	tBodyGyroJerk.mean...X            
27.	tBodyGyroJerk.mean...Z            
28.	tGravityAccMag.mean..             
29.	tBodyGyroMag.mean..               
30.	fBodyAcc.mean...X                 
31.	fBodyAcc.mean...Z                 
32.	fBodyAcc.meanFreq...Y             
33.	fBodyAccJerk.mean...X             
34.	fBodyAccJerk.mean...Z             
35.	fBodyAccJerk.meanFreq...Y         
36.	fBodyGyro.mean...X                
37.	fBodyGyro.mean...Z                
38.	fBodyGyro.meanFreq...Y            
39.	fBodyAccMag.mean..                
40.	fBodyBodyAccJerkMag.mean..        
41.	fBodyBodyGyroMag.mean..           
42.	fBodyBodyGyroJerkMag.mean..       
43.	angle.tBodyAccMean.gravity.       
44.	angle.tBodyGyroMean.gravityMean.  
45.	angle.X.gravityMean.              
46.	angle.Z.gravityMean. 
47.	tBodyAcc.std...X                    
48.	tBodyAcc.std...Z                    
49.	tGravityAcc.std...Y                 
50.	tBodyAccJerk.std...X                
51.	tBodyAccJerk.std...Z                
52.	tBodyGyro.std...Y                   
53.	tBodyGyroJerk.std...X               
54.	tBodyGyroJerk.std...Z               
55.	tGravityAccMag.std..                
56.	tBodyGyroMag.std..                  
57.	fBodyAcc.std...X                    
58.	fBodyAcc.std...Z                    
59.	fBodyAccJerk.std...Y                
60.	fBodyGyro.std...X                   
61.	fBodyGyro.std...Z                   
62.	fBodyBodyAccJerkMag.std..           
63.	fBodyBodyGyroJerkMag.std..          
64.	tBodyAcc.mean...Y                   
65.	tGravityAcc.mean...X                
66.	tGravityAcc.mean...Z                
67.	tBodyAccJerk.mean...Y               
68.	tBodyGyro.mean...X                  
69.	tBodyGyro.mean...Z                  
70.	tBodyGyroJerk.mean...Y              
71.	tBodyAccMag.mean..                  
72.	tBodyAccJerkMag.mean..              
73.	tBodyGyroJerkMag.mean..             
74.	fBodyAcc.mean...Y                   
75.	fBodyAcc.meanFreq...X               
76.	fBodyAcc.meanFreq...Z               
77.	fBodyAccJerk.mean...Y               
78.	fBodyAccJerk.meanFreq...X           
79.	fBodyAccJerk.meanFreq...Z           
80.	fBodyGyro.mean...Y                  
81.	fBodyGyro.meanFreq...X              
82.	fBodyGyro.meanFreq...Z              
83.	fBodyAccMag.meanFreq..              
84.	fBodyBodyAccJerkMag.meanFreq..      
85.	fBodyBodyGyroMag.meanFreq..         
86.	fBodyBodyGyroJerkMag.meanFreq..     
87.	angle.tBodyAccJerkMean..gravityMean.
88.	angle.tBodyGyroJerkMean.gravityMean.
89.	angle.Y.gravityMean. 

    
Extraction and transformation done by run_analysis.R script on the original data
---

Script does the following    
1. DOWNLOADING ZIP FILE  
2. UNZIPPIN FILE  
3. USING FUNCTION FOR EXPLORING ALL FILES IN UNZIPPED DIRECTORY  
4. READING COMMON DATA AND NAMING COLUMNS  
5. READING TEST DATA AND NAMING COLUMNS  
6. READING TRAIN DATA AND NAMING COLUMNS  
7. BINDING TEST AND TRAIN DATA  
8. JOINING ACTIVITY LABELS WITH ACTIVITY DATA y  
9. JOINING SUBJECT TO ACTIVITY LABELS AND ACTIVITY DATA  
10. JOINING x TO SUBJECT AND ACTIVITY LABELS AND ACTIVITY DATA  
11. JOINING ALL MEASUREMENTS TO x AND SUBJECT AND ACTIVITY LABELS AND ACTIVITY DATA  
12. EXTRACTING COLUMNS WITH MEAN AND STANDARD DEVIATION VALUES  
13. INITIALIZING VARIABLES FOR CREATING NEW CLEAN DATA SET  
14. SPLITTING DATA SET BY SUBJECTS  
15. SPLITTING EACH SUBJECT GROUP BY ACTIVITIES  
16. CALCULATING MEAN VALUE FOR EACH ACTIVITY OF ONE SUBJECT  
17. SHOWING HEAD OF FIRST FEW COLUMNS OF CLEAN DATA SET  
18. WRITING CLEAN DATA SET INTO FILE    

Script also explains actions within commented parts in the code.


Source for the data and naming notation
---

Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
  
The set of variables that were estimated from these signals are:   
  
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  
  
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  
