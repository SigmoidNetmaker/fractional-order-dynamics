% drpspa.m
% this script computes the frequency
% response of the drp; DR is the
% driving stimulus, DRP is the output
% of the drp, w are the frequencies at
% which the frequency response is 
% evaluated, and dt is the time step
%
z = [DRP DR];
w = logspace(-1,1,128);
g = spa(z,[],w,[],dt);
bodeplot(g);
