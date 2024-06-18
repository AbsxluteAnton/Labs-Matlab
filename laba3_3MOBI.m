clc 
clear all
close all
f = 5000;
fdy = 3 * f;
fdn = 0.7 * f;
ty = 0:1/fdy:1;
tn = 0:1/fdn:1;
yy = sin(2*pi*f*ty);
yn = cos(2*pi*f*tn);
dw = 2*pi;
Omegay = pi*fdy;
Omegan = pi*fdn;
wy = Omegay:dw:Omegay;
wn = Omegan:dw:Omegan;
Pn = fft(yn);
Py = fft(yy);
figure(1)
plot(ty,yy)
figure(2)
plot(tn,yn)
figure(3)
plot(wy,real(Py))
figure(4)
plot(wn,real(Pn))
