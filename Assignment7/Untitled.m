X = 0:0.1:4;
Y = zeros(1, length(X));

% X(1) = 0;
Y(1) = 2;
h = 2;
for i = 1:length(X)
    k1 = f1(X(i), Y(i));
    k2 = f1(X(i)-(3*h/4), Y(i)+(3*k1*h/4));
    Y(i+1) = Y(i) + ((k1/3) + (2*k2/3))*h;
end

function t = f1(x, y)
    t = -(2*y) + (4*exp(-1*x));
    return
end

% Given function Y2 slope
function t = f2(y1, y2)
    t = (-1)*y1*(y2^2)/3;
    return
end