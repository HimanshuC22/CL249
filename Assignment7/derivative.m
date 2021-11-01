% Function to calculate derivatives of Y1 and Y2
function [y1_dash, y2_dash] = derivative(x, y1, y2)
    y1_dash = f1(x, y1);
    y2_dash = f2(y1, y2);
    return
end

% Given function Y1 slope
function t = f1(x, y)
    t = -(2*y) + (4*exp(-1*x));
    return
end

% Given function Y2 slope
function t = f2(y1, y2)
    t = (-1)*y1*(y2^2)/3;
    return
end