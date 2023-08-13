function DP = wave_equation(x, y, w)
 global   g R    n rho
 R=287;
 g=1.4;
L = 4;
rho=1.204;
 n=3; T0 = 1100; m =  -220;

T = T0 + m *x;
dTdx = m;



p1 = y(1); 
p2 = y(2);

dp1 = p2;
dp2 =-((dTdx/T)*p2 + (w^2/(g*R*T))*p1);

DP = [dp1; dp2];
end