%{

go_AVALANCHES

%}

%% MATLAB commands
clc;
close all;
clear all;
warning off all;
format long;

%% Avalanche parameters
magnitude = 100;

%% Histogram parameters
color_vec = [0 0 0];	
edge_color = 'w';


Folder(1).name = 'I:\Grouped Data\No Trtmnt\';							% current data set
Folder(2).name = 'I:\Grouped Data\DMSO\';								% current data set
Folder(3).name = 'I:\Grouped Data\DMSO w insult\';						% current data set
% Folder(4).name = 'I:\Grouped Data\4AP w insult\';						% current data set
% Folder(5).name = 'I:\Grouped Data\4AP\';								% current data set

disp('Beginning avalanche analysis...')			% display

for conditions = 1:5
	%% Save directory information
	if conditions == 1
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 2
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 3
		saverF = 'insult (DMSO w Ouabain TBOA)\';
	% elseif conditions == 4
		% saverF = 'insult (4AP w Ouabain TBOA)\';
	% elseif conditions == 5
		% saverF = '4AP';
	end
	
	%% PRIMARY LOOP
	%% iterates over all MEA folders in grouped folders
	dataFolder = Folder(conditions).name; 
	cd(dataFolder);														% set directory to data
	d = dir(dataFolder);
	isub = [d(:).isdir]; 											% # returns logical vector
	nameFolds = {d(isub).name};
	nameFolds(ismember(nameFolds,{'.','..'})) = [];
	for kk = 1:length(nameFolds)
		
		%% Directory information
		cd(dataFolder)
		CURRpathNAME = nameFolds{kk};
		cd(CURRpathNAME)
		all_namesMAT = dir ('*.mat');								% get all file names

		%% Save folder information
		savefolder = ['I:\avalanche data\',saverF,CURRpathNAME];	% define save folder
		mkdir(savefolder);											% create save folder			
		% mkdir([savefolder '\pajs\']);								% create .paj file folder
		mkdir([savefolder '\tiffs\']);								% create .tif file folder
		% mkdir([savefolder '\figures\']);							% create .fig file folder
		% mkdir([savefolder '\connectivity\']);						% create functional network file folder

		%% SECONDARY LOOP -iterates across all recordings in the folder
		for i = 1:size(all_namesMAT)								% for each of the files (line 18)
			
			%% Directory information
			cd([dataFolder,CURRpathNAME])
			disp([' Current file name: ',all_namesMAT(i).name]);	% display file name
			tic														% begin counting duration of analysis
			FileNAME = all_namesMAT(i).name;
			load(FileNAME);								% load i_th file
			
			%% Spiking activity
			sp = StoresSP;											% store spike data
			[N T] = size(sp);										% matrix dimensions
			if N == 64
				sp = sp(setdiff(1:N,[1 5 8 57 64]),:);				% remove empty channels
			end
			[N T] = size(sp);										% matrix dimensions
			SP = sum(sp(:,:)')' / 1000;								% compute spike rate (Hz)
			SP = Outliers3(SP);										% remove outliers from data
			sp(find(SP==0),:) = 0;									% remove outliers from spike data
			sigma = ParaSigma(sp);									% compute sigma (branching parameter)
           
            % Avalanche detection
            s = sum(sp);
            fd = find(diff(s)>0);
            duration = [];
            numCells = [];
            numEvents = [];
            for k = 1:length(fd)
                start=fd(k);
                if start+1 >= length(s)
                    break;
                else
                    f = find(s(start+1:end)==0);
                end
                if ~isempty(f)
                    finish = f(1)+start;
                    duration = [duration finish-start];
                    numCells = [numCells length(find(s(:,start:finish))>0)];
                    numEvents = [numEvents sum(s(:,start:finish))];
                else
                    break;
                end
            end
            
			FigHandle = figure('Position', [200, 200, 600, 300]);
			subplot(1,2,1)
			% hist(numCells);
			% h = findobj(gca,'Type','patch');
			% set(h,'FaceColor',color_vec,'EdgeColor',edge_color)
			% axis tight;
			m_min = min(numCells);
			m_max = max(numCells);
			L = linspace(m_min,m_max,magnitude);
			H = histc(numCells,L)+1;
			loglog(H,'k','LineWidth',2)
			axis tight
			set(gca,'FontSize',8);
			xlabel('# of channels','FontSize',8);
			ylabel('p','FontSize',8);
			title('Channels Active During','Color','k','FontSize',12);
			box off;
			
			subplot(1,2,2)
			% hist(numEvents);
			% h = findobj(gca,'Type','patch');
			% set(h,'FaceColor',color_vec,'EdgeColor',edge_color)
			% axis tight;
			m_min = min(numEvents);
			m_max = max(numEvents);
			L = linspace(m_min,m_max,magnitude);
			H = histc(numEvents,L)+1;
			loglog(H,'k','LineWidth',2)
			axis tight
			set(gca,'FontSize',8);
			xlabel('# of avalanches','FontSize',10);
			ylabel('p','FontSize',10);
			title('Avalanches During Recording','Color','k','FontSize',12);
			box off;
			
			%% Save histogram figure
			cd([savefolder '\tiffs\']);
			[im, alpha] = export_fig(FileNAME,'-tif','-transparent','-r300');
			
			%% Save data
			saveMeanFile = [FileNAME(1:size(FileNAME,2)-4),'AVLdata'];	
			cd(savefolder);													% switch to save folder	
			save(saveMeanFile,'sigma','SP','numEvents','numCells');			% saved avalanche stats	

			%% Duration of analyses
			Duration = toc/60;												% duration of folder analysis 
			StoreDuration(i) = Duration;									% store duration
			disp(['	Analysis duration: ~',int2str(Duration),' minutes'])	% display duration	
			close all	
        end
    end
end