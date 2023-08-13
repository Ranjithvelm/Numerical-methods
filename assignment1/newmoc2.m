clear; close all; clc;

% Define the advection velocity and spatial domain
c = 1;
x_min = 0;
x_max = 1;

% Define the time domain
t_min = 0;
t_max = 1;

% Define the spatial and temporal discretization
Nx = 100;
Nt = 100;
dx = (x_max - x_min) / Nx;
dt = (t_max - t_min) / Nt;

% Define the initial conditions
x = linspace(x_min, x_max, Nx + 1);
u = sin(2 * pi * x);

% Preallocate memory for the solution
U = zeros(Nx + 1, Nt + 1);
U(:, 1) = u;

% Iterate over time
for n = 1:Nt
    u_new = u;
    for i = 2:Nx
        x_char = x(i) - c * dt;
        j = floor((x_char - x_min) / dx) + 1;
        u_new(i) = u(j) + u(i) * dt;
    end
    u = u_new;
    U(:, n + 1) = u;
end

% Plot the solution as a surface
[X, T] = meshgrid(x, t_min:dt:t_max);
surf(X, T, U');
xlabel('x');
ylabel('t');
zlabel('u');
title('Solution of the linear advection equation');
