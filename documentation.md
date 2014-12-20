---
title: "Car Evaluation documentation"
author: "explorer"
date: "Friday, December 19, 2014"
output: html_document
---
### Documentation for Car Evaluation application

**Data Source**
Data for this project is downloaded from the UCI machine learning repository. 
The data set that is used is the Car Evaluation database
http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data  

Description of the data set is available at
http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.names

**What does this application do?**
This application takes desired attributes of the car, as user inputs and based on those inputs gives the  the number of cars and their acceptability in a bar plot. All attribute data and the evaluation is part of the car evaluation database 

**User inputs**
The user can select the following attributes of the car:
Selection can be made from the drop down for the following:

Buying price: high, low, med, vhigh  
maintenance cost: high, low, med, vhigh  
Desired safety:High, med, low  

Multiple selections can be made for the following attributes:

Number of doors:2,4,5 or more    
Number of persons/capacity:2, 4, more  
Size of luggage boot: big,med, small  

**Output/Results Displayed**  
The user selections are displayed on the main panel and on scrolling down, the user can see the bar plot that gives the number of cars for each of the evaluations, based on attributes selected. 

unacc - unacceptable  
acc - acceptable   
good - good  
vgood - very good   

As the selections change on the side panel, the main panel [user selections, bar plot] also changes accordingly
