%% part 1
clear all
clc
close all
% task 1
syms t p;
[f1,f2,f3] =deal(t,sin(t),exp(20*t));
%task 2
[Fl1,Fl2,Fl3] = deal(laplace(f1,p), laplace(f2,p), laplace(f3,p));
fprintf('Laplas transform:\n');
fprintf('f(t)= %s, F(p)= %s\n',f1,Fl1);
fprintf('f(t)= %s, F(p)= %s\n',f2,Fl2);
fprintf('f(t)= %s, F(p)= %s\n',f3,Fl3);
%task 3
[Fl4,Fl5] = deal(p/(p^2+1), p);
%task 4
[f4,f5] = deal(ilaplace(Fl4,t), ilaplace(Fl5,t));
fprintf('Inverse laplas transform:\n');
fprintf('F(p)= %s, f(t)= %s\n',Fl4,f4);
fprintf('F(p)= %s, f(t)= %s\n',Fl5,f5);
%task 5
syms n w;
f6 = sin(w*n);
%task 6
Fz6 = ztrans(f6);
fprintf('Z-transform:\n');
fprintf('f(n)= %s, F(z)= %s\n',f6,Fz6);
%task 7
syms z;
Fz7 = z/(z-5);
%task 8
f7 = iztrans(Fz7);
fprintf('Inverse Z-transform:\n');
fprintf('F(z)= %s, f(n)= %s\n',Fz7,f7);
%task 9
syms X dX2 dX1 dX0 t p
fprintf('equation: x''''-3x''-4x = -4t-5, starting conditions: x(0)=-1, x''(0)=2\n');
st_c1 = -1; % x(0)
st_c2 = 2; % x'(0)
dX0 = X;
dX1 = p*X-st_c1;
dX2 = p^2*X-p*st_c1-st_c2;
eqv = dX2-3*dX1-4*dX0==laplace(4*t-5,p);
solution = solve(eqv,X);
fprintf('solution: x(t)= %s\n',ilaplace(solution,t));

%% part 2
clear all
clc
close all
%task 1
syms p w;
H=1/(p+5); 
%task 2 - 4
H_w = subs(H,p,1i*w);
frequencies = [0:0.1:100];
values = abs(subs(H_w,w,frequencies));
M = [1];
N = [1,5];
[H1, w1] = freqs(M, N);
figure(1)
subplot(2, 1, 1);
plot(w1,abs(H1))
title('Low-pass first-order filter (freqs)')
xlabel('frequencies, Hz');
ylabel('Frequency response');
subplot(2, 1, 2)
plot(frequencies,values)
title('Low-pass first-order filter (H(p))')
xlabel('frequencies, Hz');
ylabel('Frequency response');
%task 5
figure(2);
loglog(w1, abs(H1));
title('Low-pass first-order filter (log-scale)');
xlabel('frequencies');
ylabel('Frequency response');
%task 6
Y = eval(20*log10(abs(subs(H_w,w,5))/abs(subs(H_w,w,5*10))));
fprintf('The steepness of the filter for a decade: %s = %.2f decibel per decade\n',char(947),Y);
%% part 3
clear all
clc
close all
%task 1
syms p w;
H=1/((p/5)^3+2*(p/5)^2+2*(p/5)+1); 
%task 2 - 4
H_w = subs(H,p,1i*w);
frequencies = [0:0.1:100];
values = abs(subs(H_w,w,frequencies));
M = [1];
N = [1/5^3,2/5^2, 2/5,1];
[H1, w1] = freqs(M, N);
figure(1)
subplot(2, 1, 1);
plot(w1,abs(H1))
title('Low-pass third-order Butterworth filter (freqs)')
xlabel('frequencies, Hz');
ylabel('Frequency response');
xlim([0,20])
subplot(2, 1, 2)
plot(frequencies,values)
title('Low-pass third-order Butterworth filter (H(p))')
xlabel('frequencies, Hz');
ylabel('Frequency response');
xlim([0,20])
%task 5
figure(2);
%[H2, w2] = freqs(M,N);
loglog(w1, abs(H1));
title('Low-pass third-order Butterworth filter (log-scale)');
xlabel('frequencies');
ylabel('Frequency response');
%task 6
Y = eval(20*log10(abs(subs(H_w,w,5))/abs(subs(H_w,w,5*10))));
fprintf('The steepness of the third-order Butterworth filter for a decade: %s = %.2f decibel per decade\n',char(947),Y);