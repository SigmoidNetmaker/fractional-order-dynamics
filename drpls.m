% drpls.m
% this script simulates a distributed
% relaxation process; drp sums the
% outputs of n first order relaxation
% processes, each weighted by tc^(k-1),
% where tc is the time constant of each
% process and k defines the distribution;
% DR is the driving stimulus, which must
% be the derivative of any desired input;
% dt is the time step; DRP stores output;
% for an example DR try a pulse:
 DR = zeros(1000,1); DR(10) = 1;
%
dt = 0.01;
[p,q] = size(DR);
irp = zeros(1,p);
DRP = zeros(1,p);
yo = 0;
for i = 1:n;
   expo = exp(dt * (-1 / tc(i)));
   for j = 1:p;
      yn = (yo - DR(j)) * expo + DR(j);
      irp(j) = yn;
      yo=yn;
   end;
   irp = ((1/tc(i)) ^ (k-1)) * irp;
   DRP = DRP + irp;
end,
DRP = DRP * (1/gamma(k));
DRP=DRP';

subplot(2,1,1)
plot(DR)
subplot(2,1,2)
plot(DRP)




