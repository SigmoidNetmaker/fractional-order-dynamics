% drppdf.m
% this script produces the probability
% density function of processes in a
% distributed relaxation process,
% according to their time constants
% (tc) and the value of k
%
pdtc = (1 ./ tc) .^ (k-2);
plot(tc,pdtc);
