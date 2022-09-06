function [Y] = despike_n(X, L, nstd, plotflag)
%
% usage [Y] = despike_n(X, L, nstd)
% This routine reads the vector X, and for L-long segments estimates
% mean and standard deviation, and excludes X values that are not within
% the mean value + or - nstd standard deviations
%
% Zervakis & Kakagianniz, Mytilene, October 2005

% warning off MATLAB:divideByZero
n = length(X);
Y = X;
% for i = 1+L/2:floor(L/2):n-1-L/2
 for  i = 1+L/2:L:n-1-L/2
    XX = X(i-L/2:i-1+L/2);
    YY = XX;
    Xmean = nanmean(XX);
    Xstd = nanstd(XX);
    YY(XX > Xmean+Xstd*nstd) = nan;
    YY(XX < Xmean-Xstd*nstd) = nan;
%     Xmean = nanmean(XX);
%     Xstd = nanstd(XX);
%     YY(XX > Xmean+Xstd*nstd) = Xmean;
%     YY(XX < Xmean-Xstd*nstd) = Xmean;
    Y(i-L/2:i-1+L/2) = YY;
end
if plotflag==1
    
plot(X,'g')
hold on
plot(Y,'r')
end