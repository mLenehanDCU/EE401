% script to illustrate creation of bandpass IIR filter 
% and using it to filter a signal.
% works both on Octave and on Matlab
% R. Scaife, DCU, 18/09/2015
% Modified by Michael Lenehan 15/12/2018

function out = filtdem(signal)
% # of samples
Nt = 500; 
% samples to plot
Nrng = [1:50];
% sampling rate s/s
fs = 20000;	
% sampling period
Ts = 1/fs;	
% centre freq, Hz
fc = 2950;
% bandwidth Hz
fb = 60;
% stop band Hz
fstop = 10000;
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
%
w0 = 2*pi*(fc/fs);
dw = 2*pi*(fb/fs);
sb = 2*pi*(fstop/fs);
R = 1-0.5*dw;
poles = R*exp(j*w0);
zeros = exp(j*sb);

% create transfer function
[p_butt, z_butt, k_butt] = butter(1, [2*pi*fln, 2*pi*fun], 'bandpass')
Hz = zpk(z_butt, p_butt, k_butt)
% calc freq response
figure(1)
[Hw, W] = freqz(p_butt, z_butt, 250); 	
% plot magn response
plot(W, abs(Hw));

out = filter(p_butt, z_butt, signal);

end