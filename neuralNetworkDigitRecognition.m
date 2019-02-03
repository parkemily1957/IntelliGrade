 %% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')
load('ex4data1.mat');
m = size(X, 1);

% Splitting data: 20% is in the test set, 20% is in the corss validation set, and 60% is the training data
testSet = [X(1:100, :); X(501:600, :); X(1001:1100, :); X(1501:1600, :); ...
           X(2001:2100, :); X(2501:2600, :); X(3001:3100, :); ...
           X(3501:3600, :); X(4001:4100, :); X(4501:4600, :)];
crossValidationSet = [X(101:200, :); X(601:700, :); X(1101:1200, :); ...
                      X(1601:1700, :); X(2101:2200, :); X(2601:2700, :); ...
                      X(3101:3200, :); X(3601:3700, :); X(4101:4200, :); ...
                      X(4601:4700, :)];

% Find which indexes of the original matrix X have been used for the test and CV sets
[~, indexT] = ismember(X, testSet, "rows");
[~, indexCV] = ismember(X, crossValidationSet, "rows");

% Empty matrix to be filled with the training data (X without all the test and CV data)
B = [];

% Empty solutions matrices
trainingSolutions = [];
crossValidationSolutions = [];
testSolutions = [];

% Filtering X into the training data
for i = 1 : 5000

  if indexT(i) == 0 && indexCV(i) == 0
      B = [B; X(i, :)];
      trainingSolutions = [trainingSolutions; y(i)];
  endif
  
  if indexCV(i) != 0
      crossValidationSolutions = [crossValidationSolutions; y(i)];
  endif
  
  if indexT(i) != 0
      testSolutions = [testSolutions; y(i)];
  endif
  
endfor

X = B;

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);
displayData(X(sel, :));
fprintf('Program paused. Press enter to continue.\n');
pause;

% -------------------------------------------------------------------

fprintf('\nLoading Saved Neural Network Parameters ...\n')
% Load the weights into variables Theta1 and Theta2
load('ex4weights.mat');

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:)];

fprintf('\nInitializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% -------------------------------------------------------------------

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
numIterations = 1000;
options = optimset('MaxIter', numIterations);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, trainingSolutions, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost, i] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;

% Graphing cost vs iterations
figure;
plot(0:numIterations - 1, cost(1:numIterations));
title("Cost Function vs. Number of Iterations");
xlabel('Num of iterations');
ylabel('Cost!');

pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == trainingSolutions)) * 100);

pred = predict(Theta1, Theta2, crossValidationSet);
fprintf('\nCross Validation Set Accuracy: %f\n', mean(double(pred == crossValidationSolutions)) * 100);

pred = predict(Theta1, Theta2, testSet);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == testSolutions)) * 100);

% -------------------------------------------------------------------

% Custom Image Processing and Predictions
pkg load image;

fprintf("\nPress Enter when you're ready for the demo!!!\n\n");

fprintf("\n--------------------------------------------------\n");
%demo(Theta1, Theta2, 1000);

gradeFromCam(Theta1, Theta2);
