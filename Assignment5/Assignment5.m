% load X and Y from files
X = load('X.txt');
Y = load('Y.txt');

% given descrete data points
Xcalc = [0.5; 1.5; 2.5; 3.5; 4.5; 5.5; 6.5; 7.5;];
Ycalc = zeros(1, length(Xcalc));
% length of the vector
n = length(X);

% declaring A containing xs and B containing ys
A = zeros(n);
B = Y';
for i = 1:n
    for j = 1:n
        A(i,j) = X(i)^(j-1);
    end
end

% calculating coefficients by Gauss Elimination
C = gauss_elimination(A, B, n, n);
% function from the given coefficients
f = @(x) C(1) + (C(2)*x) + (C(3)*(x^2)) + (C(4)*(x^3)) + (C(5)*(x^4)) + (C(6)*(x^5)) + (C(7)*(x^6)) + (C(8)*(x^7)) + (C(9)*(x^8));
differences = zeros(length(Xcalc), 1);

% calculating differences in the given data points
for i = 1:length(Xcalc)
    differences(i) = abs(sqrt(Xcalc(i)) - f(Xcalc(i)));
end

% values for plotting
valx = 0:0.1:8;
valyPloy = zeros(1, length(valx));

for i = 1:length(valx)
    valyPloy(i) = f(valx(i));
end

for i = 1:length(Xcalc)
    Ycalc(i) = f(Xcalc(i));
end

% Plotting values
plot(Xcalc', Ycalc, 'kd', 'LineWidth', 1.25, 'DisplayName', 'Given Data Points');
xlabel('X');
ylabel('f(x)');
hold on
fplot(@(x) sqrt(x), 'b:', 'LineWidth', 1.25)
plot(valx, valyPloy, 'r', 'DisplayName', 'f(x) (Polynomial)', 'LineWidth', 1.25)
legend

disp('Coefficients (a0, a1, .... , a8)')
disp(C)
disp('Differences (0.5, 1.5, .... , 7.5)')
differences
