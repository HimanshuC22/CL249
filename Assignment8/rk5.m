function [X, Y1, Y2, Y3] = rk5(a, b, h, N)
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
        
        % Calculating K's for y1, y2 using derivative function
        [k1y1, k1y2, k1y3] = derivative(Y1(i), Y2(i), c, d);
        [k2y1, k2y2, k2y3] = derivative(Y1(i) + (k1y1*h/4), Y2(i) + (k1y2*h/4), c, d);
        [k3y1, k3y2, k3y3] = derivative(Y1(i) + (k1y1*h/8) + (k2y1*h/8), Y2(i) + (k1y2*h/8) + (k2y2*h/8), c, d);
        [k4y1, k4y2, k4y3] = derivative(Y1(i) - (k2y1*h/2) + (k3y1*h), Y2(i) - (k2y2*h/2) + (k3y2*h), c, d);
        [k5y1, k5y2, k5y3] = derivative(Y1(i) + (k1y1*h*3/16) + (k4y1*h*9/16), Y2(i) + (k1y2*h*3/16) + (k4y2*h*9/16), c, d);
        [k6y1, k6y2, k6y3] = derivative(Y1(i) - (k1y1*h*3/7) + (k2y1*h*2/7) + (k3y1*h*12/7) - (k4y1*h*12/7) + (k5y1*h*8/7), Y2(i) - (k1y2*h*3/7) + (k2y2*h*2/7) + (k3y2*h*12/7) - (k4y2*h*12/7) + (k5y2*h*8/7) , c, d);
        
        % Updating the Y values
        Y1(i+1) = Y1(i) + ((7*k1y1) + (32*k3y1) + (12*k4y1) + (32*k5y1) + (7*k6y1))*h/90;
        Y2(i+1) = Y2(i) + ((7*k1y2) + (32*k3y2) + (12*k4y2) + (32*k5y2) + (7*k6y2))*h/90;
        Y3(i+1) = Y3(i) + ((7*k1y3) + (32*k3y3) + (12*k4y3) + (32*k5y3) + (7*k6y3))*h/90;
    end
    return
end