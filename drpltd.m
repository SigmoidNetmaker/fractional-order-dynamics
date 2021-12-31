function E=drpltd(prams,fr,red,imd);
% function E=drpltd(prams,fr,red,imd)
% prams = [gn,te,kf];
% this function finds the difference between 
% frequency response data and estimates based 
% on a fit of the transfer function 
% H(s) = gn * (te*s + 1) * s^k;
% gn is the gain, te is dominant time constant 
% in seconds, and kf is the exponent of the
% fractional order differentiator,
% fr is frequency vector in rad/sec, and
% red and imd are vectors of the real and 
% imaginary parts of the data to be fit
%
gn=prams(1);te=prams(2);kf=prams(3);
mtve=sqrt((fr*te).^2 + 1);
ptve=atan(fr*te);
mkfe=fr.^kf;
pkfe=ones(ptve)*(kf*pi/2);
mve=(mtve.*mkfe)*gn;
pver=ptve+pkfe; 
ree=mve.*(cos(pver));
ime=mve.*(sin(pver));
E=[(ree-red)' (ime-imd)']';
