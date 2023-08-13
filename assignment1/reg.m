function r=reg(x,y)
n=length(x);
sx=0;
A=zeros(2);
B=zeros(2,1);
A(1,1)=-1*n;

for i=1:n
sx = sx + x(1,i);
end
A(1,2)=-1*sx;
A(2,1)=-1*sx;
sx
x2=0;
for i=1:n
x2=x2+x(1,i)^2;
end
A(2,2)=-1*x2;
x2
sy=0;
for i=1:n
sy = sy + y(1,i);
end
B(1,1)=-1*sy;
sy
xy=0;
for i=1:n
xy=xy+x(1,i)*y(1,i);
end
B(2,1)=-1*xy;
xy
X=A\B;
a0=X(1,1);
a1=X(2,1);

for i=1:n
y1(1,i)=a1*x(1,i)+a0;
end
fprintf('\n');
disp(['y = ',num2str(X(2,1),'%+2.2f'),'x ',num2str(X(1,1),'%+2.2f')])

sr=0;
for i=1:n
    sr = sr + (y(1,i)-y1(1,i))^2;
end

ybar = sy/n;
st=0;
for i=1:n
st = st+(y(1,i)-ybar)^2;
end

r = ((st-sr)/st)^0.5;

plot(x,y)
hold on
plot(x,y1)
