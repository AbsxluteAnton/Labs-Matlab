clc
clear all
close all
x = -pi:0.01:pi;
L1 = abs(x)<=pi/2;
L2 = x<-pi/2;
L3 = x>pi/2;
y1 = x;
y2 = ones(1,length(x)) .* (-pi/2);
N = 100;
a0 = -pi/2;
ak = [];
bk = [];
for k = 1:N
    ak = [ak,sin(k.*(pi/2))./k];
    bk = [bk,(-cos(k.*(pi/2)))./k+(2.*sin(k.*(pi/2)))./(k.^2*pi)];
end
for i=1:length(x)
    summa = 0;
    for k=1:N
        summa = summa + ak(k)*cos(k*x(i)) + bk(k)*sin(k*x(i));
    end
    f(i) = a0/2 + summa;
end
grafik = plot(x(L1),y1(L1),'k',x(L2),y2(L2),'k',x(L3),y2(L3),'k', x,f,'r');
grafik(1).LineWidth = 3;
grafik(2).LineWidth = 3;
grafik(3).LineWidth = 3;


