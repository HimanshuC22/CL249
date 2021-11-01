% Boundary
a = 0;
b = 100;

% Tolerance
tol = 10^-4;

% Defining Y_pre to store previous Y matrix for error calculation
% Size = 4 due to first iteration of the loop
Y_pre = zeros(1, 4);
for i = 2:10
    % Increasing N exponentially
    N = 2^i;
    h = (b-a)/N;
    % X interval
    X = linspace(a, b, N);
    % Getting Y through solver
    Y = solve(a, b, h);
    % Calculating maximum error
    maxerr = -1;
    for j = 1:i
        err = abs((Y(2*j - 1) - Y_pre(j))/Y(2*j - 1));
        if err > maxerr
            maxerr = err;
        end
    end
    
    legendtext = ['h = ' num2str(h)];
    % Plotting the graph
    if maxerr<tol
        % if Maximum error < tolerance, plot bold graph to highlight
        plot(X, Y, 'LineWidth', 3, 'DisplayName', legendtext);
    else
        % else plot normal graph
        plot(X, Y, 'DisplayName', legendtext);
    end
    hold on
    % Set Y_pre to Y
    Y_pre = Y;
end

xlabel('X')
ylabel('Concentration')
title('Plot of Concentration (x) vs Distance from origin (x)')
legend
