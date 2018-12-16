clc
clear all

mkdir ~/Documents/Michael/ECE/ECE4/EE401/Assignment1/Code
cd ~/Documents/Michael/ECE/ECE4/EE401/Assignment1/Code

%% Part a

f = 800;
N = 200;
ts = 50e-6;
fs = 1/ts;
Ts = 1/fs;
w = 2*pi*f;
t=Ts*[0:N-1];
y = sin(w*t);
figure(1)
stem(t,y);
title('Sampled 800Hz Sine Wave');
axis([0 0.0101 -1.2 1.2])
xlabel('time')
ylabel('sin(wt)')
hgsave(figure(1), 'Parta');

%% Part b

fn = f/(fs);
fNorm = fn*[0:N-1];
dft = fft(y);
mean(abs(dft))
figure(2)
stem(fNorm,abs(dft))
title('Magnitude DFT')
axis([0 8 0 110])
xlabel('Normalised Frequency')
ylabel('|DFT(sin(wt))|')
hgsave(figure(2), 'Partb');

%% Part e

fn = f/(fs/2);
fNorm = fn*[0:N-1];
dft = fft(y);
mean(abs(dft))

%% Part f

figure(2)
stem(fNorm,abs(dft))
title('Magnitude DFT')
axis([0 8 0 110])
xlabel('Normalised Frequency')
ylabel('|DFT(sin(wt))|')
hgsave(figure(2), 'Partb');

%% Part g

clc
clear all

f = 771;
N = 200;
ts = 50e-6;
fs = 1/ts;
Ts = 1/fs;
w = 2*pi*f;
t=Ts*[0:N-1];
y = sin(w*t);
figure(3)
stem(t,y);
title('Sampled 771Hz Sine Wave');
axis([0 0.0101 -1.2 1.2])
xlabel('time')
ylabel('sin(wt)')
hgsave(figure(3), 'Partg');

%% Part h

fn = f/fs;
fNorm = fn*[0:N-1];
dft = fft(y);
figure(4)
stem(fNorm,abs(dft));
title('Magnitude DFT')
axis([0 8 0 90])
xlabel('Normalised Frequency')
ylabel('|DFT(sin(wt))|')
hgsave(figure(4), 'Parth');

%% Part k

clc
clear all

f1 = 200;
f2 = 2975;
N = 200;
ts = 0.001;
fs = 200/ts;
Ts = 1/fs;
w1 = 2*pi*f1;
w2 = 2*pi*f2;
t=Ts*[0:N-1];
y = sin(w1*t)+sin(w2*t);
figure(5)
stem(t,y);
title('Sampled Combined 200Hz and 2975Hz Sine Wave');
axis([0 0.00101 -1 2])
xlabel('time')
ylabel('sin(200pi(t))+sin(2975pi(t))')
hgsave(figure(5), 'Partk');


%% Part l

fn = (f1+f2)/fs;
fNorm = fn*[0:N-1];
dft = fft(y);
figure(6)
stem(fNorm,abs(dft));
title('Magnitude DFT')
axis([-0.1 3.2 0 120])
xlabel('Normalised Frequency')
ylabel('|DFT(sin(200pi(t))+sin(2975pi(t))|')
hgsave(figure(6), 'Partl');

%% Part m

filtered = filtdem(y);
stem(t, filtered);
title('Filtered Part K Signal')
xlabel('Time')

%% Part o

stem(fNorm, fft(filtered))
title('Modulus of the Filtered Signal from Part K')
xlabel('Normalised Frequency')
ylabel('|DFT(Filtered Signal)|')

%% Part q

stem(t, rtmain(y, fs));
title('IIR Filtered Signal')