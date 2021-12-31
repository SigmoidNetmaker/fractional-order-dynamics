% drps.m
% this script simulates a distributed
% relaxation process; drp sums the
% outputs of n first order relaxation
% processes, each weighted by tc^(k-1),
% where tc is the time constant of each
% process and k defines the distribution;
% lphp is the process flag:  each process 
% will be low-pass if lphp=0 and high-pass
% of lphp=1; DR is the driving stimulus, 
% TM is time axis; DRP stores output; all
% vectors must be columns; 
% for an example DR try a step:
 DR = zeros(1000,1); DR(10:end) = 1; 
% here is a timebase to go with it 
 TM = linspace(0,10,1000);
%
[p,q] = size(DR);
irp = zeros(p,1);
DRP = zeros(p,1);
for i = 1:n;
   G = (1/tc(i)) ^ (k-1);
   if lphp==0, num=[G]; end,
   if lphp==1, num=[G 0]; end,
   den = [tc(i) 1];
   irp = lsim(num,den,DR,TM);
   DRP = DRP + irp;
end,
DRP = DRP * (1/gamma(k));

subplot(2,1,1)
plot(DR)
subplot(2,1,2)
plot(DRP)

