clc
clear all

x0 = [0;1];
t(1) = 0;

dt = 0.1;

x_sol = x0;

w = 2*pi*1;

f = @(t,x) spring(t,x,w);

for i = 2:100
    x_sol(:,i) = RK4(t(i-1), x_sol(:,i-1),f, dt);
    t(i) = t(i-1)+dt;
end

plot(t, x_sol(2,:));