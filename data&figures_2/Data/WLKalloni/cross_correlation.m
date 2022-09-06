
T = readtable('RV vs YC 2013.csv');

X=T(:,1);
Y=T(:,2);

   if istable(X), X=table2array(X); end
   if istable(Y), Y=table2array(Y); end   

   
Z=50
   
crosscorr(X,Y,Z)
% crosscorr(X,Y); % Len= 2*N-1
% plot(y)



%[c,lags] = xcorr(X,Y);
% stem(lags,c)