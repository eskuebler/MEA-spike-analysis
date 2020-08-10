function B = getBursts(SP,FilePath)

% free parameters
smoothWin = 200;                            % Gaussian window
NbBoots = 200;                              % number of bootstraps

SP = downsampleSP(SP,10,0);                 % downsample spiking activity
sp = smoothdata(sum(SP),'gaussian',smoothWin);

% parameters
[N,T] = size(SP);                           % dimensions

% initialize
sum_sp = [];                                % initialize
for boots = 1:NbBoots                       % for each randomization
    sp_rp = zeros(N,T);                     % initialize matrix for shuffled
    parfor n = 1:N                          % for each cell
        sp_rp(n,:) = SP(n,randperm(T));     % shuffled spikes
    end
    sum_sp = [sum_sp, smoothdata(sum(sp_rp),'gaussian',smoothWin)]; % sum of randomized sp
end
in = sum_sp~=0;                             % non-zero time-points==1
threshold = prctile(sum_sp(in),99);         % compute threshold
B = sp > threshold;                         % burst detection

figure('Position',[50 50 300 150]); 
set(gcf,'color','w');
hold on
h=histogram(sum_sp(in),50,'FaceColor', [0.5 0.5 0.5],'Normalization','probability');
plot([threshold,threshold],[0,max(h.Values)],'r')
axis tight
xlabel('rand voltage')
ylabel('probability')
export_fig([FilePath,'\','burst boots histo'],'-pdf','-r100')
close 

figure('Position',[50 50 300 150]); 
set(gcf,'color','w');
hold on
plot([1,T],[threshold,threshold],'r')
plot(sp,'k')
axis tight
xlabel('time')
ylabel('sum of spikes')
export_fig([FilePath,'\','bursts'],'-pdf','-r100')
close