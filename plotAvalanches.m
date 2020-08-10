function aval = plotAvalanches(SP,FilePath)

s = sum(SP);                                                                % sum of spiking across time
fd = find(diff(s)>0);                                                       % find times where diff b/w events > 0
d = []; nC = []; nE = [];                                                   % initialize
for k = 1:length(fd)                                                        % for each event
    start = fd(k);                                                          % beginning of event
    if start+1 >= length(s)                                                 % 
        break;
    else
        f = find(s(start+1:end)==0);                                        % 
    end
    if ~isempty(f)
        finish = f(1)+start;                                                % account for indexing at start
        d = [d, (finish-start)];                                            % duration of event
        nC = [nC, length(find(s(:,start:finish))>0)];                       % sum of cells
        nE = [nE, sum(s(:,start:finish))];                                  % sum of spikes
    else
        break;
    end
end

figure('Position',[50 50 500 150]); set(gcf,'color','w');
subplot(1,3,1)
histogram(d);
xlabel('duration (ms)','FontSize',8);
ylabel('count','FontSize',8);
box off;

subplot(1,3,2)
histogram(nC);
xlabel('# of channels','FontSize',8);
ylabel('count','FontSize',8);
box off;

subplot(1,3,3)
histogram(nE);
xlabel('# of spikes','FontSize',10);
ylabel('count','FontSize',10);
box off;

export_fig([FilePath,'\','aval'],'-pdf','-r100')
close

aval.d = d;
aval.nC = nC;
aval.nE = nE;