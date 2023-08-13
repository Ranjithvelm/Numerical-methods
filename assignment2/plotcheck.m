clear;
clc;


% INITIAL VALUE is taken "0"
% change to different initial values like -50,-2 etc....
[K1,P,Q,R]=question3(0);
[K2,U,V,W]=question5(0);

[R11,R12,R13]=r();
[R21,R22,R23]=r2();

% above four functions are answers to questions 3,4,5,6
% K1 is the matrix of K values from 0 to 0.5
% K2 is the matrix of K values from 0 to 0.2
% P, Q, R is the matrix containing the final roots at Bni=0,1,10
% respectively
% U, V, W is the matrix containing the final roots at Re=0.01,0.1,1
% respectively
% R11, R12, R13 is the matrix containing the all three roots on
% corresponding column vector @ Bni = 0,1,10 respectively
% R21, R22, R23 is the matrix containing the all three roots on
% corresponding column vector @ Bni = 0,1,10 respectively

%the below all plots are comparison of Newton's and Root(inbuilt function) method
figure(9)
plot(K1,P,K1,R11,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 3(a)",fontsize=20)
legend("Newton method","Roots function",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)

figure(10)
plot(K1,Q,K1,R12,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 3(b)",fontsize=20)
legend("Newton method","Roots function",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)

figure(11)
plot(K1,R,K1,R13,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 3(c)",fontsize=20)
legend("Newton method","Roots function",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)

figure(12)
plot(K2,U,K2,R21,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 5(a)",fontsize=20)
legend("Newton method","first Root","second root","third root",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)

figure(13)
plot(K2,V,K2,R22,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 5(b)",fontsize=20)
legend("Newton method","first Root","second root","third root",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)

figure(14)
plot(K2,W,K2,R23,linewidth=2)
set(gca,'XMinorTick','on','YMinorTick','on')
title("Comparision of Question 5(c)",fontsize=20)
legend("Newton method","first Root","second root","third root",fontsize=20)
xlabel("K",fontsize=20)
ylabel("Root of s",fontsize=20)



