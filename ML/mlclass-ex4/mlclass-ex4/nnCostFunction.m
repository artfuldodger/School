function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%

% Take y and recode into vectors
I = eye(num_labels);
Y = zeros(m, num_labels);
for i = 1:m,
  Y(i, :) = I(y(i), :);
end

% Now let's do forward propagation

% Add bias to X to get a1
a1 = [ones(m, 1) X];

% z2 = theta(1)*a(1)
z2 = a1*Theta1';

% a2 = g(z2)
gz2 = sigmoid(z2);
% plus bias
a2 = [ones(size(z2, 1), 1) gz2];

% z3 = theta(2) * a(2)
z3 = a2*Theta2';

% a3 = g(z3)
a3 = h = sigmoid(z3);

regularization_term = (lambda*(sum(sum(Theta1(:, 2:end).^2, 2)) + sum(sum(Theta2(:, 2:end).^2, 2)))) / (2 * m);

J = sum(sum(-Y .* log(h) - (1 - Y) .* log(1 - h), 2))/m + regularization_term;

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

delta2 = (a3 - Y)'*a2;
delta1_start = ((a3 - Y) * Theta2) .* sigmoidGradient([ones(size(z2, 1), 1) z2]);
delta1 = delta1_start(:, 2:end)' * a1;

Theta2_grad = delta2 / m;
Theta1_grad = delta1 / m;

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Don't regularize the first column - thus replacing first column with zeros
theta_one_for_regularization = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
theta_two_for_regularization = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

regularization_term_1 = (lambda * theta_one_for_regularization)/m;
regularization_term_2 = (lambda * theta_two_for_regularization)/m;

Theta1_grad += regularization_term_1;
Theta2_grad += regularization_term_2;














% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
