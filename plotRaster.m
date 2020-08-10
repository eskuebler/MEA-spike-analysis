function plotRaster(SP,tVec,FilePath)

tVec = tVec/1000/60;

figure('Position',[50 50 300 150]); set(gcf,'color','w');
hold on
for n = 1:size(SP,1)
    spT = find(SP(n,:)==1);
    scatter(tVec(spT),zeros(length(spT),1)+n,1,'filled','k')
end
box off
xlim([1 tVec(end)])
ylim([1 size(SP,1)])
xlabel('time (minutes)')
ylabel('electrodes')
export_fig([FilePath,'\','raster'],'-pdf','-r100')
close

figure('Position',[50 50 300 150]); set(gcf,'color','w');
histogram(sum(SP,2),15,'FaceColor','k','Normalization','probability');
box off
axis tight
xlabel('# of spikes')
ylabel('probability')
export_fig([FilePath,'\','rates'],'-pdf','-r100')
close