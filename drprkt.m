% function drprkt
% function [lmm,pp,rr,kk,tt,w]=drprkt(nn,dd,w)
% this function will calculate magnitude (mm),
% phase (pp), coefficients r (rr), k (kk), and 
% t (tt), as a function of angular frequency (w),
% based on a first-order approximation for
% motoneuron dynamics, for any transfer function 
% given its numerator (nn), and denominator (dd)
%
function [lmm,pp,rr,kk,tt,w]=drprkt(nn,dd,w)
[mm,pp,w]=bode(nn,dd,w);
lmm=log10(mm);
rr=(mm .* sin(pp*(2*pi/360))) ./ w;
kk=mm .* cos(pp*(2*pi/360));
tt=(tan(pp*(2*pi/360))) ./ w;
