% Initialization
clear ; close all; clc
  
% Load variables (avoid live training to save time)
fprintf('Importing data and processing images...');
load("ParametersV3");
fprintf('All parameters learned by the neural network have been loaded in...');

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);
displayData(X(sel, :));
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

fprintf('-----------------------------');

pkg load image;
fprintf("\nPress Enter when you're ready for the demo!!!\n\n");

%demo(Theta1, Theta2, 1000);

gradeFromCam(Theta1, Theta2);