% this script computes the mean square error
% separately for log(gain) and phase between
% frequency response data and estimates based 
% on H(s) = gn * (1 / (te*s + 1)) * s^k;
% prams=[gn,te,kf] where gn is the gain, te is 
% the dominant time constant in seconds, and kf 
% is the exponent of the fractional order 
% differentiator, fr is frequency vector in rad/sec,
% and lmvd and pvd are the log(gain) and phase 
% of the frequency response data
%
gn=prams(1);te=prams(2);kf=prams(3);
mtee=(sqrt((fr*te).^2 + 1)).^(-1);
ptee=atan(-(fr*te));
mkfe=fr.^kf;
pkfe=ones(ptee)*(kf*pi/2);
mve=(mtee.*mkfe)*gn;
lmve=log10(mve);
peer=ptee+pkfe; 
pve=peer*(360/(2*pi));
elm=sum((lmve-lmvd).^2);
ep=sum((pve-pvd).^2);

