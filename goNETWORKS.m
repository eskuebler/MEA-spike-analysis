%{

goNETWORKS.m

version: 1.0
author: ESK (eric.s.kuebler@gmail.com)

Detects functional and effective networks, and computes some statistics.
Can be run after goRasters.m
Brain connectivity toolbox must be on MATLAB path.

%}

%% MATLAB commands
clc;
close all;
clear all;
warning off all;
format long;

%% Bootstrap parameters
B_ccs = 100;								% cross correlation bootstraps 
Window = 50000;
ds_factor = 10;								% down-sample factor (for burst detection)
ms_prior = 1;								% ms before burst (for leader detection)
CritAlive = 2; 	
S = distanceMatrix(200,64);					% physical distance matrix

%% Data folder parameters
Folder(1).name = 'I:\Grouped Data\No Trtmnt\';							% current data set
Folder(2).name = 'I:\Grouped Data\DMSO\';								% current data set
Folder(3).name = 'I:\Grouped Data\DMSO w insult\';						% current data set
Folder(4).name = 'I:\Grouped Data\4AP w insult\';						% current data set
Folder(5).name = 'I:\Grouped Data\4AP\';								% current data set

disp('Beginning network analysis...')			% display

for conditions = 1:5
	%% Save directory information
	if conditions == 1
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 2
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 3
		saverF = 'insult (DMSO w Ouabain TBOA)\';
	elseif conditions == 4
		saverF = 'insult (4AP w Ouabain TBOA)\';
	elseif conditions == 5
		saverF = '4AP';
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
		savefolder = ['I:\network data (full)\',saverF,CURRpathNAME];	% define save folder
		mkdir(savefolder);											% create save folder			
		% mkdir([savefolder '\pajs\']);								% create .paj file folder
		mkdir([savefolder '\tiffs\']);								% create .tif file folder
		mkdir([savefolder '\figures\']);							% create .fig file folder
		% mkdir([savefolder '\connectivity\']);						% create functional network file folder
		FigHandle = figure('Position', [100, 100, 1800, 300]);

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
			
			%% CROSS-CORRELATION FUNCTION
			% C(:,:,i) = crossCORRS(sp,B_ccs);												% functional net
			% k_CC(:,i) = degrees_und(C(:,:,i))';											% k
			% b_CC(:,i) = betweenness_wei(C(:,:,i))';										% centrality
			% [KDensity(i),Nodes(i),Edges(i)] = density_dir(C(:,:,i)); 					% density
			
			%% TRANSER ENTROPY FUNCTION
			TE(:,:,i) = transferEntropy(sp,1);											% effective net
			[in_k_TE(:,i),out_k_TE(:,i),k_TE(:,i)] = degrees_dir(TE(:,:,i));			% k 
			b_TE(:,i) = betweenness_wei(TE(:,:,i));										% centrality
			[kDensity_TE(i),Nodes_TE(i),Edges_TE(i)] = density_dir(TE(:,:,i)); 			% density
			
			% subplot(2,size(all_namesMAT,1),i)
			% imagesc (C(:,:,i));												
			% colormap(hot);
			% set(gca,'FontSize',8);	
			% xlabel('channel','FontSize',10);
			% ylabel('channel','FontSize',10);
			% title(FileNAME,'FontSize',12);
			
			subplot(1,size(all_namesMAT,1),i)
			imagesc (TE(:,:,i));												
			colormap(hot);
			set(gca,'FontSize',8);	
			% xlabel('channel','FontSize',10);
			% ylabel('channel','FontSize',10);
			colorbar
		end
		
		cd([savefolder '\figures\'])
		FilePath2 = strcat(savefolder,'\figures\',FileNAME(1:size(FileNAME,2)-4),'Networks.fig'); 			% save path for figures
		saveas(FigHandle,FilePath2);	
		
		cd([savefolder '\tiffs\'])
		[im, alpha] = export_fig(FileNAME,'-tif','-transparent','-r300'); 
			
		saveMeanFile = [FileNAME(1:size(FileNAME,2)-4),'data'];	
		cd(savefolder);											% switch to save folder	
		save(saveMeanFile,'sigma','SP','TE',...
		 'in_k_TE','out_k_TE','k_TE','b_TE','kDensity_TE');		% saved connectivity stats	

		%% Duration of analyses
		Duration = toc/60;												% duration of folder analysis 
		StoreDuration(i) = Duration;									% store duration
		disp(['	Analysis duration: ~',int2str(Duration),' minutes'])	% display duration	
		close all	
	end
end