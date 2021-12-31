% this script computes the mean square error
% between phase (deg), and r and k parameters
% of frequency response data and estimates
% based on a fit of the transfer function 
% H(s) = gn * (te*s + 1) * s^k; where
% gn is the gain, te is dominant time constant 
% in seconds, and kf is the exponent of the
% fractional order differentiator,
% prams = [gn,te,kf]; fr is frequency vector
% in rad/sec, and pvd, rvd, and kvd are the 
% phase and r and k frequency response data
%
gn=prams(1);te=prams(2);kf=prams(3);
mtee=sqrt((fr*te).^2 + 1);
ptee=atan(fr*te);
mkfe=fr.^kf;
pkfe=ones(ptee)*(kf*pi/2);
mve=(mtee.*mkfe)*gn;
pver=ptee+pkfe;
pve=pver*(360/(2*pi));
rve=(mve.*(sin(pver)))./fr;
kve=mve.*(cos(pver));
ep=sum((pve-pvd).^2);
er=sum((rve-rvd).^2);
ek=sum((kve-kvd).^2);
