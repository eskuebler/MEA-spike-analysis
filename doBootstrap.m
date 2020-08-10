% bootstrap reshuffle and burst detection
function [Fcenter,Fstart,Fend,Amp] = doBootstrap ...
    (binary_ts,flagTrim,totalSteps,pc_over,FilePath)

% binary_ts: your raster
% flagTrim: don't worry about that one - but try "true" if all else fails
% totalSteps: total number of times you want to run the bootstrap 
% pc_over: percentage of random data below threshold (for p<0.01, set to 99)

% free params
smoothWin = 500;

N = size(binary_ts,1);
if(flagTrim)
    binary_ts = downsampleSP(binary_ts,10,0);    % downsample by a factor
end
sumBin = smoothdata(sum(binary_ts),'gaussian',smoothWin);

% bootstraps
for step = 1:totalSteps
    disp(['bootstrap step: ' int2str(step)])
    binary_ts_shuffled = zeros(size(binary_ts));
    parfor i = 1:N
        binary_ts_shuffled(i,:) = shuffle(binary_ts(i,:));
    end
    sum_bin = smoothdata(sum(binary_ts_shuffled),'gaussian',smoothWin);
    tt = sum(sum_bin > 0);
    confidence_limit(step) = 0;
    pover = 0;
    while(pover<=pc_over)
        confidence_limit(step) = confidence_limit(step) + 0.001;
        I = find(sum_bin >= confidence_limit(step));
        pover = 100-(100*(length(I) / tt));
%         pover = 100*(length(I) / length(sum_bin));
    end
end
avg_confidence_limit = mean(confidence_limit);

% find times where synch exceeds confidence threshold
F = find(sumBin>avg_confidence_limit);
D = diff(F);
F2 = find(D>1);
F2 = [1 (F2)+1];
Amp = zeros(length(F2)-1,1);
Fcenter = zeros(length(F2)-1,1);
Fstart = zeros(length(F2)-1,1);
Fend = zeros(length(F2)-1,1);
for i = 2:length(F2)
    Fcenter(i-1) = F(F2(i-1)) + ceil((F(F2(i)-1) - F(F2(i-1)))/2);
    Fstart(i-1) = F(F2(i-1));
    Fend(i-1) = F(F2(i-1)) + ceil((F(F2(i)-1) - F(F2(i-1))));
    b1 = F(F2(i)-1);
    b2 = F(F2(i-1));
    Amp(i-1) = max(sumBin(b2:b1));
end

figure('Position',[50 50 300 150]); 
set(gcf,'color','w');
hold on
plot([1,length(sumBin)],[avg_confidence_limit,avg_confidence_limit],'r')
plot(sumBin,'k')
axis tight
xlabel('time')
ylabel('sum of spikes')
export_fig([FilePath,'\','bursts'],'-pdf','-r100')
close