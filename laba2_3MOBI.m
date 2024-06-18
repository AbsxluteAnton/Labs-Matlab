clear all
clc
close all
t=0:1/10:20;
f=1;
a=1;
m=-0.7;
syms x 
ym = @(x) rectangularPulse(6,14,x);  
funk = rectangularPulse(6,14,x);
%funk = sin(0.5*x);
%funk1 = sin(0.5*t);
ym1 = rectangularPulse(6,14,t); 
Ph=[];
yc=a*sin(2*pi*f*t);
for i=1:length(t)
    %Ph(i) = 2*pi*f*(t(i)+m*(integral(ym,0,t(i)))); %s 2012 
    %Ph(i) = 2*pi*f*(t(i)+m*(vpaintegral(funk,0,t(i)))); %s 2017
    Ph(i) = 2*pi*f*(t(i)+m*(int(funk,0,t(i)))); %do 2006
end
ycm = a*sin(Ph);
plot(t,ycm,t,ym1);
%plot(t,ycm,t,funk1);
title('Частотная модуляция, глубина ',m)
