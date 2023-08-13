function [Kmat1,P,Q,R]=question4(initial)
%this function gets the initial value of "s" as input

%initialized constants for the functions
% G-gamma(i); K-(known)independent variable; D represents D^-1, n-size of K; 
global G K Pe D Re M Bni

%in question 3(a)-(c) all the constant except Bni changes
G=2;Pe=1;D=100;Re=0.1;M=0.001;n=500;

%initialize a matrix to store roots
table=zeros(n,3);

%Kmat is a matrix which contains all K values range is between 0 to 0.5
Kmat1=linspace(0,0.5,n);
Bnimat=[0,1,10];
%loop to change Bni value
for i=1:3
Bni=Bnimat(1,i);
for j=1:500
K=Kmat1(1,j);

%calling the newton.m function
[~,~,rootu]=newton(initial,100,0.00000000001);

%storing the roots on table
table(j,i)=rootu;
end

%plotting the roots to the corresponding K values
figure(1)
plot(Kmat1,table(:,i))
set(gca,'XMinorTick','on','YMinorTick','on')
title("Newton's method 4(a)-(c)")
legend("(a)Bni=0","(b)Bni=1","(c)Bni=10")
xlabel("K")
ylabel("Root of s")
hold on
end

P=table(:,1);
Q=table(:,2);
R=table(:,3);
