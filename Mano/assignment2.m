clc
clear all
close all

p10=2000;p20=0;

p_total(:,1) =[p10; p20]; %; y10; y20; z10; z20];

h1=0.01;
x = 0:h1:4;
L = 4;
g = 1.4;
R =287;

 n=1; T0 = 1100; m =  -220;


%w = @(T) 2*pi* ((2*n-1)/(4*L))*sqrt(g*R*T);
w=[];
T = T0 + m *x;
w=2*pi* ((2*n-1)/(4*L))*sqrt(g*R*T);
for jj = 1:1:length(T)
    f1(1,jj)= w(1,jj)/(2*pi);
    fun = @(x,D) wave_equation(x, D, w(1,jj));     % defining function for reduced equations.

    for ii = 1:1:length(x)-1
       
       p_total(:,ii+1) = RK4(x(ii), p_total(:,ii), fun,h1);
       P1=p_total(1,:); P2=p_total(2,:);     % Y1=x_total(3,:);Y2=x_total(4,:);Z1=x_total(5,:);Z2=x_total(6,:);
        
    end
    pstore{jj} = p_total;

end
%%
for i=1:1:length(T)
ds=cell2mat(pstore(i));

    P(:,i)=ds(1,:);P_G(:,i)=ds(2,:);

%plot(x,abs(pstore{1,1}(1,:)));
end
%%%%%
P1=abs(P);
P11=P1(end,:);
 [M I] = min(P11(end,:))
b1 = find(P11==min(P11));
F1 = f1(:,b1); 
%a1=diff(P1,[]);
P1_min=P1(:,b1);
figure()
 plot(x,P1_min)
%  hold on
%  plot(x,pressure_1100_3)
 title('Pressure time series Using Rk-4','FontSize',16,'FontWeight','bold');
        xlabel('Distance(m)','FontSize',12,'FontWeight','bold');
        ylabel('Acoustic pressure amplitude(Pa)','FontSize',12,'FontWeight','bold');
        
        
 
%  pressure_1100_3=P1(:,b1);
%  save pressure_1100_3
%plot(x,P1(35,:))
%%
R=287;
rho=(101325+abs(P1_min(b1,1)))./(R*T);
;%(101325+mean(abs(P1_min)))/((R*T(1,b1)));

P_G1=P_G(:,b1);
% for kk=1:1:length(T)
% %   u(1,kk)=-(R*T(1,kk)*P_G1(kk,1))/((w(1,kk)*P1_min(kk,1)));  
%   u(1,kk)=-P_G1(kk,1)/((w(1,b1)*rho))
% end
u=P_G1./(2*pi*F1*rho)';
 U = abs(u);
figure()
plot(x,U)
velocity_1100_3 = U;
save velocity_1100_3 
