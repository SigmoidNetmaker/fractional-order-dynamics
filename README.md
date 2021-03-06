# fractional-order-dynamics

MATLAB code for approximating fractional-order operators using many integer-order operators in parallel. 

The original purpose of the code was to simulate the behavior of neurons in the brain (specifically in the brainstem) that control the movements of the eyes. These simulations are described in the following journal article:

Anastasio TJ. The fractional-order dynamics of brainstem vestibulo-oculomotor neurons. Biological cybernetics. 1994 Nov;72(1):69-79.

Included in that article is some mathematical development, for which I acknowledge the contributions of Ehtibar Dzhafarov.        

This code dates back to the 1990s when MATLAB coding conventions were different, but all mfiles work fine on MATLAB version R2019b.        

All of the code takes the form of MATLAB mfiles. The principle set of mfiles has the letters "drp" in the filename, which denotes "distributed relaxation process". 

Here is a list of the drp mfiles and what they do. 

drpset.m -- sets up many of the other drp mfiles and so must be run before them                    
drp.m    -- calculates the transfer function (tf) for a distributed relaxation process (drp)                
drpbod.m -- provides the magnitude and phase vectors for tfs constructed using drp     
drplmp.m -- just calculates log magnitude and phase as function of frequency for any tf            
drpls.m  -- finds the time domain response of a drp composed of parallel low-pass tfs                   
drps.m   -- finds the time domain response of a drp composed of low- or high-pass tfs              
drppdf.m -- produces the probability density function of processes in a drp                     

drphpf.m -- fits a tf of form H(s) = gn * (tv * s / (tv * s + 1)) * s^k to frequency response data              
drphpd.m -- finds difference between frequency response data and estimates based on above tf       

drplpf.m -- fits a tf of form H(s) = gn * (1 / (te * s + 1)) * s^k to frequency response data                      
drplpd.m -- finds difference between frequency response data and estimates based on above tf

drpltf.m -- fits a tf of form H(s) = gn * (te * s + 1) * s^k to frequency response data              
drpltd.m -- finds difference between frequency response data and estimates based on above tf               

drpmsl.m -- finds mse between frequency response data and tf of form H(s) = gn * (1 / (te * s + 1)) * s^k            
drpmsr.m -- finds mse between phase, r and k parameters and tf of form H(s) = gn * (te * s + 1) * s^k               
drprkt.m -- finds magnitude, phase, and coefficients r and k for any tf                                                       

