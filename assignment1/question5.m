function [Kmat2,U,V,W]=question5(initial)
%this function gets the initial value of "s" as input

%initialized constants for the functions
% G-gamma(i); K-(known)independent variable; D represents D^-1; 
global G K Pe D Re M Bni

%in question 5(a)-(c) all the constant except Re changes
G=2;Pe=1;D=100;Bni=0.15;M=0.001;

%initialize a matrix to store roots
table=zeros(500,1);

%Kmat is a matrix which contains all K values whose range is between 0 to 0.2
Kmat2=linspace(0,0.2,500);
Remat=[0.01,0.1,1];
%loop to change Re value
for i=1:3
Re=Remat(1,i);
for j=1:500
K=Kmat2(1,j);

%calling the newton.m function and getting only the final answer
[~,~,rootu]=newton(initial,100,0.00000000001);

%storing the roots on table
table(j,i)=rootu;
end

%plotting the roots to the corresponding K values
figure(2)
plot(Kmat2,table(:,i))
set(gca,'XMinorTick','on','YMinorTick','on')
title("Newton's method 5(a)-(c)")
legend("(a)Re=0.01","(b)Re=0.1","(c)Re=1")
xlabel("K")
ylabel("Root of s")
hold on
end
U=table(:,1);
V=table(:,2);
W=table(:,3);
