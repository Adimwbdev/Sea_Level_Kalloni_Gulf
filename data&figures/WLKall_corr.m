% clear
% clc
load('data.mat');
level = data.WLKall.level;
time = data.WLKall.time;
level = level - mean(level);
figure (1)
plot(time,level)
gap1 = level(41588:42098);
level(41588:42098) = gap1 - mean(gap1);
figure (2)
plot(time,level)
gap2 = level(42979:44131);
level(42979:44131) = gap2 - mean(gap2);
figure (3)
plot(time,level)