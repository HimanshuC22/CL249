% defining N (number of steps)
N = input('Enter Number of Steps (N) >> ');

% upper and lower limits
a = 0;
b = 30;

% Answer by Trapeziodal Method
I_trapez = trapeziodal_int(@f, a, b, N);
disp('Integral by Trapezuim Method - ')
disp(I_trapez)

% Answer by Gauss Quadrature Method
I_gauss = gauss_quad(@f, a, b, N);
disp('Integral by Gauss Quadrature Method - ')
disp(I_gauss)

% Vector for N's
Ns = 1:500;

% Step Size for each N
hs = (b-a)./Ns;

% Matrices for integrals for each N
trap_int = zeros(1,length(Ns));
gauss_int = zeros(1, length(N));

% Calculating integration for different N's
for i = 1:500
    trap_int(1,i) = trapeziodal_int(@f, a, b, Ns(i));
    gauss_int(1,i) = gauss_quad(@f, a, b, Ns(i));
end

% Plotting h vs I
plot(hs, trap_int, 'LineWidth', 1.25, 'DisplayName', 'Trapeziodal Method')
hold on
plot(hs, gauss_int, 'LineWidth', 1.25, 'DisplayName', 'Gauss Quadrature Method')
title('Step Size vs Integral')
xlabel('Number of Steps')
ylabel('Calculated Integral')
legend

% given integrand function
function y = f(x)
        y = ((250*x)/(x+6)) * exp((-1)*x/10);
        return
end