% goSTATS.m
%
% version: 1.0
% author: ESK (eric.s.kuebler@gmail.com)
%
% prior to running this script:
% [1] download the Spiking Variability Toolbox and put it on the Matlab path
% [2] run goRASTERS.m


%% MATLAB commands
clc;
close all;
clear all;
warning off all;
format long;

%% Bootstrap parameters
maxISI = 1000000;												% ISI upper limit
minHz = 1;													% coherence lower limit
Hz_rez = 1;													% coherence resolution
maxHz = 100;												% coherence upper limit

disp('Beginning spiking variability analysis...')			% display

S = distanceMatrix(200,64);		% physical distance matrix
% disp(['Cells used for interactions: ',int2str(NumCells+1)]);
Folder(1).name = 'I:\Grouped Data\No Trtmnt\';							% current data set
Folder(2).name = 'I:\Grouped Data\DMSO\';								% current data set
Folder(3).name = 'I:\Grouped Data\DMSO w insult\';						% current data set

for conditions = 1:3

	%% Save directory information
	if conditions == 1
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 2
		saverF = 'control (DMSO & No trtmnt)\';
	elseif conditions == 3
		saverF = 'insult (DMSO w Ouabain TBOA)\';
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
		savefolder = ['I:\network data\',saverF,CURRpathNAME];	% define save folder
		mkdir(savefolder);											% create save folder			
		mkdir([savefolder '\pajs\']);								% create .paj file folder
		mkdir([savefolder '\tiffs\']);								% create .tif file folder
		mkdir([savefolder '\figures\']);							% create .fig file folder
		% mkdir([savefolder '\connectivity\']);						% create functional network file folder
		FigHandle = figure('Position', [100, 100, 400, 200]);

		%% SECONDARY LOOP -iterates across all recordings in the folder
		for i = 1:size(all_namesMAT)								% for each of the files (line 18)
			
			%% Directory information
			cd([dataFolder,CURRpathNAME])
			disp([' Current file name: ',all_namesMAT(i).name]);	% display file name
			tic														% begin counting duration of analysis
			load(all_namesMAT(i).name);								% load i_th file
			
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
			
			%% Spiking variability
			[RT(:,file),Fano] = spikeRTnFano(sp); 															% spike rate and Fano factor
			[ISI{file},lv{file}] = ISInLv(sp);  															% ISI and Cv and Lv
			[vs{file},~] = synchVECS(sp,minHz,Hz_rez,maxHz);  % vector strength (coherence)
			% [ccE,ccI] = xCORRS(StoresSP,C);
			[rA] = autocorrelation(sp,200);	
			% [cc] = crossCORRS(StoresSP);
			
			%% Store statistics by recording
			stores_R(:,file) = r;																% spike rate
			stores_Fnet(file,1) = fnet;															% Fano factor across neurons
			% stores_VS(:,:,file) = (stores_VS(:,:) + vs(:,:));									% vector strength (coherence)
			% stores_P(:,:,file) = (stores_P(:,:) + p(:,:));										% significance of coherence (Rayleigh's stat)
			% stores_CC(file,:) = cc;
			for neuron = 1:N																		% for each neuron
				tefile_ISI = nonzeros(isi(neuron,:));															% tefile vector of ISI
				stores_tefileISI = zeros(1,maxISI);													% stores probability distribution
				for tt = tefile_ISI
					stores_tefileISI(1,tt) = stores_tefileISI(1,tt) + 1;
				end
				stores_ISI(neuron,1:maxISI,file) = stores_tefileISI ./ sum(stores_tefileISI);
			end
			stores_Lv(:,file) = lv;
			
		end

	end
end

cd(SavePathOrig)											% current directotry
all_namesMAT = dir ('*.mat');								% all names matlab in the directory
for file = 1:size(all_namesMAT)
	file_name = all_namesMAT(file).name;
	disp([' Spiking variability: ',file_name]);
	FileName = file_name(1:size(file_name,2)-4);
	load([FileName '.mat'],'StoresSP');	
	[N T] = size(StoresSP);
	
	%% LOAD TE for cc
	
end