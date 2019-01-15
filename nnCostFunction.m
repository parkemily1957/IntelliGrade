function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
  
% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1); % Number of training examples
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% Forward Propagation
A = eye(num_labels);
y_matrix = A(y,:);
a1 = [ones(m, 1) X];
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ones(size(a2, 1), 1) a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3); % Our hypothesis calculated by the neural network

%% Cost Function Calculation
J = (1 / m) * sum(sum((-y_matrix .* log(a3)) - ((1 - y_matrix) .* log(1 - a3)))); % Unregularized
regTerms = ((lambda) / (2 * m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2))); % Calculating the regularization term
J = J + regTerms; % Regularized cost function

% Backpropagation
d3 = a3 - y_matrix;
d2 = d3 * Theta2(:, 2:end) .* sigmoidGradient(z2);
delta1 = d2' * a1;
delta2 = d3' * a2;
Theta1_grad = (1 / m) * delta1;
Theta2_grad = (1 / m) * delta2;

% Gradient Regularization
Theta1(:, 1) = 0; % We don't regularize the bias term
Theta2(:, 1) = 0; % Same as above

Theta1_grad = Theta1_grad + (lambda / m) * Theta1;
Theta2_grad = Theta2_grad + (lambda / m) * Theta2;

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
