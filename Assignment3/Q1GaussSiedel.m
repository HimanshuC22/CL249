clear
clc
A = [ 0.8 ,-0.4, 0;
     -0.4 ,0.8 ,-0.4;
      0, -0.4, 0.8 ];
iterations = 0;
operations = 0;  
B = [41; 25; 105];

n = length(A);
ERR = 1;
Xg = zeros(n,1);
Xf = zeros(n,1);

tol = 10^(-6);

while 1>0 
    for i = 1:n
        sum = 0;
        for j1 = 1:i-1
            sum = sum + A(i, j1)*Xf(j1);
            operations = operations + 2;
        end
        for j2 = i+1:n
            sum = sum + A(i, j2)*Xg(j2);
            operations = operations + 4;
        end
        
        Xf(i) = (B(i) - sum)/A(i,i);
        operations = operations + 2;
    end
    
    isConverging = 1; % like boolean value for checking convergence
    
    % checking convergence for every element
    for k = 1:n
        if abs((Xf(k) - Xg(k))/Xf(k)) > tol
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
plot(1:iterations, ERR);
title('Iterations vs Error');
xlabel('Number of Iterations');
ylabel('Relative error');
operations
iterations
Xf