%{
getBurstInterval
%}

Xds = downsampleSP(sum(a.SP),10,0);

figure('Position',[50 50 200 140]); set(gcf,'color','w');
hold on
plot(Xds)
plot(a.bursts,'linewidth',1)
xlabel('time')
ylabel('# of spikes')
axis tight
ylim([0 8])
pause(0.75)
close

burstT = find(a.bursts==1);
diffPutTime = diff(burstT);                                           % intervals between putative APs
putBurstT = [];
tag = 1;
dCount = 1;
for i = 1:length(burstT)-1
	if diffPutTime(i) ~= 1
		int4Peak{dCount} = burstT(tag):burstT(i);
		putBurstT(dCount) = burstT(tag);
		tag = i+1;
		dCount = dCount + 1;                                                % count of intervals
	end
end
int4Peak{dCount} = burstT(tag):burstT(end);
putBurstT(dCount) = burstT(tag);
clear diffPutAPTime tag dCount i

inds2remove = [];
Z = 1:length(putBurstT);
ind2keep = find(~ismember(Z,inds2remove)==1);

putBurstT = putBurstT(ind2keep);

dCount = 1;
int4Peak2 = [];
for i = ind2keep
	int4Peak2{dCount} = int4Peak{i};
    if length(int4Peak2{dCount})==1
        figure('Position',[50 50 200 140]); set(gcf,'color','w');
        hold on
        plot(Xds(int4Peak2{dCount}-100:int4Peak2{dCount}+100))
        plot(a.bursts(int4Peak2{dCount}-100:int4Peak2{dCount}+100),'linewidth',1)
        xlabel('time')
        ylabel('# of spikes')
        axis tight
        ylim([0 8])
        close
    end
    dCount = dCount + 1;
end

