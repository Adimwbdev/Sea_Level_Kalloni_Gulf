clear
clc
load('data_c.mat')
level1 = data_c.Plwm.level;
level1= -level1;
level2 = data_c.Kall.level;
time1 = data_c.Plwm.time;
time2 = data_c.Kall.time;

level1 = level1 - mean(level1);
level2 = level2 - mean(level2);

levelz = level1;

%%%%%%%%%%%% Xwris movmean
% cut = 3.3;
% std1 = std(level1);
% std2 = std(level2); 
% level1(level1>=cut*std1) = nan;
% level1(level1<=-cut*std1) = nan;
% level2(level2>=cut*std2) = nan;
% level2(level2<=-cut*std2) = nan;
% A = find(isnan(level1));
% B = find(isnan(level2));

%%%%%%%%%%%%%%%%%% Me movmean


level1mov = movmean(level1,10);
level2mov = movmean(level2,10);

std1 = std(level1mov);
std2 = std(level2mov);

cut = 3.3; 
level1mov(level1mov>=cut*std1) = nan;
level1mov(level1mov<=-cut*std1) = nan;
level2mov(level2mov>=cut*std2) = nan;
level2mov(level2mov<=-cut*std2) = nan;
A = find(isnan(level1mov));
B = find(isnan(level2mov));


for i = 1:length(A)
    j = A(i);
    level1(j) = nan;
end


for i = 1:length(B)
    j = B(i);
    level2(j) = nan;
end

% figure (1)
% plot(time1,level1mov,time2,level2mov)


