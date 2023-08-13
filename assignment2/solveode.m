function solveode
[t,y]=ode45(@f, [0 5], [0;-2]);
plot(t,y(:,1),linewidth=2)
hold on
fplot(@(x) exp(x)*(cos(x)-sin(x)),[0,5],linewidth=2)
legend('ode45 solution','analytical solution',fontsize=20)
title('Solving ODE using ode45',fontsize=20)
xlabel('t',fontsize=20)
ylabel('y',fontsize=20)

function yprime = f(t,y)
yprime = [y(2); 2*y(2)-2*y(1)];