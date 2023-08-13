function [groot1,groot2,groot3]=r2()
G=2;Pe=1;D=100;Bni=0.15;M=0.001;n=500;
Kmat2=linspace(0,0.2,n);
r2=zeros(n,3);
%three 
groot1=zeros(n,3);
groot2=zeros(n,3);
groot3=zeros(n,3);
Remat=[0.01,0.1,1];

%loop for different Re and K
for i=1:3
Re=Remat(1,i);
for j=1:n
K=Kmat2(1,j);
s = zeros(1,4);
s(1,1)=1;
s(1,2)=(K.^2).*((1./Pe)+(4./Re)+((2.*Bni)./Re));
s(1,3)=(K.^2).*(((4.*K.^2)./(Pe.*Re))+((D.*K.^2)./(2.*Re))-(3./Re)+((D.*M.*G)./Re)+((2.*Bni.*K.^2)./(Pe.*Re)));
s(1,4)=(K.^4./(Pe.*Re)).*((((D.*K.^2)./2)-3));
A = roots(s);
r2(j,1)=A(1,1);
r2(j,2)=A(2,1);
r2(j,3)=A(3,1);
end

%saving root on different matrix
if i==1
groot1=r2;%roots of question5(a)
q="a";
elseif i==2
groot2=r2;%roots of question5(b)
q="b";
elseif i==3
groot3=r2;%roots of question5(c)
q="c";
end

%plotting the graph for corresponding Re values separately
figure(i+5)
plot(Kmat2,r2,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Roots inbuilt function 5",strcat(q),fontsize=20)
legend("first root","second root","third root",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)
hold on
end




