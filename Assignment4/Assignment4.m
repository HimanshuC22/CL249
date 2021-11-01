A = load('A.txt');
n = length(A);
B = zeros(n, 1) + 61;

[X_jacobi jacobi_ops] = jacobi(A, n, B); % Solving through Jacobi method
[X_gSiedel gSiedel_ops] = gauss_siedel(A, n, B); % Solving through Gauss Siedel method
[X_gElim gElim_ops] = gauss_elimination(A, B, n, n); % Solving through Gauss Elimination

X_jacobi
jacobi_ops

X_gSiedel
gSiedel_ops

X_gElim
gElim_ops