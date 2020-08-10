function [flag, me] = sgo_gui(moviePath,codecName,compRate)
% smovieCompressor(moviePath,savePath,codecName,compRate);
% 2014/03/30 Dongyoung Kim created
% compress movie with folloing input options
% 
% input : 
% moviePath = movie path
% savePath = save path
% codecName = 4 latter code of codec available from computer
%             if error, no compression will occurs
% compRate = compression rate, 1~100 (%)
% 
% output : 
% flag = success or not (bool)

h = waitbar(0,'Movie compression started');

try
    % read file
    waitbar(0.1,h,'Read the movie file');
    
%     movieInfo = aviinfo(moviePath);
%     moiveFile = aviread(moviePath);
    moiveFile = mmreader(moviePath);
    
    nFrames = moiveFile.NumberOfFrames;
    vidHeight = moiveFile.Height;
    vidWidth = moiveFile.Width;

    % Preallocate movie structure.
    mov(1:nFrames) = ...
        struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
               'colormap', []);

    % Read one frame at a time.
    for k = 1 : nFrames
        waitbar(0.1+(k/nFrames)*0.7,h);
        mov(k).cdata = read(moiveFile, k);
    end
    
    % compress file
    waitbar(0.8,h,'Compressing the movie');
    movie2avi(mov, savePath, ...
        'compression', codecName, ...
        'quality', compRate, ...
        'fps',moiveFile.FrameRate);

    % set flag
    waitbar(1,h,'Complete!');
    flag = true;
    me = '';
catch me
    flag = false;
    disp(me);
end
delete(h);
