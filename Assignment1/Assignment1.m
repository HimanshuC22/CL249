% clearing console
clear
clc

% Taking user input for initial guess for the modified secant method
initial_guess = input("Initial Guess = ");

% Array containing values for pressure from 1 atm to 100 atm
P = linspace(1, 100, 1000);

% Volume array (initially zero)
V = zeros(1, 1000);

i = 1;
% Calculating V for every value of P (find_V() is the function for find V at a given P)
for p = P
    V(i) = findVolume(initial_guess, p);
    i = i+1;
end

plot(P, V,'LineWidth', 1.5);
title("PV Isotherm (T = 345K)");
xlabel("Pressure (P)");
ylabel("Volume (V)");
