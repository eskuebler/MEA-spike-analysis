function goRASTERS(SavePathOrig,VARthreshold);

%% goRASTERS.m
%%
%% This script analyses data produced by 'go.m' and produces 
%% and saves rasters of spiking activity.
%%
%% This script run is coded to run after 'go.m'.
%% 
%% email: eric.s.kuebler@gmail.com

warning off all;
VARthreshold = 5;
[b1,b2] = butter(2,200/500,'high');								% 2nd order Butterworth analog(??) filters as objects
tau = 5;
pathFolder = strcat(SavePathOrig,'\raw data\');	
cd(pathFolder);												% current directory to save path
% disp('Beginning spike raster analysis...')						% display
% filterRT = 1000/2;												% filtering rate based on downsampling factor
% pathFolder = pathFolder;
d = dir(pathFolder);
isub = [d(:).isdir]; 											% # returns logical vector
nameFolds = {d(isub).name};
nameFolds(ismember(nameFolds,{'.','..'})) = [];
for kk = 1:length(nameFolds)
	tic
	RunningVar = kk;
	CURRpathNAME = nameFolds{RunningVar};
	SavePathOrig2 = strcat(pathFolder,CURRpathNAME,'\');
	addpath(SavePathOrig2);
	cd(SavePathOrig2)
	disp(['	',SavePathOrig2])
	all_namesMAT = dir('*.mat');
	for i = 1:length(all_namesMAT)												% for all MEAs
		file_name = all_namesMAT(i).name;										% sets file name					
		if 'T' == strcat(file_name(length(file_name)-4:length(file_name)-4))										% if the MEA label matches
			% disp(['		' file_name(1:5)]);										% display the file being loaded
			StoresSP = [];														% initialize / clear storage of raster
			StoresSPraw = [];
			StoresSPamp = [];													% initialize / clear stores of signals
			ab = strcat(file_name(1:length(file_name)-4),'.mat');				% file name
			load([file_name],'x');												% load number of files
			t = x;
			n = 1;
			for iii = 1:length(all_namesMAT)	
				F_name = all_namesMAT(iii).name;
				if sum(file_name(1:length(file_name)-7)) == sum(F_name(1:length(F_name)-7))
					if sum('T') ~= sum(F_name(length(F_name)-4:length(F_name)-4))
				
				% sum(file_name(1:length(file_name)-6) == F_name(1:length(file_name)-6)) == length(1:length(file_name)-6) && ... 
				% sum('R2' == F_name(length(F_name)-5:length(F_name)-4)) == cc0
					% if length(file_name) ~= length(F_name)
						% file_name2 = all_namesMAT(iii).name;	
						load([F_name],'x');									% define which file and load .mat file
						% alldata = x;
						ab = size(x);												% dimension of data
						SPraw = x;												% raw data (i.e., MEA signals)
						SPamp = [];														% initialize / clear
						for j = 1:ab(1)													% for each channel
							SPamp(j,:) = detrend(filter(b1,b2,x(j,:)));			% apply filters and then de-trend the data
						end
						M = mean(SPamp');												% mean amplitude for channel
						Sd_noise = median(abs(SPamp'))/0.6745;							% Quian Quiroga et al . (2004) threshold detection
						threshold = repmat(M-(VARthreshold*Sd_noise),ab(2),1)';			% threshold matrix based on VARthreshold number of standard deviations from the mean
						F = find(SPamp <= threshold);									% event locations in the matrix
						SP = zeros(ab(1),ab(2));										% initialize event raster
						if ~isempty(F)													% if there were events
							SP(F) = 1;													% events = 1
						end
						% return
						StoresSP = [StoresSP, SP];										% stores the raster activity for file
						StoresSPraw = [StoresSPraw, SPraw];								% stores raw data
						StoresSPamp = [StoresSPamp, SPamp];								% stores filter signal for file
						if n == t														% if this is the last raster
							FigHandle = figure('Position', [100, 100, 900, 300]);		% set size of figure							
							[N T] = size(StoresSP);
							plotJP(StoresSP,'k.',5)										% plots the events where '1's denote events and '0's otherwise	
							title([CURRpathNAME ' ' F_name(1:length(F_name)-7)],'FontSize',16);	% title equal to file name
							drawnow														% function to draw figures during online analyses
							TempDirectory = [SavePathOrig,'\',CURRpathNAME];
							mkdir(TempDirectory)
							cd(TempDirectory);
							fileNAMEtemp = [CURRpathNAME,' ',file_name(1:length(file_name)-6)];
							[im, alpha] = export_fig(fileNAMEtemp,'-tif','-transparent','-r300');
							cd(TempDirectory);
							save([fileNAMEtemp '.mat'],'StoresSP','StoresSPamp','StoresSPraw'); % save data
							close;
						end
						n = n + 1;
					end
				end
			end
		end
	end
	% Duration = toc/60;													% duration of folder analysis
	% StoreDuration(kk) = Duration;										% store duration
	% disp([' Analysis duration: ~',int2str(Duration),' minutes'])		% display duration
	%goNETS		% functional network analysis
	%goSTATS	% statistics of spiking variability
end
rmdir(pathFolder)