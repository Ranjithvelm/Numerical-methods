 clc
 clear all
 close all
% load('pressure_500_3.mat');
%  load('pressure_700_3.mat');
% load('pressure_900_3.mat');
%  load('pressure_1100_3.mat');
%  x=0:0.01:4;
%  plot(x,pressure_500_3,'LineWidth',4);
% hold on
% plot(x,pressure_700_3,'LineWidth',4);
% hold on
% plot(x,pressure_900_3,'LineWidth',4);
% hold on
% plot(x,pressure_1100_3,'LineWidth',4);
%  title('Variation of acoustic pressure amplitude','FontSize',25,'FontWeight','bold');
%         xlabel('Distance(m)','FontSize',20,'FontWeight','bold');
%         ylabel('Acoustic pressure amplitude(Pa)','FontSize',20,'FontWeight','bold');
%         
%         
% legend('\bf T0= 500k & m= -50','\bf T0= 700k &m= -100','\bf T0= 900K & m= -150','\bf T0= 1100k & m= -200')
%%
% load('velocity_500_3.mat');
% load('velocity_700_3.mat');
% load('velocity_900_3.mat');
% load('velocity_1100_3.mat');
%  x=0:0.01:4;
%  plot(x,velocity_500_3,'LineWidth',4);
% hold on
% plot(x,velocity_700_3,'LineWidth',4);
% hold on
% plot(x,velocity_900_3,'LineWidth',4);
% hold on
% plot(x,velocity_1100_3,'LineWidth',4);
%  title('Variation of acoustic velocity amplitude','FontSize',25,'FontWeight','bold');
%         xlabel('Distance(m)','FontSize',20,'FontWeight','bold');
%         ylabel('Acoustic velocity amplitude(Pa)','FontSize',20,'FontWeight','bold');
%         
%         
% legend('\bf T0= 500k & m= -50','\bf T0= 700k &m= -100','\bf T0= 900K & m= -150','\bf T0= 1100k & m= -200');
%%
 x=0:0.01:4;
load('pressure_1100_3.mat');
 load('velocity_1100_3.mat');
 yyaxis left
  plot(x,pressure_1100_3,'LineWidth',4);
       %xlabel('Distance(m)','FontSize',20,'FontWeight','bold');
         ylabel('Acoustic pressure amplitude(Pa)','FontSize',20,'FontWeight','bold')
hold on
yyaxis right
plot(x,velocity_1100_3,'LineWidth',4);
xlabel('Distance(m)','FontSize',20,'FontWeight','bold');
 ylabel('Acoustic velocity amplitude(Pa)','FontSize',20,'FontWeight','bold');
        legend('\bf Acoustic pressure ','\bf Acoustic velocity' )
