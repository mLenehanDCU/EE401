% mainline script to drive "ISR" function
% to simulate real-time implementation of
% a digital filter.
% ronan.scaife@dcu.ie
% 16 October 2015.
% Modified by Michael Lenehan 2018

function out = rtmain(signal, fs);

global NA;
global NB;
global A;
global B;
global xhist;
global yhist;

% set up coefficients of filter:
% initially set up FIR:
A = [1 0];  

% y[n] = x[n] - 0.99*x[n-1]
% B = [1 -0.9999];

% y[n] = x[n] + x[n-1] + x[n-2] ... +x[n-9]
B = 0.1*[1 1 1 1 1 1 1 1 1 1];

NA = length(A);
NB = length(B);

% set up storage for "memory" of x[n] and y[n]:
xhist = zeros(1, length(B));
yhist = zeros(1, length(A));

% read in samples:
nsamp = length(signal);

% create time axis for plotting x[n] and y[n]:
t = (1/fs).*[0:nsamp-1];

% create array to store samples of output:
out = zeros(1,nsamp);

% call dcu_FIR one sample at a time
for iii = 1:(nsamp-1),
    out(iii) = dcu_FIR(signal(iii));
  end
 
 plot(t,out);   
end