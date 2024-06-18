clc
clear all
close all
m = 15+3;
n = 5+4;
T = m+n;
dt = 0.01;
dw = 2*pi/T;
Omega = pi/dt;
t = 0:dt:T-dt;
w = 0:dw:(2*Omega-dw);
a = 1;
t0 = 0;
%f = a*exp((-t-t0).^2);
Ln = t>=m&t<=(m+n);
subf = zeros(1,length(t));
f = n*Ln;
P = fftshift(fft(f));
for n=1:length(t)
    summa = 0;
    for k=1:length(f)
        summa = summa + f(k).*exp(1i.*n.*k.*2.*pi./(length(t)));
    end
    Pdef(n)=dt*summa/(sqrt(2*pi));
end
Pdef = fftshift(Pdef);
A = ones(length(w),length(t));
for n=1:length(w)
    for k=1:length(t)
        A(n,k)=exp(-2*pi*1i*(n-1)*(k-1)/length(w));
    end
end
Pmath = A*f';
Pmath = fftshift(Pmath);

Panal = (9.*exp(-1i.*w).*(exp(27)-exp(18)))./(1i.*w.*sqrt(2*pi));
Panal = fftshift(Panal);
figure('Name','ft')
set(gcf, 'Position', [100, 100, 1920-200, 1080-200])
subplot(2,4,[1 2 5 6])
plot(t,f)
title('f(t)')
xlabel('t')

subplot(2,4,3)
plot(w,real(P)*dt./sqrt(2*pi))
title('fft')
xlabel('w')

subplot(2,4,4)
plot(w,real(Pdef))
title('dft')
xlabel('w')

subplot(2,4,7)
plot(w,real(Pmath')*dt./sqrt(2*pi))
title('mdft')
xlabel('w')

subplot(2,4,8)
plot(w,real(Panal))
title('analytically')
xlabel('w')

figure('Name','power ft')
set(gcf, 'Position', [0+100, 0+100, 1920-200, 1080-200]) % [положение_x, положение_y, ширина, высота]
subplot(2,4,[1 2 5 6])
plot(t,abs(f).^2/length(t))
title('f(t) power')

subplot(2,4,3)
plot(w,abs((real(P)*dt./sqrt(2*pi)).^2/length(t)))
title('fft power')

subplot(2,4,4)
plot(w,abs((real(Pdef)).^2/length(t)))
title('dft power')

subplot(2,4,7)
plot(w,abs((real(Pmath')*dt./sqrt(2*pi)).^2/length(t)))
title('mdft power')

subplot(2,4,8)
plot(w,abs((real(Panal)).^2/length(t)))
title('analytically')

