clc
clear


mkdir ~/Documents/Michael/ECE4/EE401/Tutorials/Week5
cd ~/Documents/Michael/ECE4/EE401/Tutorials/Week5

diary 'Week4TutorialDiary.txt'

%% Transfer Function

diary on

R = 0.9;
num = [1 0 0 0 0 0 -1];
den = [1 0 0 0 0 0 -R^6];
H_z = tf(num, den, 1)

diary off

%% Z Trasfer Function Data

diary on

[z, p, k] = zpkdata(H_z, 'v')

diary off

%% Z-Plane Pole Zero Plot

diary on

pole_H = pole(H_z);
zero_H = zero(H_z);
zplane(zero_H, pole_H);

diary off

%% Magnitude Frequency Response

diary on

[H_W, W] = freqz(num, den, 500);
plot(W, abs(H_W));

diary off

%% Impulse Response

diary on

delt = zeros(1, 50);
delt(1)= 1;
y = filter(num, den, delt);
stem((0:49), y, 'r');
axis([-2 50 -1 1.2]);
grid

diary off

%% 

diary on

Omega1 = 2*pi/16;
n = 0:15;
y = sin(Omega1*n);

figure(1)
stem(n,y);
Yf = fft(y);

figure(2)
stem(n, abs(Yf));
axis([-1 17 -10 10]);

diary off













