function [Y] = despike2(X, L, nstd)
%
% usage [Y] = despike2(X, L, nstd)
% This routine reads the vector X, and for two (L/2)-long segments estimates
% mean and standard deviation for each, and excludes X values that are not within
% the two mean values + or - the respective nstd standard deviations
% L has to be an even number
%
% Zervakis & Kokkini, Mytilene, November 2005

warning off MATLAB:divideByZero
n = length(X);
Y = zeros(1,n);
for i = 1:n;
    Y(i) = NaN;
end
for i = 1+L/2:n-(1+L/2);
    XX1 = X(i-L/2:i-1);
    [X1mean, X1std] = tmean(XX1);
    XX2 = X(i+1:i+L/2);
    [X2mean, X2std] = tmean(XX2);
    if X1mean < X2mean, 
        if X(i) < X2mean+nstd*X2std,
            if X(i) >= X1mean-nstd*X1std,
                Y(i) = X(i);
            end
        end
    end
    if X1mean >= X2mean, 
        if X(i) >= X2mean-nstd*X2std,
            if X(i) < X1mean+nstd*X1std,
                Y(i) = X(i);
            end
        end
    end
end
