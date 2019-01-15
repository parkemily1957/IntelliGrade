# Smart-Grader
Artificial Intelligence application to be implemented in educational institutions as a faster and easier way to grade free response questions (FRQs).

 ## To Do	
- [x] Split up data into training, test, and cross validation sets	We first must randomly initialize the parameters for our neural network or else each node of the hidden layer(s) will be computing the same function.
- [ ] Don't rely on accuracy of predictions against the training data as a metric for the accuracy of our model (could convey a false sense of generalization accuracy and mask overfitting)	
- [ ] Make grading feature (use row matrices for inputted data and correct answers)

## Disclaimer
displayData.m, ex4data1.mat, ex4weights.mat, fmincg.m, predict.m, processImage.m, and randInitializeWeights.m are from Andrew Ng's work. In addition, rgb2ntsc.m's source code is included due to import functionality difficulties.
