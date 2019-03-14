# IntelliGrade
Artificial Intelligence application to be implemented in educational institutions as a faster and easier way to grade free response questions (FRQs).

# Difference Between Current Market Solutions
  Currently, banks and postal offices utilize handwriting recognition in their services. For example, when someone deposits a check at the bank, the reader's hardware is programmed to recognize the check's amount ($#). However, because check sizes are standardized, these readers only read certain regions of the check (they don't automatically find where to scan). A similar situation occurs when postal offices read addressing info.
  
  With IntelliGrade, flexibility exists alongside convenience. Teachers are able to create answer sheets of any number of questions while IntelliGrade is still able to automatically process answer sheet data. This app uses edge detection to map out and crop camera images down to the specific answering regions, a feature that lacks in services such as banking and postal services.

 ## To Do	
- [x] Split up data into training, test, and cross validation sets	We first must randomly initialize the parameters for our neural network or else each node of the hidden layer(s) will be computing the same function.
- [ ] Don't rely on accuracy of predictions against the training data as a metric for the accuracy of our model (could convey a false sense of generalization accuracy and mask overfitting)	
- [ ] Make grading feature (use row matrices for inputted data and correct answers)
- [ ] Allow teachers to overwrite incorrect predictions
- [ ] Display confidence levels in predictions on the answering screen

## Disclaimer
displayData.m, ex4data1.mat, ex4weights.mat, predict.m, processImage.m, and randInitializeWeights.m are from Andrew Ng's work. In addition, rgb2ntsc.m's and fmincg.m's source code is included due to import functionality difficulties running on a Windows OS.
