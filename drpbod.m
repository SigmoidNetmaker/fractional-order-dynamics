% drpbod.m
% this script provides frequency response
% data files using distributed relaxation
% process transfer functions constructed
% with drp; w is a vector of frequencies
% in rad/sec which is set in drpset;
% mg and ph are the magnitude and phase
% vectors of the frequency response, 
% lmg is log10(mg)
%

[mg,ph,w] = bode(drpnum,drpden,w);
lmg = log10(mg);



