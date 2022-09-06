clear
clc
load('data1.mat');
level = data1.Plwm.level;
time = data1.Plwm.time;
level = rmmissing(level);
time = rmmissing(time);
TT = timetable(time,level);
dt = seconds(20);
TT2 = retime(TT,'regular','linear','TimeStep',dt);
clear time
clear level 
time = TT2.time;
level = TT2{:,1};
time_c = time(2:30:end);
level_c = level(2:30:end);
plot(time_c,level_c);
