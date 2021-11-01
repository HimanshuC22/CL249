% Matrix A and B
A = load('A.txt');
B = load('B.txt');

dimensions = size(A); % Dimensions of A
m = dimensions(1); % No. of rows
n = dimensions(2); % No. of columns

X = gauss_elimination(A, B, m, n);
disp('X = ')
disp(X)
plot(X, 'LineWidth', 1.5)