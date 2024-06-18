clear all
clc
close all
a=1;
f=10^6;
k=1/(100*f);
w1=2*pi*f;
w2=2*pi*(f*0.95);
period=(2*pi)/abs(w2-w1);
t=0:k:5*period;
G1=a*sin(w1*t);
G2=a*sin(w2*t);
plot(t,G1+G2)
axis("tight")
title('Биения')


