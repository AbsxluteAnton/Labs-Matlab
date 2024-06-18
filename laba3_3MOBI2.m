clc
clear all
close all

f1 = 5000; 
Fs1 = 11000; 
t1 = 0:1/Fs1:0.01; 
x1 = sin(2*pi*f1*t1);

Fs2 = 25000; 
t2 = 0:1/Fs2:0.01;
x2 = sin(2*pi*f1*t2);

figure(1)
N1 = length(x1);
Y1 = fft(x1)*(1/(Fs1*sqrt(2*pi)));
P1 = abs(Y1).^2/N1;
frequencies1 = linspace(0, Fs1, N1);
subplot(3,1,1)
plot(frequencies1, P1);
title('Power Spectrum of x1 (no)');
xlabel('Frequency (Hz)');
ylabel('Power');
subplot(3,1,2)
plot(frequencies1, Y1);
title('Spectrum of x1 (no)');
xlabel('Frequency (Hz)');
ylabel('Spectre');
subplot(3,1,3)
plot(t1,x1);
title('x1 (no)');
xlabel('t');
ylabel('Signal');
set(gcf, 'Position', [100, 100, 900, 800])

figure(2)
N2 = length(x2);
Y2 = fft(x2)*(1/(Fs2*sqrt(2*pi)));
P2 = abs(Y2).^2/N2;
frequencies2 = linspace(0, Fs2, N2);
subplot(3,1,1)
plot(frequencies2, P2);
title('Power Spectrum of x2 (yes)');
xlabel('Frequency (Hz)');
ylabel('Power');
subplot(3,1,2)
plot(frequencies2, Y2);
title('Spectrum of x2 (yes)');
xlabel('Frequency (Hz)');
ylabel('Spectre');
subplot(3,1,3)
plot(t2,x2);
title('x2 (yes)');
xlabel('t');
ylabel('Signal');
set(gcf, 'Position', [1000, 100, 900, 800])