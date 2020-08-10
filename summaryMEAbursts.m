%{
summaryMEAbursts
%}

clear; close all; clc;

files = dir('D:\mat\**\*.mat');             % full list of files

% initialize 4AP structures
d.no.div10 = []; N.no.div10 = 1; d.no.div11 = []; N.no.div11 = 1;
d.no.div12 = []; N.no.div12 = 1; d.no.div13 = []; N.no.div13 = 1;
d.no.div14 = []; N.no.div14 = 1; d.no.div15 = []; N.no.div15 = 1;
d.no.div16 = []; N.no.div16 = 1; d.no.div17 = []; N.no.div17 = 1;
d.no.div18 = []; N.no.div18 = 1; d.no.div19 = []; N.no.div19 = 1;
d.no.div20 = []; N.no.div20 = 1; d.no.div21 = []; N.no.div21 = 1;
d.no.div22 = []; N.no.div22 = 1;

d.low.div10 = []; N.low.div10 = 1; d.low.div11 = []; N.low.div11 = 1;
d.low.div12 = []; N.low.div12 = 1; d.low.div13 = []; N.low.div13 = 1;
d.low.div14 = []; N.low.div14 = 1; d.low.div15 = []; N.low.div15 = 1;
d.low.div16 = []; N.low.div16 = 1; d.low.div17 = []; N.low.div17 = 1;
d.low.div18 = []; N.low.div18 = 1; d.low.div19 = []; N.low.div19 = 1;
d.low.div20 = []; N.low.div20 = 1; d.low.div21 = []; N.low.div21 = 1;
d.low.div22 = []; N.low.div22 = 1;

d.high.div10 = []; N.high.div10 = 1; d.high.div11 = []; N.high.div11 = 1;
d.high.div12 = []; N.high.div12 = 1; d.high.div13 = []; N.high.div13 = 1;
d.high.div14 = []; N.high.div14 = 1; d.high.div15 = []; N.high.div15 = 1;
d.high.div16 = []; N.high.div16 = 1; d.high.div17 = []; N.high.div17 = 1;
d.high.div18 = []; N.high.div18 = 1; d.high.div19 = []; N.high.div19 = 1;
d.high.div20 = []; N.high.div20 = 1; d.high.div21 = []; N.high.div21 = 1;
d.high.div22 = []; N.high.div22 = 1;

% initialize vehicle structure 
d.noC.div10 = []; N.noC.div10 = 1; d.noC.div11 = []; N.noC.div11 = 1;
d.noC.div12 = []; N.noC.div12 = 1; d.noC.div13 = []; N.noC.div13 = 1;
d.noC.div14 = []; N.noC.div14 = 1; d.noC.div15 = []; N.noC.div15 = 1;
d.noC.div16 = []; N.noC.div16 = 1; d.noC.div17 = []; N.noC.div17 = 1;
d.noC.div18 = []; N.noC.div18 = 1; d.noC.div19 = []; N.noC.div19 = 1;
d.noC.div20 = []; N.noC.div20 = 1; d.noC.div21 = []; N.noC.div21 = 1;
d.noC.div22 = []; N.noC.div22 = 1;

d.lowC.div10 = []; N.lowC.div10 = 1; d.lowC.div11 = []; N.lowC.div11 = 1;
d.lowC.div12 = []; N.lowC.div12 = 1; d.lowC.div13 = []; N.lowC.div13 = 1;
d.lowC.div14 = []; N.lowC.div14 = 1; d.lowC.div15 = []; N.lowC.div15 = 1;
d.lowC.div16 = []; N.lowC.div16 = 1; d.lowC.div17 = []; N.lowC.div17 = 1;
d.lowC.div18 = []; N.lowC.div18 = 1; d.lowC.div19 = []; N.lowC.div19 = 1;
d.lowC.div20 = []; N.lowC.div20 = 1; d.lowC.div21 = []; N.lowC.div21 = 1;
d.lowC.div22 = []; N.lowC.div22 = 1;

d.highC.div10 = []; N.highC.div10 = 1; d.highC.div11 = []; N.highC.div11 = 1;
d.highC.div12 = []; N.highC.div12 = 1; d.highC.div13 = []; N.highC.div13 = 1;
d.highC.div14 = []; N.highC.div14 = 1; d.highC.div15 = []; N.highC.div15 = 1;
d.highC.div16 = []; N.highC.div16 = 1; d.highC.div17 = []; N.highC.div17 = 1;
d.highC.div18 = []; N.highC.div18 = 1; d.highC.div19 = []; N.highC.div19 = 1;
d.highC.div20 = []; N.highC.div20 = 1; d.highC.div21 = []; N.highC.div21 = 1;
d.highC.div22 = []; N.highC.div22 = 1;
burstint = [];
for n = 1:length(files)
    
    clc; disp(files(n,1).folder)
    
    load([files(n,1).folder,'\',files(n,1).name])                           % load data
    
    % get characteristics of recording
    grp{n,1} = files(n,1).folder(8:10);                                     % pre-insult condition
    cond{n,1} = files(n,1).folder(12:16);                                   % target condition
    div{n,1} = files(n,1).folder(30:34);                                    % day in vitro
    
    vec = a.bFstart;
    if ~isempty(vec)
        
        clear b
        if length(vec)==1
            b(1) = vec;
        else
            b(1) = vec(1);
            diffInt = diff(vec)>50;
            vec = vec(2:end);
            b = [b, vec(diffInt)'];
        end
        b = length(b);
    
        % populate data structures (i.e., d, nc, nr)
        if grp{n,1} == '4AP'
            if cond{n,1} == '0 non'                                                 % no insult condition
                if div{n,1} == 'DIV10'; d.no.div10 = [d.no.div10, b]; N.no.div10 = N.no.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.no.div11 = [d.no.div11, b]; N.no.div11 = N.no.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.no.div12 = [d.no.div12, b]; N.no.div12 = N.no.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.no.div13 = [d.no.div13, b]; N.no.div13 = N.no.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.no.div14 = [d.no.div14, b]; N.no.div14 = N.no.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.no.div15 = [d.no.div15, b]; N.no.div15 = N.no.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.no.div16 = [d.no.div16, b]; N.no.div16 = N.no.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.no.div17 = [d.no.div17, b]; N.no.div17 = N.no.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.no.div18 = [d.no.div18, b]; N.no.div18 = N.no.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.no.div19 = [d.no.div19, b]; N.no.div19 = N.no.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.no.div20 = [d.no.div20, b]; N.no.div20 = N.no.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.no.div21 = [d.no.div21, b]; N.no.div21 = N.no.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.no.div22 = [d.no.div22, b]; N.no.div22 = N.no.div22 + 1;
                end
            elseif cond{n,1} == '1 low'
                if div{n,1} == 'DIV10'; d.low.div10 = [d.low.div10, b]; N.low.div10 = N.low.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.low.div11 = [d.low.div11, b]; N.low.div11 = N.low.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.low.div12 = [d.low.div12, b]; N.low.div12 = N.low.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.low.div13 = [d.low.div13, b]; N.low.div13 = N.low.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.low.div14 = [d.low.div14, b]; N.low.div14 = N.low.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.low.div15 = [d.low.div15, b]; N.low.div15 = N.low.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.low.div16 = [d.low.div16, b]; N.low.div16 = N.low.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.low.div17 = [d.low.div17, b]; N.low.div17 = N.low.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.low.div18 = [d.low.div18, b]; N.low.div18 = N.low.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.low.div19 = [d.low.div19, b]; N.low.div19 = N.low.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.low.div20 = [d.low.div20, b]; N.low.div20 = N.low.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.low.div21 = [d.low.div21, b]; N.low.div21 = N.low.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.low.div22 = [d.low.div22, b]; N.low.div22 = N.low.div22 + 1;
                end
            elseif cond{n,1} == '2 hig'
                if div{n,1} == 'DIV10'; d.high.div10 = [d.high.div10, b]; N.high.div10 = N.high.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.high.div11 = [d.high.div11, b]; N.high.div11 = N.high.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.high.div12 = [d.high.div12, b]; N.high.div12 = N.high.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.high.div13 = [d.high.div13, b]; N.high.div13 = N.high.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.high.div14 = [d.high.div14, b]; N.high.div14 = N.high.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.high.div15 = [d.high.div15, b]; N.high.div15 = N.high.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.high.div16 = [d.high.div16, b]; N.high.div16 = N.high.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.high.div17 = [d.high.div17, b]; N.high.div17 = N.high.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.high.div18 = [d.high.div18, b]; N.high.div18 = N.high.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.high.div19 = [d.high.div19, b]; N.high.div19 = N.high.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.high.div20 = [d.high.div20, b]; N.high.div20 = N.high.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.high.div21 = [d.high.div21, b]; N.high.div21 = N.high.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.high.div22 = [d.high.div22, b]; N.high.div22 = N.high.div22 + 1;
                end
            end
        elseif grp{n,1} == 'veh'
            if cond{n,1} == '0 non'                                                 % no insult condition
                if div{n,1} == 'DIV10'; d.noC.div10 = [d.noC.div10, b]; N.noC.div10 = N.noC.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.noC.div11 = [d.noC.div11, b]; N.noC.div11 = N.noC.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.noC.div12 = [d.noC.div12, b]; N.noC.div12 = N.noC.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.noC.div13 = [d.noC.div13, b]; N.noC.div13 = N.noC.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.noC.div14 = [d.noC.div14, b]; N.noC.div14 = N.noC.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.noC.div15 = [d.noC.div15, b]; N.noC.div15 = N.noC.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.noC.div16 = [d.noC.div16, b]; N.noC.div16 = N.noC.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.noC.div17 = [d.noC.div17, b]; N.noC.div17 = N.noC.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.noC.div18 = [d.noC.div18, b]; N.noC.div18 = N.noC.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.noC.div19 = [d.noC.div19, b]; N.noC.div19 = N.noC.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.noC.div20 = [d.noC.div20, b]; N.noC.div20 = N.noC.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.noC.div21 = [d.noC.div21, b]; N.noC.div21 = N.noC.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.noC.div22 = [d.noC.div22, b]; N.noC.div22 = N.noC.div22 + 1;
                end
            elseif cond{n,1} == '1 low'
                if div{n,1} == 'DIV10'; d.lowC.div10 = [d.lowC.div10, b]; N.lowC.div10 = N.lowC.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.lowC.div11 = [d.lowC.div11, b]; N.lowC.div11 = N.lowC.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.lowC.div12 = [d.lowC.div12, b]; N.lowC.div12 = N.lowC.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.lowC.div13 = [d.lowC.div13, b]; N.lowC.div13 = N.lowC.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.lowC.div14 = [d.lowC.div14, b]; N.lowC.div14 = N.lowC.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.lowC.div15 = [d.lowC.div15, b]; N.lowC.div15 = N.lowC.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.lowC.div16 = [d.lowC.div16, b]; N.lowC.div16 = N.lowC.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.lowC.div17 = [d.lowC.div17, b]; N.lowC.div17 = N.lowC.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.lowC.div18 = [d.lowC.div18, b]; N.lowC.div18 = N.lowC.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.lowC.div19 = [d.lowC.div19, b]; N.lowC.div19 = N.lowC.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.lowC.div20 = [d.lowC.div20, b]; N.lowC.div20 = N.lowC.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.lowC.div21 = [d.lowC.div21, b]; N.lowC.div21 = N.lowC.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.lowC.div22 = [d.lowC.div22, b]; N.lowC.div22 = N.lowC.div22 + 1;
                end
            elseif cond{n,1} == '2 hig'
                if div{n,1} == 'DIV10'; d.highC.div10 = [d.highC.div10, b]; N.highC.div10 = N.highC.div10 + 1;
                elseif div{n,1} == 'DIV11'; d.highC.div11 = [d.highC.div11, b]; N.highC.div11 = N.highC.div11 + 1;
                elseif div{n,1} == 'DIV12'; d.highC.div12 = [d.highC.div12, b]; N.highC.div12 = N.highC.div12 + 1;
                elseif div{n,1} == 'DIV13'; d.highC.div13 = [d.highC.div13, b]; N.highC.div13 = N.highC.div13 + 1;
                elseif div{n,1} == 'DIV14'; d.highC.div14 = [d.highC.div14, b]; N.highC.div14 = N.highC.div14 + 1;
                elseif div{n,1} == 'DIV15'; d.highC.div15 = [d.highC.div15, b]; N.highC.div15 = N.highC.div15 + 1;
                elseif div{n,1} == 'DIV16'; d.highC.div16 = [d.highC.div16, b]; N.highC.div16 = N.highC.div16 + 1;
                elseif div{n,1} == 'DIV17'; d.highC.div17 = [d.highC.div17, b]; N.highC.div17 = N.highC.div17 + 1;
                elseif div{n,1} == 'DIV18'; d.highC.div18 = [d.highC.div18, b]; N.highC.div18 = N.highC.div18 + 1;
                elseif div{n,1} == 'DIV19'; d.highC.div19 = [d.highC.div19, b]; N.highC.div19 = N.highC.div19 + 1;
                elseif div{n,1} == 'DIV20'; d.highC.div20 = [d.highC.div20, b]; N.highC.div20 = N.highC.div20 + 1;
                elseif div{n,1} == 'DIV21'; d.highC.div21 = [d.highC.div21, b]; N.highC.div21 = N.highC.div21 + 1;
                elseif div{n,1} == 'DIV22'; d.highC.div22 = [d.highC.div22, b]; N.highC.div22 = N.highC.div22 + 1;
                end
            end
        end
    end
end

plotBursts

comparisons