% drpset.m
% this script sets up the distributed
% relaxation process simulation (drp);  
% drp sums the outputs of n first order 
% relaxation processes, each having its
% own time constant tc and weight wt;
% flag lphp will be set to 0 for all 
% low pass processors and to 1 for 
% all high  pass processors
%
n = 10;
lphp = 1;
k = 0.10;
logtmin = -4;
logtmax = 4;
tc = logspace(logtmin,logtmax,n);
hz = logspace(-5,5,100)';
w = hz * (2 * pi);






