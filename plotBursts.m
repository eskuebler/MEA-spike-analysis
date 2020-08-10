%{
plotBursts
%}

clc; close all;

colVec = [0.75,0.75,0.75];
yHeight = 275;

div10vec = [d.no.div10,d.low.div10,d.high.div10,d.noC.div10,d.lowC.div10,d.highC.div10];
div11vec = [d.no.div11,d.low.div11,d.high.div11,d.noC.div11,d.lowC.div11,d.highC.div11];

Pdiv10n11 = wilcoxonCumul(div10vec,div11vec); close

figure('Position',[50 50 120 140]); set(gcf,'color','w');
bar([mean(div10vec),mean(div11vec)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:2,[mean(div10vec),mean(div11vec)],...
    [std(div10vec)/sqrt(length(div10vec)),std(div11vec)/sqrt(length(div11vec))], ...
    [std(div10vec)/sqrt(length(div10vec)),std(div11vec)/sqrt(length(div11vec))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
xticks(1:2)
xticklabels({'10','11'})
xlabel('day in vitro')
ylabel('# of bursts')
box off
xlim([0.5 2.5])
ylim([0 yHeight])
export_fig('untitled_div10_11','-pdf','-r600')
close

div14vec = [d.no.div14,d.low.div14,d.high.div14]; close
div15vec = [d.no.div15,d.low.div15,d.high.div15]; close
div16vec = [d.no.div16,d.low.div16,d.high.div16]; close
div17vec = [d.no.div17,d.low.div17,d.high.div17]; close

div14Cvec = [d.noC.div14,d.lowC.div14,d.highC.div14]; close
div15Cvec = [d.noC.div15,d.lowC.div15,d.highC.div15]; close
div16Cvec = [d.noC.div16,d.lowC.div16,d.highC.div16]; close
div17Cvec = [d.noC.div17,d.lowC.div17,d.highC.div17]; close

Pdiv10n11to14vehicle = wilcoxonCumul([div10vec,div11vec],div14Cvec); close

Pdiv14 = wilcoxonCumul(div14Cvec,div14vec); close
Pdiv15 = wilcoxonCumul(div15Cvec,div15vec); close
Pdiv16 = wilcoxonCumul(div16Cvec,div16vec); close
Pdiv17 = wilcoxonCumul(div17Cvec,div17vec); close

figure('Position',[50 50 200 160]); set(gcf,'color','w');
bar([mean(div14vec),mean(div15vec),mean(div16vec),mean(div17vec)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:4,[mean(div14vec),mean(div15vec),mean(div16vec),mean(div17vec)],...
    [std(div14vec)/sqrt(length(div14vec)),std(div15vec)/sqrt(length(div15vec)),std(div16vec)/sqrt(length(div16vec)),std(div17vec)/sqrt(length(div17vec))], ...
    [std(div14vec)/sqrt(length(div14vec)),std(div15vec)/sqrt(length(div15vec)),std(div16vec)/sqrt(length(div16vec)),std(div17vec)/sqrt(length(div17vec))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('preconditioned')
xticks(1:4)
xticklabels({'14','15','16','17'})
xlabel('day in vitro')
ylabel('# of bursts')
box off
xlim([0.5 4.5])
ylim([0 yHeight])
export_fig('untitled_div14_15_16_17 precond','-pdf','-r600')
close

figure('Position',[50 50 200 160]); set(gcf,'color','w');
bar([mean(div14Cvec),mean(div15Cvec),mean(div16Cvec),mean(div17Cvec)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:4,[mean(div14Cvec),mean(div15Cvec),mean(div16Cvec),mean(div17Cvec)],...
    [std(div14Cvec)/sqrt(length(div14Cvec)),std(div15Cvec)/sqrt(length(div15Cvec)),std(div16Cvec)/sqrt(length(div16Cvec)),std(div17Cvec)/sqrt(length(div17Cvec))], ...
    [std(div14Cvec)/sqrt(length(div14Cvec)),std(div15Cvec)/sqrt(length(div15Cvec)),std(div16Cvec)/sqrt(length(div16Cvec)),std(div17Cvec)/sqrt(length(div17Cvec))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('vehicle')
xticks(1:4)
xticklabels({'14','15','16','17'})
xlabel('day in vitro')
ylabel('# of bursts')
box off
xlim([0.5 4.5])
ylim([0 yHeight])
export_fig('untitled_div14_15_16_17 vehicle','-pdf','-r600')
close

yHeight = 185;

Pdiv18no = wilcoxonCumul(d.no.div18,d.noC.div18); close
Pdiv18low = wilcoxonCumul(d.low.div18,d.lowC.div18); close
Pdiv18high = wilcoxonCumul(d.high.div18,d.highC.div18); close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.no.div18),nanmean(d.low.div18),nanmean(d.high.div18)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.no.div18),nanmean(d.low.div18),nanmean(d.high.div18)],...
    [nanstd(d.no.div18)/sqrt(length(d.no.div18)),nanstd(d.low.div18)/sqrt(length(d.low.div18)),nanstd(d.high.div18)/sqrt(length(d.high.div18))], ...
    [nanstd(d.no.div18)/sqrt(length(d.no.div18)),nanstd(d.low.div18)/sqrt(length(d.low.div18)),nanstd(d.high.div18)/sqrt(length(d.high.div18))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('preconditioned')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div18 precond','-pdf','-r600')
close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.noC.div18),nanmean(d.lowC.div18),nanmean(d.highC.div18)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.noC.div18),nanmean(d.lowC.div18),nanmean(d.highC.div18)],...
    [nanstd(d.noC.div18)/sqrt(length(d.noC.div18)),nanstd(d.lowC.div18)/sqrt(length(d.lowC.div18)),nanstd(d.highC.div18)/sqrt(length(d.highC.div18))], ...
    [nanstd(d.noC.div18)/sqrt(length(d.noC.div18)),nanstd(d.lowC.div18)/sqrt(length(d.lowC.div18)),nanstd(d.highC.div18)/sqrt(length(d.highC.div18))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('vehicle')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div18 vehicle','-pdf','-r600')
close

% Pdiv21no = wilcoxonCumul(d.no.div21,d.noC.div21); close
Pdiv21low = wilcoxonCumul(d.low.div21,d.lowC.div21); close
% Pdiv21high = wilcoxonCumul(d.high.div21,d.highC.div21); close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.no.div21),nanmean(d.low.div21),nanmean(d.high.div21)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.no.div21),nanmean(d.low.div21),nanmean(d.high.div21)],...
    [nanstd(d.no.div21)/sqrt(length(d.no.div21)),nanstd(d.low.div21)/sqrt(length(d.low.div21)),nanstd(d.high.div21)/sqrt(length(d.high.div21))], ...
    [nanstd(d.no.div21)/sqrt(length(d.no.div21)),nanstd(d.low.div21)/sqrt(length(d.low.div21)),nanstd(d.high.div21)/sqrt(length(d.high.div21))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('preconditioned')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div21 precond','-pdf','-r600')
close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.noC.div21),nanmean(d.lowC.div21),nanmean(d.highC.div21)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.noC.div21),nanmean(d.lowC.div21),nanmean(d.highC.div21)],...
    [nanstd(d.noC.div21)/sqrt(length(d.noC.div21)),nanstd(d.lowC.div21)/sqrt(length(d.lowC.div21)),nanstd(d.highC.div21)/sqrt(length(d.highC.div21))], ...
    [nanstd(d.noC.div21)/sqrt(length(d.noC.div21)),nanstd(d.lowC.div21)/sqrt(length(d.lowC.div21)),nanstd(d.highC.div21)/sqrt(length(d.highC.div21))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('vehicle')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div21 vehicle','-pdf','-r600')
close

% Pdiv22no = wilcoxonCumul(d.no.div22,d.noC.div22); close
Pdiv22low = wilcoxonCumul(d.low.div22,d.lowC.div22); close
% Pdiv22high = wilcoxonCumul(d.high.div22,d.highC.div22); close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.no.div22),nanmean(d.low.div22),nanmean(d.high.div22)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.no.div22),nanmean(d.low.div22),nanmean(d.high.div22)],...
    [nanstd(d.no.div22)/sqrt(length(d.no.div22)),nanstd(d.low.div22)/sqrt(length(d.low.div22)),nanstd(d.high.div22)/sqrt(length(d.high.div22))], ...
    [nanstd(d.no.div22)/sqrt(length(d.no.div22)),nanstd(d.low.div22)/sqrt(length(d.low.div22)),nanstd(d.high.div22)/sqrt(length(d.high.div22))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('preconditioned')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div22 precond','-pdf','-r600')
close

figure('Position',[50 50 150 140]); set(gcf,'color','w');
bar([nanmean(d.noC.div22),nanmean(d.lowC.div22),nanmean(d.highC.div22)],'FaceColor',colVec,'EdgeColor',[0 0 0],'LineWidth',0.5)
hold on
er = errorbar(1:3,[nanmean(d.noC.div22),nanmean(d.lowC.div22),nanmean(d.highC.div22)],...
    [nanstd(d.noC.div22)/sqrt(length(d.noC.div22)),nanstd(d.lowC.div22)/sqrt(length(d.lowC.div22)),nanstd(d.highC.div22)/sqrt(length(d.highC.div22))], ...
    [nanstd(d.noC.div22)/sqrt(length(d.noC.div22)),nanstd(d.lowC.div22)/sqrt(length(d.lowC.div22)),nanstd(d.highC.div22)/sqrt(length(d.highC.div22))]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
title('vehicle')
xticks(1:3)
xticklabels({'none','low','high'})
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
xlim([0.5 3.5])
ylim([0 yHeight])
% xtickangle(20)
export_fig('untitled_div22 vehicle','-pdf','-r600')
close