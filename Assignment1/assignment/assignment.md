---
title: Assignment
authors: Michael Lenehan
left-header: EE401 DSP - Digital Filters & DFT
right-header: \today
---

# Results

## Part A

The following figure shows the first $200$ samples of and $800Hz$ sine wave, with a
sampling period of $50\mu s$.

\begin{figure}[H]
\includegraphics{images/parta.jpg}
\centering
\caption{Sampled 800Hz Sine Wave}
\label{}
\end{figure}

## Part B

The zero frequency of the DFT is the average of the DFT, which, as output by
Part b of the EE401AssignmentCode is 1.0. 

\begin{figure}[H]
\includegraphics{images/partb.jpg}
\centering
\caption{Modulus DFT of 800Hz Sine Wave}
\label{}
\end{figure}

## Part C

As shown in the Normalised frequency graph, the peaks occur at $F=0.32$ and
$F=7.68$.

## Part D

Two peaks are present in the graph as one represents the positive frequency
portion, and one represents the negative frequency portion.

## Part E

At a signal of 800Hz, a single peak may be achieved by using half of the
original sampling frequency, therefore giving a signal of
$sin(2*pi*8*\frac{1/fs}{2})$.

## Part F

The following figure displays the modulus DFT plot of the modified signal from
Part E:

\begin{figure}[H]
\includegraphics{images/partf.jpg}
\centering
\caption{Modulus DFT of modified 800Hz Sine Wave Signal}
\label{}
\end{figure}


## Part G

The following figure is of a sampled 771Hz Sine Wave:

\begin{figure}[H]
\includegraphics{images/partg.jpg}
\centering
\caption{Sampled 771Hz Sine Wave}
\label{}
\end{figure}

## Part H
The following figure is of the Modulus DFT of the 771Hz Sine Wave:

\begin{figure}[H]
\includegraphics{images/parth.jpg}
\centering
\caption{Modulus DFT of 771Hz Sine Wave}
\label{}
\end{figure}

The spectral peaks are broader in Figure 5 than in Figure 2 due to spectral
leakage occurring. Spectral leakage occurs when there is a non-whole number of
cycles in the sample signal. This leads to broadening spectral peaks as
frequencies between the bins of the DFT are spread across the spectrum.

## Part I 

The following calculations were input to MATLAB in order to implement the
required 2-pole, 2-zero filter:

$fs = 20000$

$fstop = 10000$

$fc = 2950$

$fb = 60$

$\Omega_0 = 2\pi(\frac{2950}{20000})$

$\Delta\Omega = 2\pi(\frac{60}{20000})$

$Stop Band = 2\pi(\frac{10000}{20000})$

$R = 1-0.5\Delta\Omega$

$\therefore Poles \approx 0.991e^{\pm j\Omega_0}$

$\therefore Zeroes = e^{\pm jStopBand}$

The transfer function of the filter is therefore as follows:

$H(z) = \frac{z+e^{\pm jStopBand}}{z-Re^{\pm j\Omega_0}}$

## Part J

The following figure is of the frequency response of the filter designed in Part
I.

\begin{figure}[H]
\includegraphics{images/partj.jpg}
\centering
\caption{Frequency Response to Filter}
\label{}
\end{figure}

## Part K

The following figure displays the sampled combination of the 200Hz and 2975Hz
sine waves:

\begin{figure}[H]
\includegraphics{images/partk.jpg}
\centering
\caption{Sampled Output Sine Wave from combination of 200Hz and 2975Hz Sine
Waves}
\label{}
\end{figure}

## Part L

The following figure is of the modulus DFT of the sampled sine wave:

\begin{figure}[H]
\includegraphics{images/partl.jpg}
\centering
\caption{Modulus DFT of the Sampled Sine Wave}
\label{}
\end{figure}

## Part M

The code required to pass the signal described in Part K is passed through the
filter designed in Part I may be found in the EE401AssignmentCode.

## Part N

The resulting output from the filtering of the Signal described in Part K may be
seen in the figure below:

\begin{figure}[H]
\includegraphics{images/partn.jpg}
\centering
\caption{Filtered Sine Wave Signal}
\label{}
\end{figure}

## Part O

The figure below displays the modulus of the DFT of the filtered signal in Part
N, 

\begin{figure}[H]
\includegraphics{images/parto.jpg}
\centering
\caption{Modulus DFT of Sampled Sine Wave}
\label{}
\end{figure}

## Part P and Q

Unfortunately a solution to part p and part q could not be achieved. The signal
from part k was passed into the function and filtered in the FIR filter, however
an IIR filter could not be made by modifying the code.

\begin{figure}[H]
\includegraphics{images/partq.jpg}
\centering
\caption{Filtered Sine Wave Signal}
\label{}
\end{figure}

