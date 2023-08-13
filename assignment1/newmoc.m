clear all;
clc;

N = 100;
M = 100;
dx = 1 / (N - 1);
dt = 1 / (M - 1);
c = 1;

% Initialize the spatial grid
x = linspace(0, 1, N);

% Initialize the temporal grid
t = linspace(0, 1, M);

% Initialize the solution matrix
u = zeros(N, M);
u(:, 1) = sin(2 * pi * x);

% Time-stepping loop
for j = 2:M
    for i = 1:N
        xi = x(i) - c * dt;
        if xi >= 0 && xi <= 1
            u(i, j) = interp1(x, u(:, j - 1), xi) + dt * 1;
        end
    end
end

% Plot the solution as a surface
figure
surf(x, t, u');
xlabel('x');
ylabel('t');
zlabel('u');
