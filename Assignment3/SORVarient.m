A=[0.8 -0.4 0; 
  -0.4 0.8 -0.4;
  0 -0.4 0.8];

% [m,n]=size(A);
n = length(A);

B=[41; 25; 105;];

tol=0.000001;

Xf = zeros(3, 1);
Xgs= zeros(3, 1);
Xold=ones(3,1);
Error=1;
avgerr=0;
w=1.2;
Xsor=zeros(3,1);
err=1;
errplot=zeros(1000,1);
itterationplot=zeros(1000,1);
for i=1:1000  %Iteration
    flag=0;
    
    % Calculating Xgs here (Gauss Siedel)
    for j=1:n %Row loop
        sum1=0;
        for k=1:j-1 % Calculating Sum
            sum1=sum1+A(j,k)*Xf(k);
        end
        sum2=0;
        for k=j+1:n %Calculating Sum
            sum2=sum2+A(j,k)*Xold(k);
        end
        Xgs(j)=(1/A(j,j))*(B(j)-sum1-sum2);  % Calculating Xnew   
    end
    
    Xold = Xf;
    % Calculating SOR here
    Xf = Xold + w*(Xgs - Xold);
    
    
    if max(abs((Xf-Xold)./Xf)) < tol
        flag = 1;
    end
    
    err(i) = max(abs((Xf - Xold)./Xf));

    if(flag==1)
        break;
    end
end

plot(1:i, err)