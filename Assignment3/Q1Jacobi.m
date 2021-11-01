clear
clc
A = load('A.txt');
n = length(A);
B = zeros(n, 1) + 61;
iterations = 0;
Xg = zeros(n,1);    
Xf = zeros(n,1);
ERR = 1;
error = 10^(-3);

while 1>0 
    for i = 1:n
        
        sum = 0;
        for j = 1:n
            if(i~=j)
                sum = sum + (A(i,j)*Xg(j));
                operations = operations + 2;
            end
        end
        
        Xf(i) = (B(i) - sum)/A(i,i);
        operations = operations + 2;
    end
    
    isConverging = 1; % like boolean value for checking convergence
    
    % checking convergence for every element
    for k = 1:n
        if abs((Xf(k) - Xg(k))/Xf(k)) > error
            isConverging = 0;
        end
    end
    
    if(isConverging == 1)
        break;
    end
    Xg = Xf;
    iterations = iterations + 1;
    ERR(iterations) = max(abs((Xf - Xg)./Xf));
end
operations
plot(1:iterations, ERR);
title('Iterations vs Error');
xlabel('Number of Iterations');
ylabel('Relative error');
linsolve(A, B)
Xf
