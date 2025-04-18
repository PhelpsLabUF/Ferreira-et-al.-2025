clc; clear; close all; 
%% User Defined Values - Edited to include spreadsheet range; must edit at line 103
clc; clear; close all;
%import data
filename = 'GADKO_16G_male.csv';
rawdata = readmatrix(filename);
columns = size(rawdata,2);
rows = size(rawdata,1);
t = rawdata(:, 1); %minutes

%start and end times in minutes for calcium oscillations
starttime = 30;
endtime = 60;

% islet number to be analyzed
islet_num = 7;

%Set prominance
promval = 4;

%% Code Running - No Need for Change
% Reformtatting data for just time of calcium oscillations

%linear index vector
ind = 1:length(t);

%find indices of start and end time
startdiff = abs(t - starttime);
enddiff = abs(t-endtime);

minstart = min(startdiff);
starttime_idx = ind(startdiff == minstart);

minend = min(enddiff);
endtime_idx = ind(enddiff == minend);

%this analyzes one islet at a time 
data = rawdata(:, islet_num + 1);

%reformat data to just times wanting to plot
data = data(starttime_idx:endtime_idx);
t = t(starttime_idx:endtime_idx);

%gently smooth data
data = smooth(data, 5);

%% Finding Peaks and Valleys for Calcium Oscillations
[maxpks, maxlocs, widths, proms] = findpeaks(data, 'MinPeakDistance', .5, 'MinPeakProminence', promval);
[minpks, minlocs] = findpeaks(-data, 'MinPeakDistance', .5, 'MinPeakProminence', promval);

%display the peak data graph
figure(1);
findpeaks(data, 'MinPeakDistance', .5, 'MinPeakProminence', promval,'Annotate','extents')

%transpose width array
widths = widths.';
widths = widths*0.4/60; %convert widths to minutes

%find cycle time (min) for each peak
period = []; 
for i = 1:length(minlocs)-1
    per = t(minlocs(i+1)) - t(minlocs(i));
    period = [period, per];
end

%End cases (if a peak is cut off, get rid of it)
if length(maxlocs) ~= length(minlocs) && minlocs(1) < maxlocs(1)
    %find silent phases for each peak (min)
    silent = period - widths;

    %find duty cycle
    duty_cycle = widths./period;

    %outputs 
    titles = ["Periods (min)", "Active Phases (min)", "Silent Phases (min)", "Duty Cycles", "Amplitude"];
    outputs = table(period', widths', silent', duty_cycle', proms, 'VariableNames', titles);
end

if length(maxlocs) ~= length(minlocs) && minlocs(1) > maxlocs(1)
    %find silent phases for each peak (min)
    silent = period - widths(2:length(widths)-1);

    %find duty cycle
    duty_cycle = widths(2:length(widths)-1)./period;

    %outputs 
    titles = ["Periods (min)", "Active Phases (min)", "Silent Phases (min)", "Duty Cycles", "Amplitude"];
    outputs = table(period', widths(2:length(widths)-1)', silent', duty_cycle', proms(2:length(proms)-1), 'VariableNames', titles);
end

if length(maxlocs) == length(minlocs) && minlocs(1) < maxlocs(1)
    %remove last set of peaks
    maxlocs = maxlocs(1:length(maxlocs)-1);
    minlocs = minlocs(1:length(minlocs)-1);

    %find silent phases for each peak (min)
    silent = period - widths(1:length(widths)-1);
    
    %find duty cycle
    duty_cycle = widths(1:length(widths)-1)./period;

    %outputs
    titles = ["Periods (min)", "Active Phases (min)", "Silent Phases (min)", "Duty Cycles", "Amplitude"];
    outputs = table(period', widths(1:length(widths)-1)', silent', duty_cycle', proms(1:length(proms)-1), 'VariableNames', titles);
end

if length(maxlocs) == length(minlocs) && minlocs(1) > maxlocs(1)
    %find silent phases for each peak (min)
    silent = period - widths(2:length(widths));
    
    %find duty cycle
    duty_cycle = widths(2:length(widths))./period;

    %outputs
    titles = ["Periods (min)", "Active Phases (min)", "Silent Phases (min)", "Duty Cycles", "Amplitude"];
    outputs = table(period', widths(2:length(widths))', silent', duty_cycle', proms(2:length(proms)), 'VariableNames', titles);
end
%% Outputs

%write to spreadsheet
filename = [filename(1:length(filename)-4), '_Phase_Data', '.xlsx'];
sheet_name = ['Islet ', num2str(islet_num)];
writetable(outputs,filename,'Sheet',sheet_name, 'Range', 'A1'); %Change the value after range to A1 for 20-30min, F1 for 30-35min, K1 for 35-40min, P1 for 40-50min, U1 for 10-60