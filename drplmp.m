% function drplmp
% this function will calculate log magnitude (lmm),
% and phase (pp), as a function of angular frequency (w),
% for any transfer function given its numerator (nn), 
% and denominator (dd)
%
function [lmm,pp,w]=drplmp(nn,dd,w)
[mm,pp,w]=bode(nn,dd,w);
lmm=log10(mm);

