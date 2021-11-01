% Non-Linear equation solver function for a particular P and starting guess
function y = findVolume(x0, P)
    i = 1;
    delta = 0.01;
    error = 0.001;
    x1 = x0 - (((delta*x0)*(func(x0, P)))/(func(x0 + (delta*x0), P) - func(x0, P)));
    while abs(x1 - x0)/abs(x1) > error
        x0 = x1;
        x1 = x0 - (((delta*x0)*(func(x0, P)))/(func(x0 + (delta*x0), P) - func(x0, P)));
        i = i+1;
    end
    y = x1;
    return
end