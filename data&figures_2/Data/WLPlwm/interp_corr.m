
load('raw_corrected_WLPlwm.mat');
load('Interp_WLPlwm.mat');
level1 = rawc_WLPlwm.level;
time1 = rawc_WLPlwm.time;
level2 = inter.WLPlwm.level;
time2 = inter.WLPlwm.level;

idx = find(isnan(level1));
R =   diff(idx);

for i = 1:length(idx)-1
    if R(i)~= 1;
       point1 = time1((idx(i)+1));
       point2 = time1((idx(i)+R(i)-1));
       idx1 = knnsearch(datenum(time2),datenum(point1));
       idx2 = knnsearch(datenum(time2),datenum(point2));
       level2(idx1:idx2)~=nan;
    else
        if R(i) == 1;
            level2(idx(i))=nan;
        end
    end
end

        


        