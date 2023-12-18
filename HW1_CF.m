% Main script to solve the ODE
tspan = [0 40];
y0 = [29; 20];  % initial conditions
[t, Y] = ode45(@system, tspan, y0);

% Plotting results
plot(t, Y(:,1)); % Plotting the first component of Y
hold on;
plot(t, Y(:,2)); % Plotting the second component of Y
legend('Y1', 'Y2');
xlabel('Time');
ylabel('Values');
title('Solution of the System of ODEs');
grid on;

% Define the Vlead function
function vl = Vlead(t)
    if t < 5
        vl = 20 - 10 * (t / 5) ^ 3;
    else
        vl = 10;
    end
end

% Define the system of ODEs
function dYdt = system(t, Y)
    C = [0, -1; 0.23, -0.323];
    D = [0, 1; 1, 0.07];
    vl = Vlead(t);
    dYdt = C * Y + D * [-1.61; vl];
end
