% drp.m
% this script calculates the transfer
% function for a distributed relaxation 
% process (drp);  the drp transfer 
% function is the sum of n first order 
% relaxation processes operating in
% parallel, each having its own time
% constant tc and weight wt; lphp is 
% the process flag:  each process will
% be low-pass if lphp=0 and high-pass 
% if lphp=1; results are stored in 
% drpnum and drpden
%
if lphp==1,
   wt = tc .^ (-k);
end,
if lphp==0,
   wt = tc .^ (k);
end,
num1 = [ 0 ];
den1 = [ 1 ];
for i = 1:n;
   if lphp==0, 
      G = wt(i);
      num2=[G]; 
   end,
   if lphp==1, 
      G = tc(i) * wt(i);
      num2=[G 0]; 
   end,
   den2 = [tc(i) 1];
   [drpnum,drpden] = parallel(num1,den1,num2,den2);
   num1 = drpnum;
   den1 = drpden;
end,
dlogt = (abs(logtmin) + abs(logtmax)) / (n - 1);
gamfac = 1 / (gamma(k) * gamma(1-k));
drpnum = drpnum * dlogt * gamfac;
bode(drpnum,drpden)


