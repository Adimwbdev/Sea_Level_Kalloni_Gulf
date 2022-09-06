function [Y] = mov_points(X,L);



plot(X)

[x1,y1] = ginput(2);


J1 = ceil(x1(1));
J2 = floor(x1(2));
J = [J1(1):J2(end)];

rm = movmean(X,L);

X(J1:J2,:)= rm(J1:J2);
% v = L*1000;

gap = X(x1:x2,:);

% Y = interp(gap,L*10);
% z = linspace(x1,x2,n);
% 
% plot(X(x1:x2,:),'g')
% hold on
% plot(Y,'r')


