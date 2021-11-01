% Gauss Quadrature method
function I = gauss_quad(f, a, b, N)
    I = 0;
    x1 = -1/sqrt(3);
    x2 = 1/sqrt(3);
    
    % Step Size
    h = (b-a)/N;
    
    % Calculate and sum for each division of the interval
    for i = 1:N
        A = h/2; % (x2-x1)2
        B = (a + (i*h) - (h/2)); % (x2+x1)/2
        I = I + A*(f((A*x1) + B) + f((A*x2) + B));
    end
    return
end