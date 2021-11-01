function [X, Y1, Y2] = solver(a, b, N)
    
    % Defining step size
    h = (b-a)/N;
    
    X = zeros(1, N);
    Y1 = zeros(1, N);
    Y2 = zeros(1, N);

    % Initial Values
    Y1(1) = 2;
    Y2(1) = 4;
    
    for i = 1:N-1
        % increasing X with step value
        X(i+1) = X(i) + h;
        % Calculating derivative for Y calculation
        [f1, f2] = derivative(X(i), Y1(i), Y2(i));
        
        % Next value of Y1
        Y1(i+1) = Y1(i) + (h*f1);
        % Next value of Y2
        Y2(i+1) = Y2(i) + (h*f2);
    end
    return
end