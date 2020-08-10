function go

% free params
VARthreshold = 5;                                                           % spike threshold
[b1,b2] = butter(2,200/500,'high');                                         % 2nd order Butterworth analog(??) filters as objects
sampleRt = 5e3;                                                             % original sampling rate
dsampleRt = 1e3;                                                            % down-sampled

files = dir('D:\mat\**\*.h5');                                              % full list of files
for i = 1:1:length(files)                                                     % for all h5 file
    % setup file info
    FileName = files(i,1).name; FolderName = files(i,1).folder;             % file and folder name
    disp(FileName)                                                          % tell em where you at
    FilePath = [FolderName,'\',FileName];                                   % full file path
    FilePathMat = [FolderName,'\',FileName(1:end-3)];                       % full file path for mat files
 
    % extract data
    data = McsHDF5.McsData(FilePath);                                       % load metadata
    N = length(data.Recording{1,1}.AnalogStream{1,1}.Info.ChannelID);       % number of channels
    tVec = data.Recording{1,1}.AnalogStream{1,1}.ChannelDataTimeStamps;     % time vector (int64)
    tVec = single(tVec) / 1e3;                                              % time vector in milliseconds    
    
    % preprocessing (filter, detrend & downsampling)
    y = single(zeros(N,length(tVec)/(sampleRt/dsampleRt)));                 % initialize / clear
    for n = 1:N                                                             % for each channel
        y(n,:) = single(resample(double(detrend(filter(b1,b2,...
            data.Recording{1,1}.AnalogStream{1,1}.ChannelData(n,:)))), ...
            dsampleRt,sampleRt));                                           % filter, detrend & downsampling 
    end
    clear data                                                              % free up some memory
    dstVec = 0:tVec(end);                                                   % down-sample time vector
    
    % spike detection
    F = find(y <= repmat(mean(y') - (VARthreshold * ...
        (median(abs(y')) / 0.6745)), size(y,2), 1)');                       % Quian Quiroga et al . (2004) spike detection
    data.SP = single(zeros(N,size(y,2)));                                   % initialize event raster
    data.SP(F) = 1;                                                         % events == 1
    data.SP(isoutlier(sum(data.SP,2),'percentiles',[0 95]),:) = 0;          % remove outliers
    

    % spike analysis
    plotRaster(data.SP,dstVec,FilePathMat)                                  % generate spike raster
    data.sigma = getBranching(data.SP);                                     % compute branching parameter
    [data.bFcenter,data.bFstart,data.bFend,data.bAmp] = ...
        doBootstrap(data.SP,false,100,99,FilePathMat);                      % find threshold for detection of bursts
    data.aval = plotAvalanches(data.SP,FilePathMat);                        % avalanche detection
    saveFile(data,FilePathMat);                                             % save analysis
end