%this version uses a pre-existing confidence interval to calculate NSs
function [Fcenter,Fbeginning,Fend,Amp] = doBootstrap2(binary_ts,conf,FilePath)

% N = size(binary_ts,1);
T = size(binary_ts,2);

sumBin = sum(binary_ts);

%find times where synch exceeds confidence threshold
F = find(sumBin>conf);
D = diff(F);
F2 = find(D>1);
F2 = [1 (F2)+1];
Amp = zeros(length(F2)-1,1);
Fcenter = zeros(length(F2)-1,1);
Fbeginning = zeros(length(F2)-1,1);
Fend = zeros(length(F2)-1,1);
for i = 2:length(F2)
    Fcenter(i-1) = F(F2(i-1)) + ceil((F(F2(i)-1) - F(F2(i-1)))/2);
    Fbeginning(i-1) = F(F2(i-1));
    Fend(i-1) = F(F2(i-1)) + ceil((F(F2(i)-1) - F(F2(i-1))));
    b1 = F(F2(i)-1);
    b2 = F(F2(i-1));
    Amp(i-1) = max(sumBin(b2:b1));
end

figure('Position',[50 50 300 150]); 
set(gcf,'color','w');
hold on
plot([1,T],[conf,conf],'r')
plot(sumBin,'k')
axis tight
xlabel('time')
ylabel('sum of spikes')
export_fig([FilePath,'\','bursts'],'-pdf','-r100')
close

