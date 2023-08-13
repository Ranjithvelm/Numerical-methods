function [rx,ry,rootu] = newton(x0,itmax,tol)

% All print statements are commented out except whether converged or not

%
%Initialize variable
% 

x=zeros(itmax+1,1);r=zeros(itmax+1,1);
x(1,1)=x0; r(1,1)=f(x0);
% fprintf('\n');
%
%Set up the iterative scheme
%
for k=1:itmax
    x(k+1,1)=x(k,1)-f(x(k,1))/fprime(x(k,1));
    r(k+1,1)=f(x(k+1,1));
    if abs(r(k+1,1))<=tol
         disp(['Method has converged after ',num2str(k),' iterations.'])
        break
    end
end
if abs(r(k+1,1))>tol
    disp(['Method has NOT converged after ',num2str(k),' iterations.'])
end
%
%Some print statements
%
% fprintf('\n');
% disp(' iter  value of x         value of f(x)')
for i=1:k+1
%     fprintf('%4.0f',i-1)
%     fprintf('%19.14f',x(i,1))
%     fprintf('%19.14f',r(i,1))
%     fprintf('\n');
end
% fprintf('\n');
rootu = x(i,1);
%
%Residual values of the function to be passed as output to the function
%
rx=zeros(k,1);ry=zeros(k,1);
for i=1:k
    rx(i,1)=abs(r(i,1));
    ry(i,1)=abs(r(i+1,1));
end

%
% Subroutines to enter your function and its derivative
%
function y=f(s)
[G,K,Pe,D,Re,M,Bni]=constants();
y= (s.^3)+(((s.^2).*(K.^2)).*((1./Pe)+(4./Re)+((2.*Bni)./Re)))+((s.*K.^2).*(((4.*K.^2)./(Pe.*Re))+((D.*K.^2)./(2.*Re))-(3./Re)+((D.*M.*G)./Re)+((2.*Bni.*K.^2)./(Pe.*Re))))+((K.^4./(Pe.*Re)).*((((D.*K.^2)./2)-3)));

function yp=fprime(s)
[G,K,Pe,D,Re,M,Bni]=constants();
yp= (3.*s.^2)+(((2.*s).*(K.^2)).*((1./Pe)+(4./Re)+((2.*Bni)./Re)))+((K.^2).*(((4.*K.^2)./(Pe.*Re))+((D.*K.^2)./(2.*Re))-(3./Re)+((D.*M.*G)./Re)+((2.*Bni.*K.^2)./(Pe.*Re))));

%Function to introduce constants into the functions
function [G,K,Pe,D,Re,M,Bni]=constants()
global G K Pe D Re M Bni