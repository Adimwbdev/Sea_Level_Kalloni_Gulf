% clear 
% clc
% Κόψε ραψε ρουτινα για να κανω τα δεδομενα του Πλωμαρίου ανθρωπινα και με το σωστο μηκος
% διανυσματος του Χρονου


% clear 
clearvars -except WaterLevelPlwmari leveln
% WaterLevelPlwmari = readtable('Water_Level_Plwmari.xlsx');

column = [2,5,8,11];

% Making time array
t1 = datetime(2020,1,1,0,0,0);
t2 = datetime(2020,12,31,23,59,0);
t = t1:minutes(1):t2;

for i=1:length(column)
%     display(i)
    
    if i==2 %Ayto ginetai giati den exei katholou nan mesa stin stili 5
        
    my_field = strcat('v',num2str(i));
    time.(my_field) = table2array(WaterLevelPlwmari(1:idx(1)-1,column(i)-1)); 
    level.(my_field) = table2array(WaterLevelPlwmari(1:idx(1)-1,column(i)));  
    else
        
    idx = find(isnan(WaterLevelPlwmari{:,column(i)}));
    my_field = strcat('v',num2str(i));
    time.(my_field) = table2array(WaterLevelPlwmari(1:idx(1)-1,column(i)-1));
    level.(my_field) = table2array(WaterLevelPlwmari(1:idx(1)-1,column(i)));
    end
end
    

levelr = [level.v1;level.v2;level.v3;level.v4];
timer = [time.v1;time.v2;time.v3;time.v4];

