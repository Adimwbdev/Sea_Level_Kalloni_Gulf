function [Y] = despike0(X, Xmin, Xmax)
%
% usage [Y] = despike0(X, Xmin, Xmax)
% This routine reads the vector X, and creates the same vector Y, having
% rejected values that are larger than Xmax and smaller than Xmin
%
% Zervakis & Kokkini, Mytilene, November 2005

warning off MATLAB:divideByZero
n = length(X);
Y = X;
Y(find(X>Xmax))=NaN;
Y(find(X<Xmin))=NaN;
end
