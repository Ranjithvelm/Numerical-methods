function [rx,ry] = abhivnewton(x0,itmax,tol)
r=zeros(itmax+1,1);
x=x0;r(1,1)=norm(f(x0));
fprintf('\n');
disp(' iter  L2 norm of f(x)')
fprintf('%4.0f',0)
fprintf('%19.14f',r(1,1))
fprintf('\n');
for k=1:itmax
    J=jacobian(x);rhs=-f(x);
    delta=J\rhs;
    x=x+delta;
    r(k+1,1)=norm(f(x));
    fprintf('%4.0f',k)
    fprintf('%19.14f',r(k+1,1))
    fprintf('\n');
    if abs(r(k+1,1))<=tol
        fprintf('\n');
        disp(['Method has converged after ',num2str(k),' iterations.'])
        break
    end
end

if abs(r(k+1,1))>tol
    fprintf('\n');
    disp(['Method has NOT converged after ',num2str(k),' iterations.'])
end
fprintf('\n');
disp('Solution vector:')
x
rx=zeros(k,1);ry=zeros(k,1);
for i=1:k
    rx(i,1)=r(i,1);
    ry(i,1)=r(i+1,1);
end

function y=f(x)
y(1,1)=((20-x(1,1))*(50-(2*x(1,1)))^2)/(5+x(1,1))-(10000/4);

y(2,1)=((10-x(1,2))*(50-x(1,2)))/(5+x(1,2))-(100/3.7);


function J=jacobian(x)
n=length(x);
J=zeros(n,n);
J(1,1)=(x(1,2) - 10)/(x(1,2) + 5) + (x(1,2) - 50)/(x(1,2) + 5) - ((x(1,2) - 10)*(x(1,2) - 50))/(x(1,2) + 5)^2;
J(1,2)=0;
J(2,1)=0;
J(2,2)=((2*x(1,1) - 50)^2*(x(1,1) - 20))/(x(1,1) + 5)^2 - (2*x(1,1) - 50)^2/(x(1,1) + 5) - ((8*x(1,1) - 200)*(x(1,1) - 20))/(x(1,1) + 5);

