    A = [ 0.8 ,-0.4, 0;
     -0.4 ,0.8 ,-0.4;
      0, -0.4, 0.8 ];
B = [41; 
    25;
    105];
iterations = 0;
n = length(A);
operations = 0;
Xf = zeros(n,1);
Xg = zeros(n,1);
w = 1.2;
tol = 10^(-6);
errmat = 0;

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
        if abs((Xf(k) - Xg(k))/Xf(k)) > tol
            isConverging = 0;
            break;
        end
    end
    
    if(isConverging == 1)
        break;
    end
    
    iterations = iterations + 1;
    
end
operations
Xf   