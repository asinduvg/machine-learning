function [J, grad] = costFunctionReg(theta, X, y, lambda)
    %COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
    %   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
    %   theta as the parameter for regularized logistic regression and the
    %   gradient of the cost w.r.t. to the parameters.

    % Initialize some useful values
    m = length(y); % number of training examples

    % You need to return the following variables correctly
    J = 0;
    grad = zeros(size(theta));

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the cost of a particular choice of theta.
    %               You should set J to the cost.
    %               Compute the partial derivatives and set grad to the partial
    %               derivatives of the cost w.r.t. each parameter in theta

    hypothesis = sigmoid(X * theta); % returns a column vector with 118 rows (118 = size of X)

    j1 = y .* log(hypothesis);
    j2 = (1 - y) .* log(1 - hypothesis);

    J = (sum(j1 + j2) .* -1 / m) + (sum(theta.^2) - theta(1).^2) .* lambda ./ (2 * m);
    % J = J - (theta(1).^2 .* lambda ./ (2 * m)) # for not to regularize theta(1)

    grad = (sum((hypothesis - y) .* X)(1, :)' ./ m) + theta .* lambda ./ m; # partial derivative
    grad(1) = grad(1) - theta(1) .* lambda ./ m;

    % =============================================================
