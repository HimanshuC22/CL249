A = randi(20, 5, 5)
B = randi(12, 5, 5)

[A_inv, operations] = INVERSE(A)

function [AI, count] = INVERSE(A)
    count = 0;
    n = length(A);
    AI = eye(n);
    
    for c = 1:n
        for r = 1:n
            if(r~=c && A(r, c)~=0)
                factor = A(r, c)/A(c, c); % 1 operation
                count = count + 1;
                A(r, :) = A(r, :) - (factor*A(c, :)); % 2*c operations
                count = count + 2*n;
                AI(r, :) = AI(r, :) - (factor*(AI(c, :))); % 2*c operation
                count = count + 2*n;
            end
        end
        
        if(A(c, c)~=1)
            A(c, :) = A(c, :)/A(c, c);
            count = count + n;
            AI(c, :) = AI(c, :)/A(c, c);
            count = count + n;
        end
    end
    return
end