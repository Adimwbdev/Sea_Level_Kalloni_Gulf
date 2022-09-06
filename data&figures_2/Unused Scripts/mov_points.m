function [Y] = mov_points(X,L);



plot(X)

[x1,y1] = ginput(2);


J1 = ceil(x1(1));
J2 = floor(x1(2));
J = [J1(1):J2(end)];

rm = movmean(X,L);

X(J1:J2,:)= rm(J1:J2);

gap = X(x1:x2,:);

plot(gap)
