function varargout = go_gui(varargin)

%
%
% go_gui.m
%
% MEA analysis software. 
%	The computer must have the MCD recording software
%	installed, see:  	
%	http://www.multichannelsystems.com/software/mc-rack
%	
%	In addition, if the system is running 64 bits
%	you may need to the file name '??.m' and
%	change '??.'	
%
%	This function extracts neuronal activity from
% 	.mcd (MEA - MultiChannel Systems recordings) files.
%	By calling 'go_gui' at the Matlab command prompt, a 
%	graphical user interface (gui) will open. Select the 
%	folder containing the .mcd data, then set the sampling 
%	rate (kHz),finally, then set the threshold for spiking 
%	activity (Quian-Quiroga, Panzeri - 2013).  
%
%	email: eric.s.kuebler@gmail.com
%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @go_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @go_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% --- Executes just before go_gui is made visible.
function go_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to go_gui (see VARARGIN)
% Choose default command line output for go_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% find available sampling rates
codecList = {'1';'5';'7';'10';'15';'20'};
% generate codec string
codecString = cell(numel(codecList)+1,1);
codecString{1} = 'None'; 
for idx = 2:numel(codecList)+1
    codecString{idx} = [codecList{idx-1}]; 
end
% set codec names to gui
set(handles.popupmenu_codec,'String',codecString);

% --- Outputs from this function are returned to the command line.
function varargout = go_gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton_compression.
function pushbutton_compression_Callback(hObject, eventdata, handles)
% set gui 
set(hObject,'Enable','off');
% load gui data
mcdPath = get(handles.edit_mcdPath,'String');
% savePath = get(handles.edit_savePath,'String');
codecList = get(handles.popupmenu_codec,'String');
codecSelection = get(handles.popupmenu_codec,'Value'); 
codecDetail = codecList{codecSelection};
codecName = codecDetail(1:4);
compRate = str2double(get(handles.edit_compRate,'String'));
% call compression
% [success, me] = sgo_gui(moviePath,codecName,compRate);
i = go(mcdPath,codecSelection,compRate);

function edit_mcdPath_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_mcdPath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_Open.
function FileName=pushbutton_Open_Callback(hObject, eventdata, handles)
try
	[FileName,PathName,FilterIndex] = uigetfile('.mcd','Find the .mcd files..','MultiSelect','on');
	FileName = cellstr(FileName);
	set(handles.edit_mcdPath,'String', fullfile(PathName,FileName));
end

function edit_savePath_Callback(hObject, eventdata, handles)

% --- Executes on selection change in popupmenu_codec.
function popupmenu_codec_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu_codec_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function slider_compRate_Callback(hObject, eventdata, handles)
sliderVal = get(hObject,'Value');
set(handles.edit_compRate, 'String',num2str(round(sliderVal)));

% --- Executes during object creation, after setting all properties.
function slider_compRate_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit_compRate_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_compRate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on edit_compRate and none of its controls.
function edit_compRate_KeyPressFcn(hObject, eventdata, handles)
fieldVal = get(hObject,'String');
set(handles.slider_compRate, 'Value',str2double(fieldVal));
drawnow;

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit_compRate.
function edit_compRate_ButtonDownFcn(hObject, eventdata, handles)
fieldVal = get(hObject,'String');
set(handles.slider_compRate, 'Value',str2double(fieldVal));
drawnow;

% --- Executes on key press with focus on edit_mcdPath and none of its controls.
function edit_mcdPath_KeyPressFcn(hObject, eventdata, handles)

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)

% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)

% --- Executes on key release with focus on figure1 or any of its controls.
function figure1_WindowKeyReleaseFcn(hObject, eventdata, handles)

% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
