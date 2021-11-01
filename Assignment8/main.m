% Interval of X
a = 0;
b = 4;
% Number of steps
N = 500;
% Step size
h = (b-a)/N;

% Calculating Y1, Y2, Y3, by RK4 Method
[X1, Y1_RK4, Y2_RK4, Y3_RK4] = rk4(a, b, h, N);
% Calculating Y1, Y2, Y3 by RK5 Method
[X2, Y1_RK5, Y2_RK5, Y3_RK5] = rk5(a, b, h, N);

% Plotting the RK4 Method Solution
figure(1)
plot(X1, Y1_RK4, 'DisplayName', 'Y1 (Healthy People)', 'LineWidth', 1.25);
hold on
plot(X1, Y2_RK4,'DisplayName', 'Y2 (Infected Prople)', 'LineWidth', 1.25);
hold on
plot(X1, Y3_RK4, 'DisplayName', 'Y3 (People Under Quarantine)', 'LineWidth', 1.25);
title('Solution by RK1 Method')
xlabel('X')
ylabel('Y')
legend

% Plotting the RK5 Method Solution
figure(2)
plot(X2, Y1_RK5, 'DisplayName', 'Y1 (Healthy People)', 'LineWidth', 1.25);
hold on
plot(X2, Y2_RK5,'DisplayName', 'Y2 (Infected Prople)', 'LineWidth', 1.25);
hold on
plot(X2, Y3_RK5, 'DisplayName', 'Y3 (People Under Quarantine)', 'LineWidth', 1.25);
title('Solution by RK2 Method')
xlabel('X')
ylabel('Y')
legend
