clear all
clc

N = 10;
M = 10;
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
    for i = 2:N-1
        u(i, j) = u(i, j-1) - c * dt / dx * (u(i, j-1) - u(i-1, j-1)) + dt * 1;
    end
end

% Plot the solution in a 3D surface plot
[X, T] = meshgrid(x, t);
surf(X, T, u');
xlabel('x');
ylabel('t');
zlabel('u');
