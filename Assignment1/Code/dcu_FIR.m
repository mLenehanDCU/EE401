% function to simulate Direct Form I
% FIR.
% function updates output of FIR filter by 
% one sample period each time it is called.
% This example can be extended to simulate an
% IIR filter.
% Ronan Scaife, 16 October, 2015
% Modified by Michael Lenehan 2018

function outp = dcu_FIR(inp);
    global NA;
    global NB;
    global A;
    global B;
    global xhist;
    global yhist;
  
% "write" sample to "D/A"
    outp = yhist(1);
% "read" sample from "A/D"
    xhist(1) = inp; 
 
    accout = 0;
% calculate new output:
    for jj = 1:NB,
           accout = accout + B(jj)*xhist(jj);
     end

    yhist(1) = accout; 
    % shift xhist 1 sample down: how many passes?
    for jj = (NB):(-1):2,
        xhist(jj) = xhist(jj-1);
     end
    % yhist(1) now contains the value of y[n] to
    % be output next time.
end

