% Function to calculate solution by RK4 Method
function [X, Y1, Y2, Y3] = rk4(a, b, h, N)
    % Given Constants
    c = 1;
    d = 5;
    % Declaring arrays
    X = zeros(1, N);
    Y1 = zeros(1, N);
    Y2 = zeros(1, N);
    Y3 = zeros(1, N);
    
    % Initial Values
    Y1(1) = 95;
    Y2(1) = 5;
    Y3(1) = 0;
    
    % Iteration Loop
    for i = 1:N-1
        % Increment in X
        X(i+1) = X(i) + h;
        % Calculating k1, k2, k3, k4 for y1 and y2 by using the derivative
        [k1y1, k1y2, k1y3] = derivative(Y1(i), Y2(i), c, d);
        [k2y1, k2y2, k2y3] = derivative(Y1(i) + (k1y1*h/2), Y2(i) + (k1y2*h/2), c, d);
        [k3y1, k3y2, k3y3] = derivative(Y1(i) + (k2y1*h/2), Y2(i) + (k2y2*h/2), c, d);
        [k4y1, k4y2, k4y3] = derivative(Y1(i) + (k3y1*h), Y2(i) + (k3y2*h), c, d);
        
        % Updating the next y values
        Y1(i+1) = Y1(i) + (k1y1 + (2*k2y1) + (2*k3y1) + k4y1)*h/6;
        Y2(i+1) = Y2(i) + (k1y2 + (2*k2y2) + (2*k3y2) + k4y2)*h/6;
        Y3(i+1) = Y3(i) + (k1y3 + (2*k2y3) + (2*k3y3) + k4y3)*h/6;
    end
    return
end