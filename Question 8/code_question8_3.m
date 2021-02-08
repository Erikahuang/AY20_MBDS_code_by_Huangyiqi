k1=100;k2=600;k3=150;
E0=1;
% the relationship between V and S 
S=1:0.01:800;
V=k3*E0*S./(k1/(k2+k3)+S);
plot(S,V);
% when the concentrations of S are small
S=1:1e-6:1.5;
V=k3*E0*S./(k1/(k2+k3)+S);
figure;
plot(S,V);

% Theoretical limit value
syms s;
V2=k3*E0*s/(k1/(k2+k3)+s);
Vm=limit(V2,s,inf)