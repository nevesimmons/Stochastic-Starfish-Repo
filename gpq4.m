%create function of RHS of eq 
f = @(t, x) x - x.^3;

% Set the time span and a vector of initial conditions x(0)
tspan = [0 5];
x0 = [-1.5,-1, -0.5,-0.1, 0,0.1, 0.5,1, 1.5];

%Solve the ODE simultaneously for all initial conditions
[t, x] = ode45(f, tspan, x0);

%Plot all trajectories on the same axes
figure;
plot(t, x, 'LineWidth', 3);
grid on;
xlabel('Time t');
ylabel('x(t)');
title("Solutions of x' = x - x^3 for Different Initial Conditions x(0)");

legend(compose('x(0) = %.1f', x0), 'Location', 'best');
set(gca,'FontSize',20);
