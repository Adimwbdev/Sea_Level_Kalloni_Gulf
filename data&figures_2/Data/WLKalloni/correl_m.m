% function R = correl(x, y, N)
%
% Usage R = correl(x, y, N)
% This function estimates the lagged cross-correlation of the two vectors 
% x and y, using a maximum lag of length N.
% The correlation coeffiecient R is given from a lag -N measurements to a lag of +N measurements.
% when the length of x and y is greater than N, the correlation is
% computed from the mean of the lagged correlations of the N-long parts.
% Author: ������� �������� <������� ��������@VASSILISMICRO>
% Created: 2009-05-06

function [ R ] = correl_m(x, y, N)

if (length(x) ~= length(y)), 
  message = ' ERROR: The two time series are of unequal lengths '
  return  
end
M = length(x);
if (M < N) ,
  message = ' ERROR: The time series are shorter than the lag '
  return  
end
R = zeros(2*N+1,1)*nan;
for i = -N:1:N,
    A =  corrcoef(x(N+1:M-N),y(N+1+i:M-N+i));
   R(i+N+1) = A(1,2);
end
return
