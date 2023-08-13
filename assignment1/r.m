function [groot1,groot2,groot3]=r()
G=2;Pe=1;D=100;Re=0.1;M=0.001;
Kmat1=linspace(0,0.5,500);
r=zeros(500,3);
groot1=zeros(500,3);
groot2=zeros(500,3);
groot3=zeros(500,3);
Bnimat=[0,1,10];

%loop for different Bni and K
for i=1:3
Bni=Bnimat(1,i);
for j=1:500
K=Kmat1(1,j);
s = zeros(1,4);
s(1,1)=1;
s(1,2)=(K.^2).*((1./Pe)+(4./Re)+((2.*Bni)./Re));
s(1,3)=(K.^2).*(((4.*K.^2)./(Pe.*Re))+((D.*K.^2)./(2.*Re))-(3./Re)+((D.*M.*G)./Re)+((2.*Bni.*K.^2)./(Pe.*Re)));
s(1,4)=(K.^4./(Pe.*Re)).*((((D.*K.^2)./2)-3));
A = roots(s);
r(j,1)=A(1,1);
r(j,2)=A(2,1);
r(j,3)=A(3,1);
end

%saving differnt roots on different
if i==1
groot1=r;%roots of question4(a)
n="a";
elseif i==2
groot2=r;%roots of question4(b)
n="b";
elseif i==3
groot3=r;%roots of question4(c)
n="c";
end

figure(i+2)
plot(Kmat1,r)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Roots inbuilt function 4",strcat(n))
legend("first root","second root","third root")
xlabel("K")
ylabel("Root of s")
hold on
end

%to print all roots in same plot
% figure(3)
% plot(Kmat1,r)
% set(gca,'XMinorTick','on','YMinorTick','on')
% title("Roots inbuilt function 4(a)-(c)")
% legend("(a)Bni=0 first root","(a)Bni=0 second root","(a)Bni=0 third root","(b)Bni=1 first root","(b)Bni=1 second root","(b)Bni=1 third root","(c)Bni=10 first root","(c)Bni=10 second root","(c)Bni=10 third root")
% xlabel("K")
% ylabel("Root of s")
% hold on

