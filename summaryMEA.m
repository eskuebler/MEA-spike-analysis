%{
summaryMEA
%}

clear; close all; clc;

magnitude = 100;

files = dir('D:\grouped MEA\**\*.mat');             % full list of files

% initialize 4AP structures
d.no.div10 = []; N.no.div10 = 1; d.no.div11 = []; N.no.div11 = 1;
nC.no.div10 = []; nE.no.div10 = []; nC.no.div11 = []; nE.no.div11 = [];
d.no.div12 = []; N.no.div12 = 1; d.no.div13 = []; N.no.div13 = 1;
nC.no.div12 = []; nE.no.div12 = []; nC.no.div13 = []; nE.no.div13 = [];
d.no.div14 = []; N.no.div14 = 1; d.no.div15 = []; N.no.div15 = 1;
nC.no.div14 = []; nE.no.div14 = []; nC.no.div15 = []; nE.no.div15 = [];
d.no.div16 = []; N.no.div16 = 1; d.no.div17 = []; N.no.div17 = 1;
nC.no.div16 = []; nE.no.div16 = []; nC.no.div17 = []; nE.no.div17 = [];
d.no.div18 = []; N.no.div18 = 1; d.no.div19 = []; N.no.div19 = 1;
nC.no.div18 = []; nE.no.div18 = []; nC.no.div19 = []; nE.no.div19 = [];
d.no.div20 = []; N.no.div20 = 1; d.no.div21 = []; N.no.div21 = 1;
nC.no.div20 = []; nE.no.div20 = []; nC.no.div21 = []; nE.no.div21 = [];
d.no.div22 = []; N.no.div22 = 1; nC.no.div22 = []; nE.no.div22 = [];

d.low.div10 = []; N.low.div10 = 1; d.low.div11 = []; N.low.div11 = 1;
nC.low.div10 = []; nE.low.div10 = []; nC.low.div11 = []; nE.low.div11 = [];
d.low.div12 = []; N.low.div12 = 1; d.low.div13 = []; N.low.div13 = 1;
nC.low.div12 = []; nE.low.div12 = []; nC.low.div13 = []; nE.low.div13 = [];
d.low.div14 = []; N.low.div14 = 1; d.low.div15 = []; N.low.div15 = 1;
nC.low.div14 = []; nE.low.div14 = []; nC.low.div15 = []; nE.low.div15 = [];
d.low.div16 = []; N.low.div16 = 1; d.low.div17 = []; N.low.div17 = 1;
nC.low.div16 = []; nE.low.div16 = []; nC.low.div17 = []; nE.low.div17 = [];
d.low.div18 = []; N.low.div18 = 1; d.low.div19 = []; N.low.div19 = 1;
nC.low.div18 = []; nE.low.div18 = []; nC.low.div19 = []; nE.low.div19 = [];
d.low.div20 = []; N.low.div20 = 1; d.low.div21 = []; N.low.div21 = 1;
nC.low.div20 = []; nE.low.div20 = []; nC.low.div21 = []; nE.low.div21 = [];
d.low.div22 = []; N.low.div22 = 1; nC.low.div22 = []; nE.low.div22 = 1;

d.high.div10 = []; N.high.div10 = 1; d.high.div11 = []; N.high.div11 = 1;
nC.high.div10 = []; nE.high.div10 = []; nC.high.div11 = []; nE.high.div11 = [];
d.high.div12 = []; N.high.div12 = 1; d.high.div13 = []; N.high.div13 = 1;
nC.high.div12 = []; nE.high.div12 = []; nC.high.div13 = []; nE.high.div13 = [];
d.high.div14 = []; N.high.div14 = 1; d.high.div15 = []; N.high.div15 = 1;
nC.high.div14 = []; nE.high.div14 = []; nC.high.div15 = []; nE.high.div15 = [];
d.high.div16 = []; N.high.div16 = 1; d.high.div17 = []; N.high.div17 = 1;
nC.high.div16 = []; nE.high.div16 = []; nC.high.div17 = []; nE.high.div17 = [];
d.high.div18 = []; N.high.div18 = 1; d.high.div19 = []; N.high.div19 = 1;
nC.high.div18 = []; nE.high.div18 = []; nC.high.div19 = []; nE.high.div19 = [];
d.high.div20 = []; N.high.div20 = 1; d.high.div21 = []; N.high.div21 = 1;
nC.high.div20 = []; nE.high.div20 = []; nC.high.div21 = []; nE.high.div21 = [];
d.high.div22 = []; N.high.div22 = 1; nC.high.div22 = []; nE.high.div22 = 1;

% initialize vehicle structure 
d.noC.div10 = []; N.noC.div10 = 1; d.noC.div11 = []; N.noC.div11 = 1;
nC.noC.div10 = []; nE.noC.div10 = []; nC.noC.div11 = []; nE.noC.div11 = [];
d.noC.div12 = []; N.noC.div12 = 1; d.noC.div13 = []; N.noC.div13 = 1;
nC.noC.div12 = []; nE.noC.div12 = []; nC.noC.div13 = []; nE.noC.div13 = [];
d.noC.div14 = []; N.noC.div14 = 1; d.noC.div15 = []; N.noC.div15 = 1;
nC.noC.div14 = []; nE.noC.div14 = []; nC.noC.div15 = []; nE.noC.div15 = [];
d.noC.div16 = []; N.noC.div16 = 1; d.noC.div17 = []; N.noC.div17 = 1;
nC.noC.div16 = []; nE.noC.div16 = []; nC.noC.div17 = []; nE.noC.div17 = [];
d.noC.div18 = []; N.noC.div18 = 1; d.noC.div19 = []; N.noC.div19 = 1;
nC.noC.div18 = []; nE.noC.div18 = []; nC.noC.div19 = []; nE.noC.div19 = [];
d.noC.div20 = []; N.noC.div20 = 1; d.noC.div21 = []; N.noC.div21 = 1;
nC.noC.div20 = []; nE.noC.div20 = []; nC.noC.div21 = []; nE.noC.div21 = [];
d.noC.div22 = []; N.noC.div22 = 1; nC.noC.div22 = []; nE.noC.div22 = [];

d.lowC.div10 = []; N.lowC.div10 = 1; d.lowC.div11 = []; N.lowC.div11 = 1;
nC.lowC.div10 = []; nE.lowC.div10 = []; nC.lowC.div11 = []; nE.lowC.div11 = [];
d.lowC.div12 = []; N.lowC.div12 = 1; d.lowC.div13 = []; N.lowC.div13 = 1;
nC.lowC.div12 = []; nE.lowC.div12 = []; nC.lowC.div13 = []; nE.lowC.div13 = [];
d.lowC.div14 = []; N.lowC.div14 = 1; d.lowC.div15 = []; N.lowC.div15 = 1;
nC.lowC.div14 = []; nE.lowC.div14 = []; nC.lowC.div15 = []; nE.lowC.div15 = [];
d.lowC.div16 = []; N.lowC.div16 = 1; d.lowC.div17 = []; N.lowC.div17 = 1;
nC.lowC.div16 = []; nE.lowC.div16 = []; nC.lowC.div17 = []; nE.lowC.div17 = [];
d.lowC.div18 = []; N.lowC.div18 = 1; d.lowC.div19 = []; N.lowC.div19 = 1;
nC.lowC.div18 = []; nE.lowC.div18 = []; nC.lowC.div19 = []; nE.lowC.div19 = [];
d.lowC.div20 = []; N.lowC.div20 = 1; d.lowC.div21 = []; N.lowC.div21 = 1;
nC.lowC.div20 = []; nE.lowC.div20 = []; nC.lowC.div21 = []; nE.lowC.div21 = [];
d.lowC.div22 = []; N.lowC.div22 = 1; nC.lowC.div22 = []; nE.lowC.div22 = 1;

d.highC.div10 = []; N.highC.div10 = 1; d.highC.div11 = []; N.highC.div11 = 1;
nC.highC.div10 = []; nE.highC.div10 = []; nC.highC.div11 = []; nE.highC.div11 = [];
d.highC.div12 = []; N.highC.div12 = 1; d.highC.div13 = []; N.highC.div13 = 1;
nC.highC.div12 = []; nE.highC.div12 = []; nC.highC.div13 = []; nE.highC.div13 = [];
d.highC.div14 = []; N.highC.div14 = 1; d.highC.div15 = []; N.highC.div15 = 1;
nC.highC.div14 = []; nE.highC.div14 = []; nC.highC.div15 = []; nE.highC.div15 = [];
d.highC.div16 = []; N.highC.div16 = 1; d.highC.div17 = []; N.highC.div17 = 1;
nC.highC.div16 = []; nE.highC.div16 = []; nC.highC.div17 = []; nE.highC.div17 = [];
d.highC.div18 = []; N.highC.div18 = 1; d.highC.div19 = []; N.highC.div19 = 1;
nC.highC.div18 = []; nE.highC.div18 = []; nC.highC.div19 = []; nE.highC.div19 = [];
d.highC.div20 = []; N.highC.div20 = 1; d.highC.div21 = []; N.highC.div21 = 1;
nC.highC.div20 = []; nE.highC.div20 = []; nC.highC.div21 = []; nE.highC.div21 = [];
d.highC.div22 = []; N.highC.div22 = 1; nC.highC.div22 = []; nE.highC.div22 = 1;

for n = 1:length(files)
    
    clc; disp(files(n,1).folder(20:42))
    
    load([files(n,1).folder,'\',files(n,1).name])                           % load data
    
    % get characteristics of recording
    grp{n,1} = files(n,1).folder(16:18);                                    % pre-insult condition
    cond{n,1} = files(n,1).folder(20:24);                                   % target condition
    mea{n,1} = files(n,1).folder(26:28);                                    % MEA ID
    div{n,1} = files(n,1).folder(38:42);                                    % day in vitro
    
    % populate data structures (i.e., d, nc, nr)
    if grp{n,1} == '4AP'
        if cond{n,1} == '0 non'                                                 % no insult condition
            if div{n,1} == 'DIV10'; d.no.div10 = [d.no.div10, a.aval.d]; nC.no.div10 = [nC.no.div10, a.aval.nC]; nE.no.div10 = [nE.no.div10, a.aval.nE]; N.no.div10 = N.no.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.no.div11 = [d.no.div11, a.aval.d]; nC.no.div11 = [nC.no.div11, a.aval.nC]; nE.no.div11 = [nE.no.div11, a.aval.nE]; N.no.div11 = N.no.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.no.div12 = [d.no.div12, a.aval.d]; nC.no.div12 = [nC.no.div12, a.aval.nC]; nE.no.div12 = [nE.no.div12, a.aval.nE]; N.no.div12 = N.no.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.no.div13 = [d.no.div13, a.aval.d]; nC.no.div13 = [nC.no.div13, a.aval.nC]; nE.no.div13 = [nE.no.div13, a.aval.nE]; N.no.div13 = N.no.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.no.div14 = [d.no.div14, a.aval.d]; nC.no.div14 = [nC.no.div14, a.aval.nC]; nE.no.div14 = [nE.no.div14, a.aval.nE]; N.no.div14 = N.no.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.no.div15 = [d.no.div15, a.aval.d]; nC.no.div15 = [nC.no.div15, a.aval.nC]; nE.no.div15 = [nE.no.div15, a.aval.nE]; N.no.div15 = N.no.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.no.div16 = [d.no.div16, a.aval.d]; nC.no.div16 = [nC.no.div16, a.aval.nC]; nE.no.div16 = [nE.no.div16, a.aval.nE]; N.no.div16 = N.no.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.no.div17 = [d.no.div17, a.aval.d]; nC.no.div17 = [nC.no.div17, a.aval.nC]; nE.no.div17 = [nE.no.div17, a.aval.nE]; N.no.div17 = N.no.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.no.div18 = [d.no.div18, a.aval.d]; nC.no.div18 = [nC.no.div18, a.aval.nC]; nE.no.div18 = [nE.no.div18, a.aval.nE]; N.no.div18 = N.no.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.no.div19 = [d.no.div19, a.aval.d]; nC.no.div19 = [nC.no.div19, a.aval.nC]; nE.no.div19 = [nE.no.div19, a.aval.nE]; N.no.div19 = N.no.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.no.div20 = [d.no.div20, a.aval.d]; nC.no.div20 = [nC.no.div20, a.aval.nC]; nE.no.div20 = [nE.no.div20, a.aval.nE]; N.no.div20 = N.no.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.no.div21 = [d.no.div21, a.aval.d]; nC.no.div21 = [nC.no.div21, a.aval.nC]; nE.no.div21 = [nE.no.div21, a.aval.nE]; N.no.div21 = N.no.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.no.div22 = [d.no.div22, a.aval.d]; nC.no.div22 = [nC.no.div22, a.aval.nC]; nE.no.div22 = [nE.no.div22, a.aval.nE]; N.no.div22 = N.no.div22 + 1;
            end
        elseif cond{n,1} == '1 low'
            if div{n,1} == 'DIV10'; d.low.div10 = [d.low.div10, a.aval.d]; nC.low.div10 = [nC.low.div10, a.aval.nC]; nE.low.div10 = [nE.low.div10, a.aval.nE]; N.low.div10 = N.low.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.low.div11 = [d.low.div11, a.aval.d]; nC.low.div11 = [nC.low.div11, a.aval.nC]; nE.low.div11 = [nE.low.div11, a.aval.nE]; N.low.div11 = N.low.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.low.div12 = [d.low.div12, a.aval.d]; nC.low.div12 = [nC.low.div12, a.aval.nC]; nE.low.div12 = [nE.low.div12, a.aval.nE]; N.low.div12 = N.low.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.low.div13 = [d.low.div13, a.aval.d]; nC.low.div13 = [nC.low.div13, a.aval.nC]; nE.low.div13 = [nE.low.div13, a.aval.nE]; N.low.div13 = N.low.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.low.div14 = [d.low.div14, a.aval.d]; nC.low.div14 = [nC.low.div14, a.aval.nC]; nE.low.div14 = [nE.low.div14, a.aval.nE]; N.low.div14 = N.low.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.low.div15 = [d.low.div15, a.aval.d]; nC.low.div15 = [nC.low.div15, a.aval.nC]; nE.low.div15 = [nE.low.div15, a.aval.nE]; N.low.div15 = N.low.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.low.div16 = [d.low.div16, a.aval.d]; nC.low.div16 = [nC.low.div16, a.aval.nC]; nE.low.div16 = [nE.low.div16, a.aval.nE]; N.low.div16 = N.low.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.low.div17 = [d.low.div17, a.aval.d]; nC.low.div17 = [nC.low.div17, a.aval.nC]; nE.low.div17 = [nE.low.div17, a.aval.nE]; N.low.div17 = N.low.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.low.div18 = [d.low.div18, a.aval.d]; nC.low.div18 = [nC.low.div18, a.aval.nC]; nE.low.div18 = [nE.low.div18, a.aval.nE]; N.low.div18 = N.low.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.low.div19 = [d.low.div19, a.aval.d]; nC.low.div19 = [nC.low.div19, a.aval.nC]; nE.low.div19 = [nE.low.div19, a.aval.nE]; N.low.div19 = N.low.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.low.div20 = [d.low.div20, a.aval.d]; nC.low.div20 = [nC.low.div20, a.aval.nC]; nE.low.div20 = [nE.low.div20, a.aval.nE]; N.low.div20 = N.low.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.low.div21 = [d.low.div21, a.aval.d]; nC.low.div21 = [nC.low.div21, a.aval.nC]; nE.low.div21 = [nE.low.div21, a.aval.nE]; N.low.div21 = N.low.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.low.div22 = [d.low.div22, a.aval.d]; nC.low.div22 = [nC.low.div22, a.aval.nC]; nE.low.div22 = [nE.low.div22, a.aval.nE]; N.low.div22 = N.low.div22 + 1;
            end
        elseif cond{n,1} == '2 hig'
            if div{n,1} == 'DIV10'; d.high.div10 = [d.high.div10, a.aval.d]; nC.high.div10 = [nC.high.div10, a.aval.nC]; nE.high.div10 = [nE.high.div10, a.aval.nE]; N.high.div10 = N.high.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.high.div11 = [d.high.div11, a.aval.d]; nC.high.div11 = [nC.high.div11, a.aval.nC]; nE.high.div11 = [nE.high.div11, a.aval.nE]; N.high.div11 = N.high.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.high.div12 = [d.high.div12, a.aval.d]; nC.high.div12 = [nC.high.div12, a.aval.nC]; nE.high.div12 = [nE.high.div12, a.aval.nE]; N.high.div12 = N.high.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.high.div13 = [d.high.div13, a.aval.d]; nC.high.div13 = [nC.high.div13, a.aval.nC]; nE.high.div13 = [nE.high.div13, a.aval.nE]; N.high.div13 = N.high.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.high.div14 = [d.high.div14, a.aval.d]; nC.high.div14 = [nC.high.div14, a.aval.nC]; nE.high.div14 = [nE.high.div14, a.aval.nE]; N.high.div14 = N.high.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.high.div15 = [d.high.div15, a.aval.d]; nC.high.div15 = [nC.high.div15, a.aval.nC]; nE.high.div15 = [nE.high.div15, a.aval.nE]; N.high.div15 = N.high.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.high.div16 = [d.high.div16, a.aval.d]; nC.high.div16 = [nC.high.div16, a.aval.nC]; nE.high.div16 = [nE.high.div16, a.aval.nE]; N.high.div16 = N.high.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.high.div17 = [d.high.div17, a.aval.d]; nC.high.div17 = [nC.high.div17, a.aval.nC]; nE.high.div17 = [nE.high.div17, a.aval.nE]; N.high.div17 = N.high.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.high.div18 = [d.high.div18, a.aval.d]; nC.high.div18 = [nC.high.div18, a.aval.nC]; nE.high.div18 = [nE.high.div18, a.aval.nE]; N.high.div18 = N.high.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.high.div19 = [d.high.div19, a.aval.d]; nC.high.div19 = [nC.high.div19, a.aval.nC]; nE.high.div19 = [nE.high.div19, a.aval.nE]; N.high.div19 = N.high.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.high.div20 = [d.high.div20, a.aval.d]; nC.high.div20 = [nC.high.div20, a.aval.nC]; nE.high.div20 = [nE.high.div20, a.aval.nE]; N.high.div20 = N.high.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.high.div21 = [d.high.div21, a.aval.d]; nC.high.div21 = [nC.high.div21, a.aval.nC]; nE.high.div21 = [nE.high.div21, a.aval.nE]; N.high.div21 = N.high.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.high.div22 = [d.high.div22, a.aval.d]; nC.high.div22 = [nC.high.div22, a.aval.nC]; nE.high.div22 = [nE.high.div22, a.aval.nE]; N.high.div22 = N.high.div22 + 1;
            end
        end
    elseif grp{n,1} == 'veh'
        if cond{n,1} == '0 non'                                                 % no insult condition
            if div{n,1} == 'DIV10'; d.noC.div10 = [d.noC.div10, a.aval.d]; nC.noC.div10 = [nC.noC.div10, a.aval.nC]; nE.noC.div10 = [nE.noC.div10, a.aval.nE]; N.noC.div10 = N.noC.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.noC.div11 = [d.noC.div11, a.aval.d]; nC.noC.div11 = [nC.noC.div11, a.aval.nC]; nE.noC.div11 = [nE.noC.div11, a.aval.nE]; N.noC.div11 = N.noC.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.noC.div12 = [d.noC.div12, a.aval.d]; nC.noC.div12 = [nC.noC.div12, a.aval.nC]; nE.noC.div12 = [nE.noC.div12, a.aval.nE]; N.noC.div12 = N.noC.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.noC.div13 = [d.noC.div13, a.aval.d]; nC.noC.div13 = [nC.noC.div13, a.aval.nC]; nE.noC.div13 = [nE.noC.div13, a.aval.nE]; N.noC.div13 = N.noC.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.noC.div14 = [d.noC.div14, a.aval.d]; nC.noC.div14 = [nC.noC.div14, a.aval.nC]; nE.noC.div14 = [nE.noC.div14, a.aval.nE]; N.noC.div14 = N.noC.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.noC.div15 = [d.noC.div15, a.aval.d]; nC.noC.div15 = [nC.noC.div15, a.aval.nC]; nE.noC.div15 = [nE.noC.div15, a.aval.nE]; N.noC.div15 = N.noC.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.noC.div16 = [d.noC.div16, a.aval.d]; nC.noC.div16 = [nC.noC.div16, a.aval.nC]; nE.noC.div16 = [nE.noC.div16, a.aval.nE]; N.noC.div16 = N.noC.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.noC.div17 = [d.noC.div17, a.aval.d]; nC.noC.div17 = [nC.noC.div17, a.aval.nC]; nE.noC.div17 = [nE.noC.div17, a.aval.nE]; N.noC.div17 = N.noC.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.noC.div18 = [d.noC.div18, a.aval.d]; nC.noC.div18 = [nC.noC.div18, a.aval.nC]; nE.noC.div18 = [nE.noC.div18, a.aval.nE]; N.noC.div18 = N.noC.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.noC.div19 = [d.noC.div19, a.aval.d]; nC.noC.div19 = [nC.noC.div19, a.aval.nC]; nE.noC.div19 = [nE.noC.div19, a.aval.nE]; N.noC.div19 = N.noC.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.noC.div20 = [d.noC.div20, a.aval.d]; nC.noC.div20 = [nC.noC.div20, a.aval.nC]; nE.noC.div20 = [nE.noC.div20, a.aval.nE]; N.noC.div20 = N.noC.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.noC.div21 = [d.noC.div21, a.aval.d]; nC.noC.div21 = [nC.noC.div21, a.aval.nC]; nE.noC.div21 = [nE.noC.div21, a.aval.nE]; N.noC.div21 = N.noC.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.noC.div22 = [d.noC.div22, a.aval.d]; nC.noC.div22 = [nC.noC.div22, a.aval.nC]; nE.noC.div22 = [nE.noC.div22, a.aval.nE]; N.noC.div22 = N.noC.div22 + 1;
            end
        elseif cond{n,1} == '1 low'
            if div{n,1} == 'DIV10'; d.lowC.div10 = [d.lowC.div10, a.aval.d]; nC.lowC.div10 = [nC.lowC.div10, a.aval.nC]; nE.lowC.div10 = [nE.lowC.div10, a.aval.nE]; N.lowC.div10 = N.lowC.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.lowC.div11 = [d.lowC.div11, a.aval.d]; nC.lowC.div11 = [nC.lowC.div11, a.aval.nC]; nE.lowC.div11 = [nE.lowC.div11, a.aval.nE]; N.lowC.div11 = N.lowC.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.lowC.div12 = [d.lowC.div12, a.aval.d]; nC.lowC.div12 = [nC.lowC.div12, a.aval.nC]; nE.lowC.div12 = [nE.lowC.div12, a.aval.nE]; N.lowC.div12 = N.lowC.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.lowC.div13 = [d.lowC.div13, a.aval.d]; nC.lowC.div13 = [nC.lowC.div13, a.aval.nC]; nE.lowC.div13 = [nE.lowC.div13, a.aval.nE]; N.lowC.div13 = N.lowC.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.lowC.div14 = [d.lowC.div14, a.aval.d]; nC.lowC.div14 = [nC.lowC.div14, a.aval.nC]; nE.lowC.div14 = [nE.lowC.div14, a.aval.nE]; N.lowC.div14 = N.lowC.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.lowC.div15 = [d.lowC.div15, a.aval.d]; nC.lowC.div15 = [nC.lowC.div15, a.aval.nC]; nE.lowC.div15 = [nE.lowC.div15, a.aval.nE]; N.lowC.div15 = N.lowC.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.lowC.div16 = [d.lowC.div16, a.aval.d]; nC.lowC.div16 = [nC.lowC.div16, a.aval.nC]; nE.lowC.div16 = [nE.lowC.div16, a.aval.nE]; N.lowC.div16 = N.lowC.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.lowC.div17 = [d.lowC.div17, a.aval.d]; nC.lowC.div17 = [nC.lowC.div17, a.aval.nC]; nE.lowC.div17 = [nE.lowC.div17, a.aval.nE]; N.lowC.div17 = N.lowC.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.lowC.div18 = [d.lowC.div18, a.aval.d]; nC.lowC.div18 = [nC.lowC.div18, a.aval.nC]; nE.lowC.div18 = [nE.lowC.div18, a.aval.nE]; N.lowC.div18 = N.lowC.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.lowC.div19 = [d.lowC.div19, a.aval.d]; nC.lowC.div19 = [nC.lowC.div19, a.aval.nC]; nE.lowC.div19 = [nE.lowC.div19, a.aval.nE]; N.lowC.div19 = N.lowC.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.lowC.div20 = [d.lowC.div20, a.aval.d]; nC.lowC.div20 = [nC.lowC.div20, a.aval.nC]; nE.lowC.div20 = [nE.lowC.div20, a.aval.nE]; N.lowC.div20 = N.lowC.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.lowC.div21 = [d.lowC.div21, a.aval.d]; nC.lowC.div21 = [nC.lowC.div21, a.aval.nC]; nE.lowC.div21 = [nE.lowC.div21, a.aval.nE]; N.lowC.div21 = N.lowC.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.lowv.div22 = [d.lowC.div22, a.aval.d]; nC.lowC.div22 = [nC.lowC.div22, a.aval.nC]; nE.lowC.div22 = [nE.lowC.div22, a.aval.nE]; N.lowC.div22 = N.lowC.div22 + 1;
            end
        elseif cond{n,1} == '2 hig'
            if div{n,1} == 'DIV10'; d.highC.div10 = [d.highC.div10, a.aval.d]; nC.highC.div10 = [nC.highC.div10, a.aval.nC]; nE.highC.div10 = [nE.highC.div10, a.aval.nE]; N.highC.div10 = N.highC.div10 + 1;
            elseif div{n,1} == 'DIV11'; d.highC.div11 = [d.highC.div11, a.aval.d]; nC.highC.div11 = [nC.highC.div11, a.aval.nC]; nE.highC.div11 = [nE.highC.div11, a.aval.nE]; N.highC.div11 = N.highC.div11 + 1;
            elseif div{n,1} == 'DIV12'; d.highC.div12 = [d.highC.div12, a.aval.d]; nC.highC.div12 = [nC.highC.div12, a.aval.nC]; nE.highC.div12 = [nE.highC.div12, a.aval.nE]; N.highC.div12 = N.highC.div12 + 1;
            elseif div{n,1} == 'DIV13'; d.highC.div13 = [d.highC.div13, a.aval.d]; nC.highC.div13 = [nC.highC.div13, a.aval.nC]; nE.highC.div13 = [nE.highC.div13, a.aval.nE]; N.highC.div13 = N.highC.div13 + 1;
            elseif div{n,1} == 'DIV14'; d.highC.div14 = [d.highC.div14, a.aval.d]; nC.highC.div14 = [nC.highC.div14, a.aval.nC]; nE.highC.div14 = [nE.highC.div14, a.aval.nE]; N.highC.div14 = N.highC.div14 + 1;
            elseif div{n,1} == 'DIV15'; d.highC.div15 = [d.highC.div15, a.aval.d]; nC.highC.div15 = [nC.highC.div15, a.aval.nC]; nE.highC.div15 = [nE.highC.div15, a.aval.nE]; N.highC.div15 = N.highC.div15 + 1;
            elseif div{n,1} == 'DIV16'; d.highC.div16 = [d.highC.div16, a.aval.d]; nC.highC.div16 = [nC.highC.div16, a.aval.nC]; nE.highC.div16 = [nE.highC.div16, a.aval.nE]; N.highC.div16 = N.highC.div16 + 1;
            elseif div{n,1} == 'DIV17'; d.highC.div17 = [d.highC.div17, a.aval.d]; nC.highC.div17 = [nC.highC.div17, a.aval.nC]; nE.highC.div17 = [nE.highC.div17, a.aval.nE]; N.highC.div17 = N.highC.div17 + 1;
            elseif div{n,1} == 'DIV18'; d.highC.div18 = [d.highC.div18, a.aval.d]; nC.highC.div18 = [nC.highC.div18, a.aval.nC]; nE.highC.div18 = [nE.highC.div18, a.aval.nE]; N.highC.div18 = N.highC.div18 + 1;
            elseif div{n,1} == 'DIV19'; d.highC.div19 = [d.highC.div19, a.aval.d]; nC.highC.div19 = [nC.highC.div19, a.aval.nC]; nE.highC.div19 = [nE.highC.div19, a.aval.nE]; N.highC.div19 = N.highC.div19 + 1;
            elseif div{n,1} == 'DIV20'; d.highC.div20 = [d.highC.div20, a.aval.d]; nC.highC.div20 = [nC.highC.div20, a.aval.nC]; nE.highC.div20 = [nE.highC.div20, a.aval.nE]; N.highC.div20 = N.highC.div20 + 1;
            elseif div{n,1} == 'DIV21'; d.highC.div21 = [d.highC.div21, a.aval.d]; nC.highC.div21 = [nC.highC.div21, a.aval.nC]; nE.highC.div21 = [nE.highC.div21, a.aval.nE]; N.highC.div21 = N.highC.div21 + 1;
            elseif div{n,1} == 'DIV22'; d.highC.div22 = [d.highC.div22, a.aval.d]; nC.highC.div22 = [nC.highC.div22, a.aval.nC]; nE.highC.div22 = [nE.highC.div22, a.aval.nE]; N.highC.div22 = N.highC.div22 + 1;
            end
        end
    end
end

plotAval
