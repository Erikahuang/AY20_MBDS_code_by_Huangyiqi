%% 8.2
% define h=0.02
% define dyfun is the four equations
% define the concentrations of E, S, ES, P is y(1), y(2), y(3), y(4), respectively
clc,clear;
[x,y]=marunge4s(@dyfun,[0 1],[1 10 0 0],2e-5);
plot(x,y);
legend('E','S','ES','P');

%% function definition
function f=dyfun(t,y)
f(1)=(600+150)*y(3)-100*y(2)*y(1);
f(2)=600*y(3)-100*y(2)*y(1);
f(3)=-(600+150)*y(3)+100*y(2)*y(1);
f(4)=150*y(3);
f=f(:);
end
function [x,y]=marunge4s(dyfun,xspan,y0,h)
x=xspan(1):h:xspan(2);
y=zeros(length(y0),length(x));
y(:,1)=y0(:);
for n=1:(length(x)-1)
    k1=feval(dyfun,x(n),y(:,n));
    k2=feval(dyfun,x(n)+h/2,y(:,n)+h/2*k1);
    k3=feval(dyfun,x(n)+h/2,y(:,n)+h/2*k2);
    k4=feval(dyfun,x(n+1),y(:,n)+h*k3);
    y(:,n+1)=y(:,n)+(h/6).*(k1+2*k2+2*k3+k4);
end  
end


