%This scripts looks at the datetime of one timeseries and compares it 
%with the datetime of the other timeseries, if they match it puts the 
%right value in the right position. Where the two timeserieas dont match
% it puts NaN

clear
load('raw_WLPlwm.table.mat');
data = WaterLevelPlwmari;

% Loading data from the table 
time1 = table2array(data(:,1));
time2 = table2array(data(:,4));
time3 = table2array(data(:,7));
time4 = table2array(data(:,10));
% timed = [time1(2:end);time2(2:end);time3(2:end);time4(2:end)];
timed = [time1;time2;time3;time4];
timer = rmmissing(timed);
level1 = table2array(data(:,2));
level2 = table2array(data(:,5));
level3 = table2array(data(:,8));
level4 = table2array(data(:,11));
% leveld = [level1(2:end);level2(2:end);level3(2:end);level4(2:end)];
leveld = [level1;level2;level3;level4];
levelr=rmmissing(leveld);
clear time1 time2 time3 time4 level1 level2 level3 level4 

% Creating the correct time array
t1=datetime(2020,1,1,0,0,0);
t2=datetime(2020,12,31,23,59,0);
t = t1:minutes(1):t2;
% t = t1:seconds(20):t2;

% Checking which dates are present in both datetime arrays 
Lia = ismember(datenum(t),datenum(timer));
idx = find(Lia==0);

% Putting NaNs in the places where the two datetime arrays didnt match
% (Where the dates were missing)
data = zeros(1,length(t));
for i = 1:length(t)
 for j = 1:length(idx)
     if i == idx(j)
         data(i) = nan;
     end
 end
end

%Putting data where the dates werent missing
newdata = zeros;
clear i j
j = 1;
for i = 1:length(data)
        if isnan(data(i))
            newdata(i) = nan;
        else
            newdata(i) = levelr(j);
            j = j+1;
        end
end

%Plotting both old and new data to see if the missing dates 
% are replaced with NaNs
plot(timed,leveld,'r'); hold on
plot(t,newdata,'b');
        
    
    
         