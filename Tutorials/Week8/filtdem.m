% script to illustrate creation of bandpass IIR filter 
% and using it to filter a signal.
% works both on Octave and on Matlab
% R. Scaife, DCU, 18/09/2015

clf;
clear;
% # of samples
Nt = 500; 
% samples to plot
Nrng = [1:50];
% sampling rate s/s
fs = 1000;	
% sampling period
Ts = 1/fs;	
% centre freq, Hz
fc = 220;
% bandwidth Hz
fb = 50;
% signal freqs
f1 = 40;
f2 = 210;
% signal amplitudes
a1 = 1;
a2 = 2;
% filter parameters
fl = fc - fb/2;
fu = fc + fb/2;
% normalised centre freq
fcn = fc/fs;
fln = fl/fs;
fun = fu/fs;

% create transfer function
[b_butt, a_butt] = butter(3, [2*fln, 2*fun]); 
subplot(321);
% calc freq response
[Hw, W] = freqz(b_butt, a_butt, 250); 	
% plot magn response
plot(W, abs(Hw));

% create time vector
t = Ts*[0:Nt-1];
% create input signal
x = a1*sin(2*pi*f1*t) + a2*sin(2*pi*f2*t);

% filter x using bp filter
% y = flts(x,hz);	 
y = filter(b_butt, a_butt, x);
Xw = fft(x(1:Nt));
Yw = fft(y(1:Nt));
% norm. freq. axis (scilab)
% fN = [0:((Nt/2)-1)]/Nt;
% norm. ang. freq. axis (Matlab)
wN = 2*pi*[0:((Nt/2)-1)]/Nt;
subplot(323);
% plot spec of x
stem(wN, abs(Xw(1:Nt/2)), '*r');
subplot(325);
% plot spec of y
stem(wN, abs(Yw(1:Nt/2)), 'or');

subplot(322);
plot(t(Nrng),x(Nrng),'o');
plot(t(Nrng),x(Nrng),'-r');
subplot(324);
plot(t(Nrng),y(Nrng),'o');
plot(t(Nrng),y(Nrng),'-r');