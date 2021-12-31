% this script fits the a transfer function of
% form H(s) = gn * (1 / (te*s + 1)) * s^k
% to frequency response data; fhz is the 
% frequency vector in Hz, mvd and pvd are 
% vectors of the magnitude and phase of the 
% frequency response data; gn, te, and kf are 
% estimates of the gain, dominant time constant, 
% and fractional differentiator exponent, and 
% mve and pve are estimated magnitude and phase 
% based on the fitted function
%

gn=1;te=5.0;kf=0;
prams=[gn,te,kf];
fhz=fr./(2*pi);
frl=logspace(log10(0.07),log10(2.5));
fhzl=frl./(2*pi);
pvdr=pvd*((2*pi)/360);
red=mvd.*(cos(pvdr));
imd=mvd.*(sin(pvdr));
prams=leastsq('drplpd',prams,[],[],fr,red,imd);
gn=prams(1);te=prams(2);kf=prams(3);
mtve=(sqrt((frl*te).^2 + 1)).^(-1);
ptve=atan(-(frl*te));
mkfe=frl.^kf;
pkfe=ones(n,1)*(kf*pi/2);
mve=(mtve.*mkfe)*gn;
pver=ptve+pkfe; 
pve=pver*(360/(2*pi));
subplot(211)
loglog(fhz,mvd,'o',fhzl,mve);semilogx(fhz,pvd,'o',fhzl,pve);
