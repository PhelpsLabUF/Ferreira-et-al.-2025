clc; clear;close all; 

% This matlab code is specifically for the display of multiple islets in
% one heatmap. 

% To uncomment a line, remove the '%' from the beginning of the line. 
% Upload your data set as an excel sheet or as a csv file to matlab, 
% as a reminder, your excel sheet must be saved in the same location as your matlab sheet. 
% Replace the name with the name of your results sheet. Make sure you
% include .xlsx or .csv at the end of the file 

set(groot, 'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter', 'latex'); 

rawdata1 = readmatrix('GADKO1_1.csv');
rawdata2 = readmatrix('GADKO1_2.csv');
rawdata3 = readmatrix('GADKO1_3.csv');
rawdata4 = readmatrix('GADKO1_4.csv');
rawdata5 = readmatrix('GADKO1_5.csv');
rawdata6 = readmatrix('GADKO1_6.csv');
% rawdata7 = readmatrix('islet 7.csv');
% rawdata8 = readmatrix('islet 8.csv');

prompt3 = 'Please input frame rate: '; 
columns1 = size(rawdata1,2);
r1 = size(rawdata1,1);
z1 = r1-1;
columns2 = size(rawdata2,2); 
r2 = size(rawdata2,1);
z2 = r2-1; 
columns3 = size(rawdata3,2);
r3 = size(rawdata3,1);
z3 = r3-1;
columns4 = size(rawdata4,2);
r4 = size(rawdata4,1);
z4 = r4-1; 
columns5 = size(rawdata5,2);
r5 = size(rawdata5,1);
z5 = r5-1; 
columns6 = size(rawdata6,2);
r6 = size(rawdata6,1);
z6 = r6-1; 
% columns7 = size(rawdata7,2);
% r7 = size(rawdata7,1);
% z7 = r7-1; 
% columns8 = size(rawdata8,2);
% r8 = size(rawdata8,1);
% z8 = r8-1; 
tinterval = input(prompt3); %for csv without time points 

normdata1 = rawdata1(2:r1, 2:columns1); 
normdata2 = rawdata2(2:r2, 2:columns2); 
normdata3 = rawdata3(2:r3, 2:columns3); 
normdata4 = rawdata4(2:r4, 2:columns4); 
normdata5 = rawdata5(2:r5, 2:columns5); 
normdata6 = rawdata6(2:r6, 2:columns6); 
% normdata7 = rawdata7(2:r7, 2:columns7);
% normdata8 = rawdata8(2:r8, 2:columns8);

time1 = rawdata1(2:r1,1);
time2 = rawdata2(2:r2,1);
time3 = rawdata3(2:r3,1);
time4 = rawdata4(2:r4,1);
time5 = rawdata5(2:r5,1);
time6 = rawdata6(2:r6,1);
% time7 = rawdata7(2:r7,1);
% time8 = rawdata8(2:r8,1);

adjustedtime1 = time1.*tinterval;
adjustedtime2 = time2.*tinterval;
adjustedtime3 = time3.*tinterval;
adjustedtime4 = time4.*tinterval;
adjustedtime5 = time5.*tinterval;
adjustedtime6 = time6.*tinterval;
% adjustedtime7 = time7.*tinterval;
% adjustedtime8 = time8.*tinterval;

combineddata1 = [adjustedtime1 normdata1];
combineddata2 = [adjustedtime2 normdata2];
combineddata3 = [adjustedtime3 normdata3];
combineddata4 = [adjustedtime4 normdata4];
combineddata5 = [adjustedtime5 normdata5]; 
combineddata6 = [adjustedtime6 normdata6];
% combineddata7 = [adjustedtime7 normdata7];
% combineddata8 = [adjustedtime8 normdata8];
%% Normalization 1
for c = 2:columns1
    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata1(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z1
        fc = combineddata1 (t,c);
        Fc = fc - f0avg;
        combineddata1 (t,c) = Fc;
    end
end
%% Normalization 2
for c = 2:columns2
    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata2(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z2
        fc = combineddata2 (t,c);
        Fc = fc - f0avg;
        combineddata2 (t,c) = Fc;
    end
end
%% Normalization 3
for c = 2:columns3
    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata3(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z3
        fc = combineddata3 (t,c);
        Fc = fc - f0avg;
        combineddata3 (t,c) = Fc;
    end
end
%% Normalization 4
for c = 2:columns4
    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata4(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z4
        fc = combineddata4 (t,c);
        Fc = fc - f0avg;
        combineddata4 (t,c) = Fc;
    end
end

%% Normalization 5
for c = 2:columns5    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata5(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z5
        fc = combineddata5 (t,c);
        Fc = (fc - f0avg);
        combineddata5 (t,c) = Fc;
    end
end
%% Normalization 6 
for c = 2:columns6    %f0avg = combineddata (1, c); %Normalize by first time point only 
    f0 =  combineddata6(1:30, c); %Normalize by first 30 time points 
    f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
    for t = 1:z6
        fc = combineddata6 (t,c);
        Fc = fc - f0avg;
        combineddata6 (t,c) = Fc;
    end
end
% %% Normalization 7
% for c = 2:columns7    %f0avg = combineddata (1, c); %Normalize by first time point only 
%     f0 =  combineddata7(1:30, c); %Normalize by first 30 time points 
%     f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
%     for t = 1:z7
%         fc = combineddata7 (t,c);
%         Fc = fc - f0avg;
%         combineddata7 (t,c) = Fc;
%     end
% end
% %% Normalization 8
% for c = 2:columns8    %f0avg = combineddata (1, c); %Normalize by first time point only 
%     f0 =  combineddata8(1:30, c); %Normalize by first 30 time points 
%     f0avg = mean(f0); %Uncomment when normalizing by first 30 time points
%     for t = 1:z8
%         fc = combineddata8 (t,c);
%         Fc = fc - f0avg;
%         combineddata8 (t,c) = Fc;
%     end
% end
%% Graphing
combineddata1 = combineddata1 (:, 2:columns1);
combineddata2 = combineddata2 (:, 2:columns2);
combineddata3 = combineddata3 (:, 2:columns3);
combineddata4 = combineddata4 (:, 2:columns4);
combineddata5 = combineddata5 (:, 2:columns5);
combineddata6 = combineddata6 (:, 2:columns6);
% combineddata7 = combineddata7 (:, 2:columns7);
% combineddata8 = combineddata8 (:, 2:columns8);

meanhighglucose1 = mean(combineddata1);
meanhighglucose2 = mean(combineddata2);
meanhighglucose3 = mean(combineddata3);
meanhighglucose4 = mean(combineddata4);
meanhighglucose5 = mean(combineddata5);
meanhighglucose6 = mean(combineddata6);
% meanhighglucose7 = mean(combineddata7);
% meanhighglucose8 = mean(combineddata8);

% mean = mean(normdata);
meandata1 = meanhighglucose1;
data1 = combineddata1' ;
meandata1 = meandata1';
data1 = [data1 meandata1];
sortdata1 = sortrows(data1, z1);

meandata2 = meanhighglucose2;
data2 = combineddata2' ;
meandata2 = meandata2';
data2 = [data2 meandata2];
sortdata2 = sortrows(data2, z2);

meandata3 = meanhighglucose3;
data3 = combineddata3' ;
meandata3 = meandata3';
data3 = [data3 meandata3];
sortdata3 = sortrows(data3, z3);

meandata4 = meanhighglucose4;
data4 = combineddata4' ;
meandata4 = meandata4';
data4 = [data4 meandata4];
sortdata4 = sortrows(data4, z4);

meandata5 = meanhighglucose5;
data5 = combineddata5' ;
meandata5 = meandata5';
data5 = [data5 meandata5];
sortdata5 = sortrows(data5, z5);

meandata6 = meanhighglucose6;
data6 = combineddata6' ;
meandata6 = meandata6';
data6 = [data6 meandata6];
sortdata6 = sortrows(data6, z6);

% meandata7 = meanhighglucose7;
% data7 = combineddata7' ;
% meandata7 = meandata7';
% data7 = [data7 meandata7];
% sortdata7 = sortrows(data7, z7);
% 
% meandata8 = meanhighglucose8;
% data8 = combineddata8' ;
% meandata8 = meandata8';
% data8 = [data8 meandata8];
% sortdata8 = sortrows(data8, z8);


fulldata = [sortdata1; sortdata2; sortdata3; sortdata4; sortdata5; sortdata6]; 
%%
% For different colormaps replace "gray" with any registered matlab lookup
% table.
b = size(fulldata,2)-1; 
h = heatmap(fulldata(:, :), 'colormap',jet,'Colormethod','mean', 'Gridvisible','off','FontSize',0.00001,'Colorbarvisible','off');
clim([-30,140]);
KCLadjust = 0;
plotLineThroughRowNr = 50;
nRow = numel(h.YData);
rowWidth = (h.InnerPosition(4))/(nRow);
lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

plotLineThroughRowNr = 100;
nRow = numel(h.YData);
rowWidth = (h.InnerPosition(4))/(nRow);
lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

plotLineThroughRowNr = 150;
nRow = numel(h.YData);
rowWidth = (h.InnerPosition(4))/(nRow);
lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

plotLineThroughRowNr = 200;
nRow = numel(h.YData);
rowWidth = (h.InnerPosition(4))/(nRow);
lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

plotLineThroughRowNr = 250;
nRow = numel(h.YData);
rowWidth = (h.InnerPosition(4))/(nRow);
lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

% plotLineThroughRowNr = 240;
% nRow = numel(h.YData);
% rowWidth = (h.InnerPosition(4))/(nRow);
% lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
% annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)
% 
% plotLineThroughRowNr = 280;
% nRow = numel(h.YData);
% rowWidth = (h.InnerPosition(4))/(nRow);
% lineYCoord = (nRow-plotLineThroughRowNr+0.5)*rowWidth + h.InnerPosition(2);
% annotation("line",[h.InnerPosition(1) h.InnerPosition(1)+h.InnerPosition(3)],[lineYCoord lineYCoord],"Color","white",'LineWidth',2)

% 5.6G 11 min Stimulation 
plotLineThroughColumnNr = 660/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 7G 11-21 min Stimulation 
plotLineThroughColumnNr = (21*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 8G 21-31 min Stimulation 
plotLineThroughColumnNr = (31*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 9G 31-41 min Stimulation 
plotLineThroughColumnNr = (41*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 11G 41-51 min Stimulation 
plotLineThroughColumnNr = (51*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 5.6G 51-61 min Stimulation 
plotLineThroughColumnNr = (61*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% KCL 61-64 min Stimulation 
plotLineThroughColumnNr = (64*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')

% 5.6G 64-70 min Stimulation 
plotLineThroughColumnNr = (70*60)/tinterval + KCLadjust;
nColumn = numel(h.XData);
columnWidth = (h.InnerPosition(3))/(nColumn);
lineXCoord = (plotLineThroughColumnNr+0.5)*columnWidth + h.InnerPosition(1);
annotation("line",[lineXCoord lineXCoord],[h.InnerPosition(2) h.InnerPosition(2)+h.InnerPosition(4)],"Color","white",'LineWidth',2, 'LineStyle', '--')