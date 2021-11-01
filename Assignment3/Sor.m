a = [0.8 ,-0.4, 0;
     -0.4 ,0.8 ,-0.4;
      0, -0.4, 0.8 ];
b = [41;25;105];
n = 3;
x1 = zeros(n,1);
x2 = zeros(n,1);
k =1;
err = 0.000001;
w = 1.4;
while 1
    for i =1 : n
        sum = 0;
        for j = 1: n
            if ( i ~= j)
                sum = sum + (a(i,j)*x1(j));
            end
        end
        x1(i) = x2(i);
        x2(i) = (b(i) - sum)/a(i,i) ;
        x1(i) = x1(i)  + w*(x2(i) - x1(i));
    end
     if abs (x2 - x1)<err
        break;
     end
end
for i = 1 : n
    disp( x1(i));
end

    
    
    