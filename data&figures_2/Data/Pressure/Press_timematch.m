clear
clc
load('Press_corrected.mat');

time = Press_cor.Kall.time;
press = Press_cor.Kall.press;
TT = timetable(time,press);
dt = minutes(10);
TT2 = retime(TT,'regular','linear','TimeStep',dt);
clear time
clear press 
time = TT2.time;
press = TT2{:,1};
TT3 = timetable(time,press);
dt = seconds(20);
TT4 = retime(TT3,'regular','linear','TimeStep',dt);
clear time
clear press
time = TT4.time;
press = TT4{:,1};

time_c = time(2:30:end);
press_c = press(2:30:end);
plot(time_c,press_c);
