clear all
clc
close all
f1=1;
f2=0.1;
period=1/f2;
m1=0.5;
m2=1;
a=1; 
t=0:0.001:3*period;
ym=a*sin(2*pi*f2*t);
ymn=max(ym);
ymc1=a.*(1+m1.*(ym./ymn)).*sin(2.*pi.*f1.*t);
ymc2=a.*(1+m2.*(ym./ymn)).*sin(2.*pi.*f1.*t);

subplot(1,2,1)
plot(t,ymc1)
legend('m=0.5')
title('Амплитудная модуляция')
subplot(1,2,2)
plot(t,ymc2)
legend('m=1')
title('Амплитудная модуляция')

