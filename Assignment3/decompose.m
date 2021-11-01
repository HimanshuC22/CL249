function [L, U, operations] = decompose(A, n)
    operations = 0;
    
    % initializing L
    L = eye(n);
    
    % L and U calculation
    for c = 1:n
        for r = n:-1:c+1
            if (A(r,c) ~= 0)
                factor = A(r, c)/A(c, c); % 1 operation
                L(r,c) = factor; % storing the factor in L
                A(r,:) = A(r, :) - (factor*A(c, :)); % 2*n operations
                operations = operations + (2*n) + 1;
            end
        end
    end
    U = A;
end