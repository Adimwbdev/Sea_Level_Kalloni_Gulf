function [Y] = despike_g(X, L, nstd)
%
% usage [Y] = despike_g(X, L, nstd)
% This routine reads the vector X, and for L-long segments estimates
% mean and standard deviation, and excludes X values that are not within
% the mean value + or - nstd standard deviations
%
% Zervakis & Kakagianniz, Mytilene, October 2005

% warning off MATLAB:divideByZero
n = length(X);
Y = zeros(1,n);
for i = 1:n
    Y(i) = NaN;
end
for i = 1+L/2:n-(1+L/2)
    XX = X(i-L/2:i-1+L/2);
    Xmean = nanmean(XX);
         Xstd = nanstd(XX);
    for j = 1:L
       if (XX(j) > Xmean+Xstd*nstd) 
           XX(j) = Xmean;
       end
       if (XX(j) < Xmean-Xstd*nstd)
           XX(j) = Xmean;
       end
       Y(i+L/2-1) = XX(j);
    end
end
