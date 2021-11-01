X = zeros(9);
C = gauss_elimination(A, B, n, n);
f = @(x) C(1) + (C(2)*(x)) + (C(3)*(x^2)) + (C(4)*(x^3)) + (C(5)*(x^4)) + (C(6)*(x^5)) + (C(7)*(x^6)) (C(8)*(x^7)) + (C(9)*(x^8));
differences = zeros(n, 1);

for i = 1:n
    differences(i) = abs()