% Defining Interval
a = 0;
b = 4;
Y1_pre = 0;
Y2_pre = 0;
eps = 10^(-3);

% Loop for plotting function for different Step sizes
for i = 1:16
    % Number of steps (increasing in every iteration)
    N = 2^(i-1);
    
    % Getting Y1 and Y2 and their convergence truth values from solver
    [X, Y1, Y2] = solver(a, b, N);
    
    Y1_err = 0;
    Y2_err = 0;
   
    for j = 1:length(Y1_pre)
        temp = abs((Y1((2*j) - 1) - Y1(j))/Y1((2*j) - 1));
        if temp > Y1_err
            Y1_err = temp;
        end
    end
    for j = 1:length(Y2_pre)
        temp = abs((Y2((2*j) - 1) - Y2(j))/Y2((2*j) - 1));
        if temp > Y2_err
            Y2_err = temp;
            break;
        end
    end

    figure(1);
    plot(X, Y1);
    xlabel('X')
    ylabel('Y')
    title('Function Y1')
    hold on;
    
    figure(2);
    plot(X,Y2);
    xlabel('X')
    ylabel('Y2')
    title('Function Y2')
    hold on;
    
    Y1_pre = Y1;
    Y2_pre = Y2;
end