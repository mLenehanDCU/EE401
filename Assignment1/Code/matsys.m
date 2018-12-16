% script to illustrate system description and analysis in Matlab/Octave
% as in section 6a for Scilab.
% example is of a 6 pole notch filter:
%
% H(z)= (z^6 -1)/(z^6 -R^6 )

fs = 20000;
fc= 2950;
fb = 60;
fstop = 10000;
w0 = 2*pi*(fc/fs);
dw = 2*pi*(fb/fs);
sb = 2*pi*(fstop/fs);
Ts = 1/fs;
R = 1-0.5*dw;
Npts = 250;

z1 = exp(j*sb);
z2 = conj(z1);
p1 = R*exp(j*w0);
p2 = conj(p1);
% z^6 -1
num1 = [1 z1];
num2 = [1 z2];
% z^6 -R^6
den1 = p1;
den2 = p2;

% set sampling period = 1
H_z = tf(num1.*num2, (den1*den2)^2, Ts)

pole_H = pole(H_z)
zero_H = zero(H_z)
subplot(2,2,1);
zplane(zero_H, pole_H);

[H_W, W] = freqz(num, den, Npts);
subplot(2,2,2);
plot(W, abs(H_W));

% impulse response:
delt = zeros(1, 50);
delt(1) = 1;
y = filter(num, den, delt);
subplot(2,2,3);
% plot((0:49), y, '*r');
stem((0:49), y, 'or');
axis([-5 50 -1 1.5]);


