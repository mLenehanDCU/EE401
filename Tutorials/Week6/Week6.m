%% Week6 Tutorial -- Setup

clc
clear all

mkdir ~/Documents/Michael/ECE/ECE4/EE401/Tutorials/Week6

cd ~/Documents/Michael/ECE/ECE4/EE401/Tutorials/Week6

diary 'Week6TutorialDiary.txt'

%% 

diary on

xx = [1 -0.2 0.4 -0.1 0.5 -0.7];
stem(xx);
axis([-1 7 -1.5 1.5]);
XXf = fft(xx);
stem((0:5), abs(XXf));
axis([-1 6 0 4]);

diary off

%% 

diary on

x = 0;
for i1 = 1:1000, x = [x xx]; end
stem(x(1:45));
x1 = x(2:257);
stem(x1);
X1f = fft(x1);
X1db = 20*log(abs(X1f));
subplot(411);
plot(X1db);
xlabel('20log(abs(fft(x1[n]))) N=256; note spectral leakage');

x2 = x(2:253);
X2f = fft(x2);
X2db = 20*log(abs(X2f)+eps);
subplot(412);
stem(X2db);
xlabel('20log(fftx2[n]) N=252; note No spectral leakage');
axis([0 300 -10 100]);

diary off

%% 

diary on

num = [1 0 0 0 0 0 -1];
den = [1 0 0 0 0 0 0];
y = filter(num, den, x2);
subplot(413);
plot(x2);
xlabel('x2[n]');
subplot(414);
plot(y);
xlabel('y[n]');

diary off