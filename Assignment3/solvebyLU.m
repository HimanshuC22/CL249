% function for solving Ax=B using L U decomposition
function [X, operations] = solvebyLU(L, U, B)
    operations = 0;
    d2 = size(B);
    n = d2(1);
    N = d2(2);
    X = zeros(n, N);
    for c = 1:N
        b = B(:, c);
        y = zeros(n, 1);
        x = X(:, c);
        
        % Now solve Ly = b by forward substitution
        y(1) = b(1)/L(1,1);
        for r = 2:n
            sum = 0;
            for i = 1:r-1
                sum = sum + (L(r, i)*y(i));
                operations = operations + 2;
            end
            y(r) = (b(r) - sum)/L(r, r);
            operations = operations + 2;
        end
        
        % Solve Ux = y by back substitution
        x(n) = y(n)/U(n,n);
        for r = n-1:-1:1
            sum = 0;
            for i = n:-1:r+1
                sum = sum + (U(r, i)*x(i));
                operations = operations + 2;
            end
            x(r) = (y(r) - sum)/U(r, r);
            operations = operations + 2;
        end
        X(:, c) = x;
    end
    return
end