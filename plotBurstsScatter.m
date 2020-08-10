%{
plotBursts
%}

clc; close all;

colVec = [0.75,0.75,0.75];
yHeight = 400;

div10vec = [d.no.div10,d.low.div10,d.high.div10,d.noC.div10,d.lowC.div10,d.highC.div10];
div11vec = [d.no.div11,d.low.div11,d.high.div11,d.noC.div11,d.lowC.div11,d.highC.div11];

DataArray = nan(max(length(div10vec),length(div11vec)),2);
DataArray(1:length(div10vec),1) = div10vec;
DataArray(1:length(div11vec),2) = div11vec;

figure('Position',[50 50 120 160]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'10','11'},'MarkerFaceColor',[0,0,0;0,0,0],'PointSize',10);
xlabel('day in vitro')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div10_11 scatter','-pdf','-r600')
close

div14vec = [d.no.div14,d.low.div14,d.high.div14];
div15vec = [d.no.div15,d.low.div15,d.high.div15];
div16vec = [d.no.div16,d.low.div16,d.high.div16];
div17vec = [d.no.div17,d.low.div17,d.high.div17];

div14Cvec = [d.noC.div14,d.lowC.div14,d.highC.div14];
div15Cvec = [d.noC.div15,d.lowC.div15,d.highC.div15];
div16Cvec = [d.noC.div16,d.lowC.div16,d.highC.div16];
div17Cvec = [d.noC.div17,d.lowC.div17,d.highC.div17];

DataArray = nan(max([length(div14vec),length(div15vec),length(div16vec),length(div17vec)]),4);
DataArray(1:length(div14vec),1) = div14vec;
DataArray(1:length(div15vec),2) = div15vec;
DataArray(1:length(div16vec),3) = div16vec;
DataArray(1:length(div17vec),4) = div17vec;

figure('Position',[50 50 200 160]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'14','15','16','17'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0;0,0,0],'PointSize',10);
title('preconditioned')
xlabel('day in vitro')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div14_15_16_17 precond scatter','-pdf','-r600')
close

DataArray = nan(max([length(div14Cvec),length(div15Cvec),length(div16Cvec),length(div17Cvec)]),4);
DataArray(1:length(div14Cvec),1) = div14Cvec;
DataArray(1:length(div15Cvec),2) = div15Cvec;
DataArray(1:length(div16Cvec),3) = div16Cvec;
DataArray(1:length(div17Cvec),4) = div17Cvec;

figure('Position',[50 50 200 160]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'14','15','16','17'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0;0,0,0],'PointSize',10);
title('vehicle')
xlabel('day in vitro')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div14_15_16_17 vehicle scatter','-pdf','-r600')
close

yHeight = 225;

DataArray = nan(max([length(d.no.div18),length(d.low.div18),length(d.high.div18)]),3);
DataArray(1:length(d.no.div18),1) = d.no.div18;
DataArray(1:length(d.low.div18),2) = d.low.div18;
DataArray(1:length(d.high.div18),3) = d.high.div18;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('preconditioned')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div18 precond scatter','-pdf','-r600')
close

DataArray = nan(max([length(d.noC.div18),length(d.lowC.div18),length(d.highC.div18)]),3);
DataArray(1:length(d.noC.div18),1) = d.noC.div18;
DataArray(1:length(d.lowC.div18),2) = d.lowC.div18;
DataArray(1:length(d.highC.div18),3) = d.highC.div18;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('vehicle')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div18 vehicle scatter','-pdf','-r600')
close

DataArray = nan(max([length(d.no.div21),length(d.low.div21),length(d.high.div21)]),3);
DataArray(1:length(d.no.div21),1) = d.no.div21;
DataArray(1:length(d.low.div21),2) = d.low.div21;
DataArray(1:length(d.high.div21),3) = d.high.div21;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('preconditioned')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div21 precond scatter','-pdf','-r600')
close

DataArray = nan(max([length(d.noC.div21),length(d.lowC.div21),length(d.highC.div21)]),3);
DataArray(1:length(d.noC.div21),1) = d.noC.div21;
DataArray(1:length(d.lowC.div21),2) = d.lowC.div21;
DataArray(1:length(d.highC.div21),3) = d.highC.div21;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('vehicle')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div21 vehicle scatter','-pdf','-r600')
close

DataArray = nan(max([length(d.no.div22),length(d.low.div22),length(d.high.div22)]),3);
DataArray(1:length(d.no.div22),1) = d.no.div22;
DataArray(1:length(d.low.div22),2) = d.low.div22;
DataArray(1:length(d.high.div22),3) = d.high.div22;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('preconditioned')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div22 precond scatter','-pdf','-r600')
close

DataArray = nan(max([length(d.noC.div22),length(d.lowC.div22),length(d.highC.div22)]),3);
DataArray(1:length(d.noC.div22),1) = d.noC.div22;
DataArray(1:length(d.lowC.div22),2) = d.lowC.div22;
DataArray(1:length(d.highC.div22),3) = d.highC.div22;

figure('Position',[50 50 150 140]); set(gcf,'color','w');
UnivarScatter(DataArray,'Label',{'none','low','high'},'MarkerFaceColor',[0,0,0;0,0,0;0,0,0],'PointSize',10);
title('vehicle')
xlabel('level of neuronal insult')
ylabel('# of bursts')
box off
axis tight
ylim([0 yHeight])
export_fig('untitled_div22 vehicle scatter','-pdf','-r600')
close