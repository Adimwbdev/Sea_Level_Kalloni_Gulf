clear
clc
load('raw_corrected_WLPlwm.mat');
level = rawc_WLPlwm.level'; 
time = rawc_WLPlwm.time';
level = level-mean(level);
level = level(11:10:end); %Edw krataw oti teliwnei se kai 10
time = time(11:10:end);
TT = timetable(time,level);
dt = seconds(20);
TT2 = retime(TT,'regular','linear','TimeStep',dt);
% clear time
% clear level 
time_c =TT2.time;
level_c= TT2{:,1};
itime = TT2.time;
ilevel = TT2{:,1};
idx = find(isnan(level));
itime = itime(2:30:end); %Edw krataw oti teliwnei se kai 10
ilevel = ilevel(2:30:end);
for i=1:length(idx)
    ilevel(idx(i)) = nan; %Opou eixe nan i proigoumeni xronoseira vazw kai se autin
end
plot(itime,ilevel)

