% Code of function f(V, P)
function y = func(V, P)
    a = 3.592;
    b = 0.04267;
    R = 0.082056;
    T = 345;
    
    % rearranged van der Waal's equation
    y = (P*(V^3)) - ((V^2)*((P*b) + (R*T))) +(a*V) - (a*b);
    return
end