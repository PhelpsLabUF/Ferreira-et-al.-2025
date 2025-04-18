clc; clear; close all; 
%% User Defined Values
%import data
filename = '2023_10_12_TD.xlsx';
rawdata = readmatrix(filename, 'Sheet', 1);
sheet_name = 'Human GABA Application';
columns = size(rawdata,2);
rows = size(rawdata,1);
t = rawdata(:, 1); %minutes

%start and end times in minutes for GABA application
starttime = 31;
endtime = 36;

%buffer time for averaging before and after min (min)
buff = 3;

%% Find Averages for GABA Application on Human Islets
%linear index vector
ind = 1:length(t);

%find indices of start and end time
startdiff = abs(t - starttime);
enddiff = abs(t-endtime);

minstart = min(startdiff);
starttime_idx = ind(startdiff == minstart);

minend = min(enddiff);
endtime_idx = ind(enddiff == minend);

%15s in indices
fifteendiff = abs(t - 0.25);
min15s = min(fifteendiff);
fifteen_idx = ind(min15s == fifteendiff);

pre = [];
dur = [];
post = [];
mins = [];

for i = 2:columns
    data = rawdata(:,i);
    
    %find min
    durdata = data(starttime_idx:endtime_idx);
    minv = min(durdata);
    minidx = find(durdata == minv);
    minidx = starttime_idx + minidx;

    %min range
    min1 = minidx - fifteen_idx;
    min2 = minidx + fifteen_idx;

    %pre idx
    pre1 = minidx - fifteen_idx*(buff*4+1);
    pre2 = pre1 + fifteen_idx*2;

    %post idx
    post2 = minidx + fifteen_idx*(buff*4+1);
    post1 = post2 - fifteen_idx*2;
    
    %finding values
    pre(i-1) = mean(data(pre1:pre2));
    dur(i-1) = mean(data(min1:min2));
    post(i-1) = mean(data(post1:post2));
    mins(i-1) = t(minidx);
end

%outputs
titles = ["Pre-GABA Avg", "During-GABA Avg", "Post-GABA Avg", "Min Time (min)"];
outputs = table(pre', dur', post', mins', VariableNames=titles);
%% Outputs

%write to spreadsheet
filename = [filename(1:length(filename)-5), '_GABA_App_Avgs', '.xlsx'];
writetable(outputs,filename,'Sheet',sheet_name, 'WriteMode', 'append');
    