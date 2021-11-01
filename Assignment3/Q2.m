clear
clc
A = load('A.txt');
n = length(A);
B = zeros(n, 1) + 61;
operations = 0;
n = length(A);
iterations = 0;
Xf = zeros(n,1);
Xg = zeros(n,1);
ERR = 1;
error = 10^(-6);
w = 1.2;

while 1>0
    for i = 1:n
        sum = 0;
        for j = 1:n
            if(i~=j)
                sum = sum + (A(i,j)*Xf(j));
                operations = operations + 2;
            end
        end    
        
        Xf(i) = Xg(i);
        Xg(i) = (B(i) - sum)/A(i,i) ;
        Xf(i) = Xf(i)  + w*(Xg(i) - Xf(i));
        operations = operations + 5;
    end
    
    isConverging = 1; % like boolean value for checking convergence
    
    % checking convergence for every element
    for k = 1:n
        if abs((Xf(k) - Xg(k))/Xf(k)) > error
            isConverging = 0;
            break;
        end
    end
    
    if(isConverging == 1)
        break;
    end
    
    iterations  =iterations + 1;
    ERR(iterations) = max(abs((Xf - Xg)./Xf));
    
end
plot(1:iterations, ERR, 'LineWidth', 1.5);
title('Iterations vs Error');
xlabel('Number of Iterations');
ylabel('Relative error');
operations
Xf   