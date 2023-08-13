function p_sol = RK4(x,p,f,h1)
%x contain [r,R and epsilon]
%f is the vector of functions
k1 = f(x,p);
k2 = f(x + 0.5*h1, p + 0.5*h1*k1);
k3 = f(x + 0.5*h1, p + 0.5*h1*k2);
k4 = f(x + h1, p + h1*k3);

p_sol = p + (h1/6)*(k1 + 2*(k2+k3) + k4);
end 