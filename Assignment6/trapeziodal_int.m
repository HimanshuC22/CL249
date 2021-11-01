% trapeziodal integration function
function I = trapeziodal_int(f, a, b, N)
    % Step Size
    h = (b-a)/N;
    I = 0;
    
    % Calculate area of each trapezium interval
    while a<=b-h
        I = I + ((1/2)*h*(f(a+h) + f(a)));
        a = a + h;
    end
    return
end