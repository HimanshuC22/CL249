function Y = solve(a, b, h)
    Cin = 100;
    L = b;
    k = 2;
    U = 100;
    D = 5000;

    N = (L-a)/h;

    A = zeros(N+2, N+2);
    B = zeros(N+2, 1);
    
    % Given Initial Condition at x = 0
    A(1, 1) = D;
    A(1, 2) = 2*h*U;
    A(1, 3) = -D;
    % Given Initial Condition at x = L
    A(N+2, N) = -1;
    A(N+2, N+2) = 1;

    for i = 2:N+1
        A(i, i-1) = (2*D) + (h*U);
        A(i, i) = -((2*k*h*h) + (4*D));
        A(i, i+1) = (2*D) - (h*U);
    end
    B(1, 1) = 2*h*U*Cin;

    % USING GAUSS ELIMINATION FROM ASSIGNMENT-2
    Y = gauss_elimination(A, B, N+2, N+2);
    Y = Y(2:N+1)';
    return
end