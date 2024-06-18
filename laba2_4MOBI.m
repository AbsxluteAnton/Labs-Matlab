clear all
clc
close all
dt = 1/100;
tau = 1;
N = 40;
endl = tau*N;
t=0:dt:endl; 
f = 0.02;
A = 1;
D = tau/(2*pi);
m = 0.5;
yc = sign(sin(10*t/(pi*tau)))>0;
ym = A*sin(2*pi*f*t);
%ym = cos(0.4*t).*sin(10*t/6)-sin(3*t/10);
maxv = max(abs((ym)));
s=[];
array_tau=[];
ycm=[];
for i=0:(2*tau):(endl-2*tau)
    s(end+1) = A*sin(2*pi*f*i);
    tau_len = tau+m*(1+(A*sin(2*pi*f*i))/maxv);
    array_tau(end+1)=tau_len;
    if i==0
        x=0:dt:(2*tau);
    else
        x=(dt):dt:(2*tau);
    end
    int = sign(sin(10*x/(pi*tau_len)))>0;
    
    int = double(int);
    
    ycm = [ycm, int];
end
subplot(3,3,1:3)
plot(t,ym);
title('info')
subplot(3,3,4:6)
plot(t,yc);
title('carry')
subplot(3,3,7:9)
plot(t,ym,t,ycm);



