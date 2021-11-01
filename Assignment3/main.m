A = load('A.txt'); % load a from txt
B = load('B.txt'); % load B from txt

dimensions = size(A);
n = dimensions(1);

% decomposing A to L and U
[L, U, operations1] = decompose(A, n);

[X, operations2] = solvebyLU(L, U, B);

% identity matrix for getting inverse
B2 = eye(n);

% getting inverse by solving Ax = B2 where B2 is identity
[Ainv, operations3] = solvebyLU(L, U, B2);

% displaying operations and X
X
operations = operations1 + operations2 + operations3
Ainv