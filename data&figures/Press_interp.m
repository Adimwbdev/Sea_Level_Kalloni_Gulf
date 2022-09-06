clear
clc
load('desp_press.mat');
% press = Kall.press; 
% time = Kall.time;
press= desp.press';
time = desp.time;
% press = rmmissing(press);
% time = rmmissing(time);
TT = timetable(time,press);
dt = minutes(10);
TT2 = retime(TT,'regular','linear','TimeStep',dt);
clear time
clear press 
time = TT2.time;
press = TT2{:,1};
% time_c = time(2:30:end);
% press_c = press(2:30:end);
plot(time,press);
