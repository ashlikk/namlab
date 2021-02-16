function varargout = headfix_GUI_com5(varargin)
% HEADFIX_GUI_COM5 MATLAB code for headfix_GUI_com5.fig
%      HEADFIX_GUI_COM5, by itself, creates a new HEADFIX_GUI_COM5 or raises the existing
%      singleton*.
%
%      H = HEADFIX_GUI_COM5 returns the handle to a new HEADFIX_GUI_COM5 or the handle to
%      the existing singleton*.
%
%      HEADFIX_GUI_COM5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEADFIX_GUI_COM5.M with the given input arguments.
%
%      HEADFIX_GUI_COM5('Property','Value',...) creates a new HEADFIX_GUI_COM5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before headfix_GUI_com5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to headfix_GUI_com5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help headfix_GUI_com5

% Last Modified by GUIDE v2.5 09-Feb-2021 15:07:46

% cd 'F:\acads\Stuber lab\headfix'; %Change to directory

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @headfix_GUI_com5_OpeningFcn, ...
                   'gui_OutputFcn',  @headfix_GUI_com5_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before headfix_GUI_com5 is made visible.
function headfix_GUI_com5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to headfix_GUI_com5 (see VARARGIN)

% Choose default command line output for headfix_GUI_com5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using headfix_GUI_com5.
% if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
% end

global actvAx saveDir

mainPath = 'C:\Users\namboodirilab\Desktop\Behavioral_acquisition_and_analysis';
addpath(mainPath)
saveDir = [mainPath '\data\'];          % where to save data

actvAx  = handles.activityAxes;         % handle for activity plot

% Find available serial ports
serialInfo = instrhwinfo('serial');
port = serialInfo.AvailableSerialPorts;
if ~isempty(port)
    set(handles.availablePorts,'String',port)
end

% Change window title
set(gcf,'name','Head-fixed behavior_COM5')

set(handles.csproperties, 'Enable', 'off');
set(handles.lickproperties, 'Enable', 'off');
set(handles.experimentmode, 'Enable', 'on');
set(handles.uploadButton, 'Enable', 'on');
set(handles.openButton, 'Enable', 'off');
set(handles.backgroundsolenoid, 'Enable', 'off');
set(handles.T_bgd, 'Enable', 'off');
set(handles.r_bgd, 'Enable', 'off');
set(handles.mindelaybgdtocue, 'Enable', 'off'); 
set(handles.mindelayfxdtobgd, 'Enable', 'off');
set(handles.totPoisssolenoid, 'Enable', 'off');
set(handles.checkboxtrialbytrial, 'Enable', 'off');
set(handles.checkboxrandlaser, 'Enable', 'off');
set(handles.lasertrialbytrial, 'Enable', 'off');
set(handles.laserlatency, 'Enable', 'off');
set(handles.laserduration, 'Enable', 'off');
set(handles.laserpulseperiod, 'Enable', 'off');
set(handles.laserpulseoffperiod, 'Enable', 'off');
set(handles.checkboxexpiti, 'Enable', 'off');
set(handles.maxdelaycuetovacuum, 'Enable', 'off');
set(handles.minITI, 'Enable', 'off');
set(handles.maxITI, 'Enable', 'off');
set(handles.testcs1, 'Enable', 'off');
set(handles.testcs2, 'Enable', 'off');
set(handles.testcs3, 'Enable', 'off');
set(handles.testlaser, 'Enable', 'off');
set(handles.solenoid1Button, 'Enable', 'off');
set(handles.solenoid2Button, 'Enable', 'off');
set(handles.solenoid3Button, 'Enable', 'off');
set(handles.solenoid4Button, 'Enable', 'off');
set(handles.lickretractsolenoid1Button, 'Enable','off')
set(handles.lickretractsolenoid2Button, 'Enable','off')
set(handles.primesolenoid1, 'Enable', 'off');
set(handles.primesolenoid2, 'Enable', 'off');
set(handles.primesolenoid3, 'Enable', 'off');
set(handles.primesolenoid4, 'Enable', 'off');
set(handles.primelickretractsolenoid1, 'Enable','off');
set(handles.primelickretractsolenoid2, 'Enable','off');


% UIWAIT makes headfix_GUI_com5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes during object creation, after setting all properties.
% adjust the size of the gui
function figure1_CreateFcn(hObject, eventdata, handles) 
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Units','pixels','Position',[60 80 1500 870])

% --- Outputs from this function are returned to the command line.
function varargout = headfix_GUI_com5_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function prefs_Callback(hObject, eventdata, handles)
% hObject    handle to prefs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

instrreset
if exist('s','var')
    fclose(s)
end


% --- Executes on button press in refreshButton.
function refreshButton_Callback(hObject, eventdata, handles)
% hObject    handle to refreshButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

serialInfo = instrhwinfo('serial');                             % get info on connected serial ports
port = serialInfo.AvailableSerialPorts;                         % get names of ports
if ~isempty(port)
    set(handles.availablePorts,'String',port)                   % update list of ports available
else
    set(handles.availablePorts,'String', ...
        'none found, please check connection and refresh')      % if none, indicate so
end


% --- Executes on button press in openButton.
function openButton_Callback(hObject, eventdata, handles)
% opens serial port (identified by user) for communication with arduino

global s

portList = get(handles.availablePorts,'String');    % get list from popup menu
selected = get(handles.availablePorts,'Value');     % find which is selected
port     = portList{selected};                      % selected port

s = serial(port,'BaudRate',57600,'Timeout',1);    % setup serial port with arduino, specify the terminator as a LF ('\n' in Arduino)
fopen(s)                                            % open serial port with arduino
% get(s)
set(handles.openButton,'String','Wait 5s');
pause(5);
set(handles.openButton,'String','Link');

set(handles.port,'String',port)                     % write out port selected in menu
%set(handles.sendButton,'Enable','on')               % enable 'send' button
set(handles.startButton,'Enable','off')             % disable 'send' button
set(handles.closeButton,'Enable','on')              % enable 'unlink' button
set(handles.openButton,'Enable','off')              % disable 'link' button
set(handles.refreshButton,'Enable','off')           % disable 'refresh' button

selectedmode = get(handles.experimentmode, 'Value');
if selectedmode == 1
    set(handles.sendButton,'Enable','on') 
    set(handles.csproperties, 'Enable', 'on');
    set(handles.checkboxtrialbytrial, 'Enable', 'on');
    set(handles.checkboxrandlaser, 'Enable', 'on');
    set(handles.lasertrialbytrial, 'Enable', 'on');
    set(handles.laserlatency, 'Enable', 'on');
    set(handles.laserduration, 'Enable', 'on');
    set(handles.laserpulseperiod, 'Enable', 'on');
    set(handles.laserpulseoffperiod, 'Enable', 'on');
    set(handles.checkboxexpiti, 'Enable', 'on');
    set(handles.maxdelaycuetovacuum, 'Enable', 'on');
    set(handles.minITI, 'Enable', 'on');
    set(handles.maxITI, 'Enable', 'on');
    set(handles.backgroundsolenoid, 'Enable', 'on');
    set(handles.T_bgd, 'Enable', 'on');
    set(handles.r_bgd, 'Enable', 'on');
    set(handles.mindelaybgdtocue, 'Enable', 'on'); 
    set(handles.mindelayfxdtobgd, 'Enable', 'on');    
elseif selectedmode == 2
    set(handles.sendButton,'Enable','on') 
    set(handles.backgroundsolenoid, 'Enable', 'on');
    set(handles.T_bgd, 'Enable', 'on');
    set(handles.r_bgd, 'Enable', 'on');
    set(handles.mindelaybgdtocue, 'Enable', 'on'); 
    set(handles.mindelayfxdtobgd, 'Enable', 'on');
    set(handles.totPoisssolenoid, 'Enable', 'on');
elseif selectedmode == 3
    set(handles.sendButton,'Enable','on') 
    set(handles.lickproperties, 'Enable', 'on');
elseif selectedmode == 4
    set(handles.testserialport, 'Enable', 'on');
end


% --- Executes on selection change in experimentmode.
function experimentmode_Callback(hObject, eventdata, handles)
% hObject    handle to experimentmode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns experimentmode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from experimentmode

set(handles.uploadButton, 'Enable', 'on');


% --- Executes on button press in uploadButton.
function uploadButton_Callback(hObject, eventdata, handles)
% hObject    handle to uploadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
portList = get(handles.availablePorts,'String');    % get list from popup menu
selected = get(handles.availablePorts,'Value');     % find which is selected
port     = portList{selected};                      % selected port
           
basecmd = strcat('"C:\Program Files (x86)\Arduino\hardware\tools\avr/bin/avrdude" -C"C:\Program Files (x86)\Arduino\hardware\tools\avr/etc/avrdude.conf" -v -patmega2560 -cwiring -P',port,' -b115200 -D -Uflash:w:');
selectedmode = get(handles.experimentmode,'Value');

if selectedmode == 1
    [status,cmdout] = dos(strcat(basecmd,'C:\Users\namboodirilab\Desktop\Behavioral_acquisition_and_analysis\uploads\Namlab_behavior_cues.ino.hex',':i'));
elseif selectedmode == 2
    [status,cmdout] = dos(strcat(basecmd,'C:\Users\namboodirilab\Desktop\Behavioral_acquisition_and_analysis\uploads\Namlab_behavior_randomrewards.ino.hex',':i'));
elseif selectedmode == 3
    [status,cmdout] = dos(strcat(basecmd,'C:\Users\namboodirilab\Desktop\Behavioral_acquisition_and_analysis\uploads\Namlab_behavior_lickforreward.ino.hex',':i'));
elseif selectedmode == 4
    [status,cmdout] = dos(strcat(basecmd,'C:\Users\namboodirilab\Desktop\Behavioral_acquisition_and_analysis\uploads\Serial_port_testing.ino.hex',':i'));
end


if contains(cmdout, 'avrdude done.') && status==0
    set(handles.uploadButton, 'String', 'Successfully uploaded');
    set(handles.experimentmode, 'Enable', 'off');
    set(handles.uploadButton, 'Enable','off');
    set(handles.openButton, 'Enable','on');
else
    set(handles.uploadButton, 'String', 'Unable to upload');
    pause(5);
    set(handles.uploadButton, 'String', 'Upload');
end


% --- Executes on button press in closeButton.
function closeButton_Callback(hObject, eventdata, handles)

global s
fclose(s)
instrreset                                          % "closes serial"
set(handles.port,'String','port not selected')      % remove port from menu
set(handles.startButton,'Enable','off')             % turn off 'start' button
set(handles.stopButton,'Visible','on')
set(handles.stopButton,'Enable','off')              % turn off 'stop' button
set(handles.closeButton,'Enable','off')             % turn off 'unlink' button (self)
set(handles.openButton,'Enable','off')               % turn on 'link' button
set(handles.refreshButton,'Enable','on')            % turn on 'refresh' button
set(handles.sendButton,'Enable','off')
set(handles.experimentmode,'Enable','on')
set(handles.uploadButton,'Enable','on')
set(handles.uploadButton,'String','Upload')
set(handles.csproperties,'Enable','off')
set(handles.lickproperties,'Enable','off')
set(handles.backgroundsolenoid, 'Enable', 'off');
set(handles.T_bgd, 'Enable', 'off');
set(handles.r_bgd, 'Enable', 'off');
set(handles.mindelaybgdtocue, 'Enable', 'off'); 
set(handles.mindelayfxdtobgd, 'Enable', 'off');
set(handles.totPoisssolenoid, 'Enable', 'off');
set(handles.checkboxtrialbytrial, 'Enable', 'off');
set(handles.checkboxrandlaser, 'Enable', 'off');
set(handles.lasertrialbytrial, 'Enable', 'off');
set(handles.laserlatency, 'Enable', 'off');
set(handles.laserduration, 'Enable', 'off');
set(handles.laserpulseperiod, 'Enable', 'off');
set(handles.laserpulseoffperiod, 'Enable', 'off');
set(handles.checkboxexpiti, 'Enable', 'off');
set(handles.maxdelaycuetovacuum, 'Enable', 'off');
set(handles.minITI, 'Enable', 'off');
set(handles.maxITI, 'Enable', 'off');

set(handles.testcs1, 'Enable', 'off');
set(handles.testcs2, 'Enable', 'off');
set(handles.testcs3, 'Enable', 'off');
set(handles.testlaser, 'Enable', 'off');
set(handles.testserialport, 'Enable', 'off');
set(handles.solenoid1Button, 'Enable', 'off');
set(handles.solenoid2Button, 'Enable', 'off');
set(handles.solenoid3Button, 'Enable', 'off');
set(handles.solenoid4Button, 'Enable', 'off');
set(handles.lickretractsolenoid1Button, 'Enable','off')
set(handles.lickretractsolenoid2Button, 'Enable','off')
set(handles.primesolenoid1, 'Enable', 'off');
set(handles.primesolenoid2, 'Enable', 'off');
set(handles.primesolenoid3, 'Enable', 'off');
set(handles.primesolenoid4, 'Enable', 'off');
set(handles.primelickretractsolenoid1, 'Enable','off')
set(handles.primelickretractsolenoid2, 'Enable','off')



% --- Executes on button press in solenoid1Button.
function solenoid1Button_Callback(hObject, eventdata, handles)

global s
fprintf(s,'A');              % Send solenoid signal to arduino; 65 in the Arduino is the ASCII code for A


% --- Executes on button press in solenoid2Button.
function solenoid2Button_Callback(hObject, eventdata, handles)
% hObject    handle to solenoid2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
fprintf(s,'D');              % Send solenoid signal to arduino; 68 in the Arduino is the ASCII code for D


% --- Executes on button press in solenoid3Button.
function solenoid3Button_Callback(hObject, eventdata, handles)
% hObject    handle to solenoid3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s 
fprintf(s, 'G');        % Send solenoid signal to arduino; 71 in the Arduino is the ASCII code for G
    
% --- Executes on button press in solenoid4Button.
function solenoid4Button_Callback(hObject, eventdata, handles)
% hObject    handle to solenoid4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
fprintf(s, 'J');       % Send solenoid signal to arduino; 74 in Arduino is the ASCII code for J


% --- Executes on button press in lickretractsolenoid1Button.
function lickretractsolenoid1Button_Callback(hObject, eventdata, handles)
% hObject    handle to lickretractsolenoid1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
fprintf(s, 'M');       % Send lickretractsolenoid signal to arduino; 77 in Arduino is teh ASCII code for M


% --- Executes on button press in lickretractsolenoid2Button.
function lickretractsolenoid2Button_Callback(hObject, eventdata, handles)
% hObject    handle to lickretractsolenoid2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
fprintf(s, 'P');       % Send lickretractsolenoid signal to arduino; 80 in Arduino is teh ASCII code for P


% --- Executes on button press in vacuumButton.
function vacuumButton_Callback(hObject, eventdata, handles)
% hObject    handle to vacuumButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
fprintf(s,'V');              % Send vacuum signal to arduino; 86 in the Arduino is the ASCII code for V


% --- Executes on button press in primesolenoid1.
function primesolenoid1_Callback(hObject, eventdata, handles)
% hObject    handle to primesolenoid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primesolenoid1
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s,'B');              % Send prime solenoid signal to arduino; 66 in the Arduino is the ASCII code for B
else
    fprintf(s,'C');              % Send stop solenoid signal to arduino; 67 in the Arduino is the ASCII code for C
end

% --- Executes on button press in primesolenoid2.
function primesolenoid2_Callback(hObject, eventdata, handles)
% hObject    handle to primesolenoid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primesolenoid2
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s,'E');              % Send prime solenoid signal to arduino; 69 in the Arduino is the ASCII code for E
else
    fprintf(s,'F');              % Send stop solenoid signal to arduino; 70 in the Arduino is the ASCII code for F
end

% --- Executes on button press in primesolenoid3.
function primesolenoid3_Callback(hObject, eventdata, handles)
% hObject    handle to primesolenoid3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primesolenoid3
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s, 'H');            % Send prime solenoid signal to arduino; 72 in the Arduino is the ASCII code for H
else
    fprintf(s, 'I');            % Send prime solenoid signal to arduino; 73 in the Arduino is the ASCII code for I
end

% --- Executes on button press in primesolenoid4.
function primesolenoid4_Callback(hObject, eventdata, handles)
% hObject    handle to primesolenoid4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primesolenoid4
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s, 'K');            % Send prime solenoid signal to arduino; 75 in the Arduino is the ASCII code for K
else
    fprintf(s, 'L');            % Send prime solenoid signal to arduino; 76 in the Arduino is the ASCII code for L
end

% --- Executes on button press in primelickretractsolenoid1.
function primelickretractsolenoid1_Callback(hObject, eventdata, handles)
% hObject    handle to primelickretractsolenoid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primelickretractsolenoid1
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s, 'N');            % Send prime lickretractsolenoid signal to arduino; 78 in the Arduino is the ASCII code for N
else
    fprintf(s, 'O');            % Send prime lickretractsolenoid signal to arduino; 79 in the Arduino is the ASCII code for O
end

% --- Executes on button press in primelickretractsolenoid2.
function primelickretractsolenoid2_Callback(hObject, eventdata, handles)
% hObject    handle to primelickretractsolenoid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primelickretractsolenoid2
global s

if get(hObject,'Value') == get(hObject,'Max')
    fprintf(s, 'Q');            % Send prime lickretractsolenoid signal to arduino; 81 in the Arduino is the ASCII code for Q
else
    fprintf(s, 'R');            % Send prime lickretractsolenoid signal to arduino; 82 in the Arduino is the ASCII code for R
end

% --- Executes on button press in testcs1.
function testcs1_Callback(hObject, eventdata, handles)
% hObject    handle to testcs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'2');              % Send CS1 signal to arduino; 50 in the Arduino is the ASCII code for 2
flushinput(s)


% --- Executes on button press in testcs2.
function testcs2_Callback(hObject, eventdata, handles)
% hObject    handle to testcs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'3');              % Send CS2 signal to arduino; 51 in the Arduino is the ASCII code for 3
flushinput(s)

% --- Executes on button press in testcs3.
function testcs3_Callback(hObject, eventdata, handles)
% hObject    handle to testcs3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'4');              % Send CS3 signal to arduino; 52 in the Arduino is the ASCII code for 4
flushinput(s)


% --- Executes on button press in testlaser.
function testlaser_Callback(hObject, eventdata, handles)
% hObject    handle to testlaser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'8');              % Send Laser signal to arduino; 56 in the Arduino is the ASCII code for 8
flushinput(s)


% --- Executes on button press in testserialport.
function testserialport_Callback(hObject, eventdata, handles)
% hObject    handle to testserialport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s running actvAx saveDir

mainPath = 'C:\Users\mzhou9\Desktop\Behavioral_acquisition_and_analysis';	
addpath(mainPath)	
saveDir = [mainPath '\serialtest\'];          % save serial testing data here

fprintf(s,'T');                          % Send test serial port signal to arduino; 84 in the Arduino is the ASCII code for T
set(hObject,'Enable','off');
serial_port_testing                      % Start figure for serial port connection signal


% --- Executes during object creation, after setting all properties.
function csproperties_CreateFcn(hObject, eventdata, handles)
% hObject    handle to csproperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% temp = {'Number of trials', 33, 33, 33;
%         'Frequency(kHz)', 12, 3, 7;
%         'Predicted solenoid', '1+3', '2+3', '1+3';
%         'Probability of solenoid', '100+100', '100+100', '0+100';
%         'Solenoid open time (ms)', '30+30', '30+30', '0+30';
%         'Cue duration (ms)', 1000, 1000, 1000;
%         'Delay to solenoid (ms)', '1500+3000', '1500+3000', '0+3000';
%         'Pulse tone (1) or not (0)', 0, 1, 1;
%         'Speaker number', 1, 2, 1;
%         'Go lick requirement', 1, 1, 0;
%         'Go lick tube (or solenoid)', 1, 2, 3;
%         'Sound(1), light(2) or both(3)', 1, 1, 1};


%%%% DEFAULT FOR PAVLOVIAN CONDITIONING
temp = {'Number of trials', 50, 50, 0;
        'Frequency(kHz)', 12, 3, 7;
        'Predicted solenoid', '1+3', '2+3', '1+3';
        'Probability of solenoid', '0+100', '0+0', '0+100';
        'Solenoid open time (ms)', '30+30', '30+30', '0+30';
        'Cue duration (ms)', 2000, 2000, 2000;
        'Delay to solenoid (ms)', '1500+3000', '1500+3000', '0+3000';
        'Pulse tone (1) or not (0)', 0, 1, 1;
        'Speaker number', 1, 2, 1;
        'Light number', 1, 2, 1;
        'Go lick requirement', 0, 0, 0;
        'Go lick tube (or solenoid)', 1, 2, 3;
        'Sound(1), light(2) or both(3)', 1, 1, 1};
set(hObject, 'Data', temp);

% --- Executes during object creation, after setting all properties.
function lickproperties_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lickproperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
temp = {'Number of licks required',  1, 1;    
        'Predicted solenoid',        3, 3;
        'Probability of solenoid', 100, 100;
        'Solenoid open time (ms)',  30, 30;
        'Delay to solenoid (ms)',    0, 0;
        'Delay to next lick (ms)',6000, 6000;
        'Min number of rewards',    20, 20;
        'Sound(1), light(2) or both(3)' 1 1;
        'Pulse tone (1) or not (0)' 0 1;
        'Sound Frequency (kHz)' 12 3;
        'Sound Duration (ms)' 1000 1000;
        'Speaker number' 1 2};
set(hObject, 'Data', temp);


% --- Executes on button press in sendButton.
function sendButton_Callback(hObject, eventdata, handles)
% hObject    handle to sendButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;

% Retrieve inputs

% Experiment mode 
experimentmode = get(handles.experimentmode,'Value');

% Cues
csproperties = get(handles.csproperties, 'Data');
numtrials    = cell2mat(csproperties(1,2:end));
CSfreq       = cell2mat(csproperties(2,2:end));
CSsolenoid   = [str2double(split(csproperties(3,2),'+'))',...
                str2double(split(csproperties(3,3),'+'))',...
                str2double(split(csproperties(3,4),'+'))'];
assignin('base', 'csproperties', csproperties);
CSprob       = [str2double(split(csproperties(4,2),'+'))',...
                str2double(split(csproperties(4,3),'+'))',...
                str2double(split(csproperties(4,4),'+'))'];
CSopentime   = [str2double(split(csproperties(5,2),'+'))',...
                str2double(split(csproperties(5,3),'+'))',...
                str2double(split(csproperties(5,4),'+'))'];
CSdur        = cell2mat(csproperties(6,2:end));
CS_t_fxd     = [str2double(split(csproperties(7,2),'+'))',...
                str2double(split(csproperties(7,3),'+'))',...
                str2double(split(csproperties(7,4),'+'))'];
CSpulse      = cell2mat(csproperties(8,2:end));
CSspeaker    = cell2mat(csproperties(9,2:end));
CSlight      = cell2mat(csproperties(10,2:end));
golickreq    = cell2mat(csproperties(11,2:end));
golicktube   = cell2mat(csproperties(12,2:end));
CSsignal = cell2mat(csproperties(13, 2:end));

%ITI
minITI = get(handles.minITI,'String');
minITI = str2double(minITI);
maxITI = get(handles.maxITI,'String');
maxITI = str2double(maxITI);
expitiflag = get(handles.checkboxexpiti,'Value');
maxdelaycuetovacuum = get(handles.maxdelaycuetovacuum,'String');
maxdelaycuetovacuum = str2double(maxdelaycuetovacuum);

%Bgd solenoids

backgroundsolenoid = get(handles.backgroundsolenoid,'String'); 
backgroundsolenoid = str2double(backgroundsolenoid);
T_bgd = get(handles.T_bgd,'String'); 
T_bgd = str2double(T_bgd);
r_bgd = get(handles.r_bgd,'String');
r_bgd = str2double(r_bgd);
mindelaybgdtocue = get(handles.mindelaybgdtocue,'String');
mindelaybgdtocue = str2double(mindelaybgdtocue);
mindelayfxdtobgd = get(handles.mindelayfxdtobgd,'String');
mindelayfxdtobgd = str2double(mindelayfxdtobgd);
trialbytrialbgdsolenoidflag = get(handles.checkboxtrialbytrial,'Value');
totPoisssolenoid = get(handles.totPoisssolenoid,'String'); % Total Poisson solenoids to deliver
totPoisssolenoid = str2double(totPoisssolenoid);

% Lick dependent rewards 

lickproperties  = get(handles.lickproperties, 'Data');
assignin('base', 'lickproperties', lickproperties);
reqlicknum      = cell2mat(lickproperties(1,2:end));
licksolenoid    = cell2mat(lickproperties(2,2:end));
lickprob        = cell2mat(lickproperties(3,2:end));
lickopentime    = cell2mat(lickproperties(4,2:end));
delaytoreward   = cell2mat(lickproperties(5,2:end));
delaytolick     = cell2mat(lickproperties(6,2:end));
minrewards      = cell2mat(lickproperties(7,2:end));
signaltolickreq = cell2mat(lickproperties(8,2:end));
soundsignalpulse   = cell2mat(lickproperties(9,2:end));
soundfreq       = cell2mat(lickproperties(10,2:end));
sounddur        = cell2mat(lickproperties(11,2:end));
soundspeaker    = cell2mat(lickproperties(12,2:end));

%Laser
laserlatency = get(handles.laserlatency,'String');
laserlatency = str2double(laserlatency);
laserduration = get(handles.laserduration,'String');
laserduration = str2double(laserduration);
randlaserflag = get(handles.checkboxrandlaser,'Value');
laserpulseperiod = get(handles.laserpulseperiod,'String');
laserpulseperiod = str2double(laserpulseperiod);
laserpulseoffperiod = get(handles.laserpulseoffperiod,'String');
laserpulseoffperiod = str2double(laserpulseoffperiod);
lasertrialbytrialflag = get(handles.lasertrialbytrial,'Value');

% Validate inputs
inputs = [numtrials, CSfreq, CSsolenoid, CSprob, CSopentime, CSdur, CS_t_fxd,...
          CSpulse, CSspeaker, golickreq, golicktube, CSsignal, minITI, maxITI, expitiflag,...
          backgroundsolenoid, T_bgd, r_bgd, mindelaybgdtocue, mindelayfxdtobgd,...
          experimentmode, trialbytrialbgdsolenoidflag, totPoisssolenoid,...
          reqlicknum, licksolenoid, lickprob, lickopentime, delaytoreward, delaytolick,...
          minrewards, signaltolickreq, soundsignalpulse, soundfreq, sounddur, soundspeaker,...
          laserlatency, laserduration, randlaserflag, laserpulseperiod, laserpulseoffperiod,...
          lasertrialbytrialflag, maxdelaycuetovacuum, CSlight]; % collect all inputs into array

negIn  = inputs < 0;
intIn  = inputs - fix(inputs);
if any([negIn intIn])
    errordlg('Invalid inputs')
    error('Invalid inputs')
end


% disable/enable certain options
set(handles.startButton,'Enable','on')
set(handles.sendButton,'Enable','off')
set(handles.csproperties,'Enable','off')
set(handles.lickproperties,'Enable','off')
set(handles.experimentmode,'Enable','off')
set(handles.uploadButton,'Enable','off')

set(handles.minITI,'Enable','off')
set(handles.maxITI,'Enable','off')
set(handles.maxdelaycuetovacuum,'Enable','off')

set(handles.backgroundsolenoid,'Enable','off')
set(handles.T_bgd,'Enable','off')
set(handles.r_bgd,'Enable','off')
set(handles.mindelaybgdtocue,'Enable','off')
set(handles.mindelayfxdtobgd,'Enable','off')
set(handles.checkboxtrialbytrial,'Enable','off')
set(handles.checkboxexpiti,'Enable','off')
set(handles.totPoisssolenoid,'Enable','off')

set(handles.laserlatency,'Enable','off')
set(handles.laserduration,'Enable','off')
set(handles.checkboxrandlaser,'Enable','off')
set(handles.laserpulseperiod,'Enable','off')
set(handles.laserpulseoffperiod,'Enable','off')
set(handles.lasertrialbytrial,'Enable','off')

set(handles.testcs1,'Enable','on')
set(handles.testcs2,'Enable','on')
set(handles.testcs3,'Enable','on')
set(handles.solenoid1Button,'Enable','on')
set(handles.primesolenoid1,'Visible','on')
set(handles.primesolenoid1,'Enable','on')
set(handles.solenoid2Button,'Enable','on')
set(handles.primesolenoid2,'Visible','on')
set(handles.primesolenoid2,'Enable','on')
set(handles.solenoid3Button,'Enable','on')
set(handles.primesolenoid3,'Visible','on')
set(handles.primesolenoid3,'Enable','on')
set(handles.solenoid4Button,'Enable','on')
set(handles.primesolenoid4,'Visible','on')
set(handles.primesolenoid4,'Enable','on')
set(handles.lickretractsolenoid1Button,'Enable','on')
set(handles.primelickretractsolenoid1,'Visible','on')
set(handles.primelickretractsolenoid1,'Enable','on')
set(handles.lickretractsolenoid2Button,'Enable','on')
set(handles.primelickretractsolenoid2,'Visible','on')
set(handles.primelickretractsolenoid2,'Enable','on')
set(handles.vacuumButton,'Enable','on')
set(handles.testlaser,'Enable','on')

params = sprintf('%u+', numtrials, CSfreq, CSsolenoid, CSprob, CSopentime,...
                 CSdur, CS_t_fxd, CSpulse, CSspeaker, golickreq, golicktube, CSsignal,...
                 minITI, maxITI, expitiflag, backgroundsolenoid, T_bgd, r_bgd,...
                 mindelaybgdtocue, mindelayfxdtobgd, experimentmode, trialbytrialbgdsolenoidflag,... 
                 totPoisssolenoid, reqlicknum, licksolenoid, lickprob, lickopentime, delaytoreward,...
                 delaytolick, minrewards, signaltolickreq, soundsignalpulse, soundfreq, sounddur, soundspeaker,...
                 laserlatency, laserduration, randlaserflag, laserpulseperiod,...
                 laserpulseoffperiod, lasertrialbytrialflag, maxdelaycuetovacuum, CSlight);
params = params(1:end-1);

% Run arduino code
fprintf(s,params);                                  % send info to arduino
flushinput(s)

% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)

global s running actvAx saveDir

% Retrieve inputs

% Experiment mode 
experimentmode = get(handles.experimentmode,'Value');

% Cues
csproperties = get(handles.csproperties, 'Data');
numtrials    = cell2mat(csproperties(1,2:end));
CSfreq       = cell2mat(csproperties(2,2:end));
CSsolenoid   = [str2double(split(csproperties(3,2),'+'))',...
                str2double(split(csproperties(3,3),'+'))',...
                str2double(split(csproperties(3,4),'+'))'];
assignin('base', 'csproperties', csproperties);
CSprob       = [str2double(split(csproperties(4,2),'+'))',...
                str2double(split(csproperties(4,3),'+'))',...
                str2double(split(csproperties(4,4),'+'))'];
CSopentime   = [str2double(split(csproperties(5,2),'+'))',...
                str2double(split(csproperties(5,3),'+'))',...
                str2double(split(csproperties(5,4),'+'))'];
CSdur        = cell2mat(csproperties(6,2:end));
CS_t_fxd     = [str2double(split(csproperties(7,2),'+'))',...
                str2double(split(csproperties(7,3),'+'))',...
                str2double(split(csproperties(7,4),'+'))'];
CSpulse      = cell2mat(csproperties(8,2:end));
CSspeaker    = cell2mat(csproperties(9,2:end));
CSlight      = cell2mat(csproperties(10,2:end));
golickreq    = cell2mat(csproperties(11,2:end));
golicktube   = cell2mat(csproperties(12,2:end));
CSsignal     = cell2mat(csproperties(13, 2:end));


%ITI
minITI = get(handles.minITI,'String');
minITI = str2double(minITI);
maxITI = get(handles.maxITI,'String');
maxITI = str2double(maxITI);
expitiflag = get(handles.checkboxexpiti,'Value');
maxdelaycuetovacuum = get(handles.maxdelaycuetovacuum,'String');
maxdelaycuetovacuum = str2double(maxdelaycuetovacuum);

%Bgd solenoids

backgroundsolenoid = get(handles.backgroundsolenoid,'String'); 
backgroundsolenoid = str2double(backgroundsolenoid);
T_bgd = get(handles.T_bgd,'String'); 
T_bgd = str2double(T_bgd);
r_bgd = get(handles.r_bgd,'String');
r_bgd = str2double(r_bgd);
mindelaybgdtocue = get(handles.mindelaybgdtocue,'String');
mindelaybgdtocue = str2double(mindelaybgdtocue);
mindelayfxdtobgd = get(handles.mindelayfxdtobgd,'String');
mindelayfxdtobgd = str2double(mindelayfxdtobgd);
trialbytrialbgdsolenoidflag = get(handles.checkboxtrialbytrial,'Value');
totPoisssolenoid = get(handles.totPoisssolenoid,'String'); % Total Poisson solenoids to deliver
totPoisssolenoid = str2double(totPoisssolenoid);

% Lick dependent rewards 

lickproperties  = get(handles.lickproperties, 'Data');
assignin('base', 'lickproperties', lickproperties);
reqlicknum      = cell2mat(lickproperties(1,2:end));
licksolenoid    = cell2mat(lickproperties(2,2:end));
lickprob        = cell2mat(lickproperties(3,2:end));
lickopentime    = cell2mat(lickproperties(4,2:end));
delaytoreward   = cell2mat(lickproperties(5,2:end));
delaytolick     = cell2mat(lickproperties(6,2:end));
minrewards      = cell2mat(lickproperties(7,2:end));
signaltolickreq = cell2mat(lickproperties(8,2:end));
soundsignalpulse   = cell2mat(lickproperties(9,2:end));
soundfreq       = cell2mat(lickproperties(10,2:end));
sounddur        = cell2mat(lickproperties(11,2:end));
soundspeaker    = cell2mat(lickproperties(12,2:end));

%Laser
laserlatency = get(handles.laserlatency,'String');
laserlatency = str2double(laserlatency);
laserduration = get(handles.laserduration,'String');
laserduration = str2double(laserduration);
randlaserflag = get(handles.checkboxrandlaser,'Value');
laserpulseperiod = get(handles.laserpulseperiod,'String');
laserpulseperiod = str2double(laserpulseperiod);
laserpulseoffperiod = get(handles.laserpulseoffperiod,'String');
laserpulseoffperiod = str2double(laserpulseoffperiod);
lasertrialbytrialflag = get(handles.lasertrialbytrial,'Value');

% Validate inputs
inputs = [numtrials, CSfreq, CSsolenoid, CSprob, CSopentime, CSdur, CS_t_fxd,...
          CSpulse, CSspeaker, golickreq, golicktube, CSsignal, minITI, maxITI, expitiflag,...
          backgroundsolenoid, T_bgd, r_bgd, mindelaybgdtocue, mindelayfxdtobgd,...
          experimentmode, trialbytrialbgdsolenoidflag, totPoisssolenoid,...
          reqlicknum, licksolenoid, lickprob, lickopentime, delaytoreward,...                
          delaytolick, minrewards, signaltolickreq, soundsignalpulse, soundfreq, sounddur, soundspeaker,...
          laserlatency, laserduration, randlaserflag, laserpulseperiod, laserpulseoffperiod,...
          lasertrialbytrialflag, maxdelaycuetovacuum, CSlight]; % collect all inputs into array
          
negIn  = inputs < 0;
intIn  = inputs - fix(inputs);
if any([negIn intIn])
    errordlg('Invalid inputs')
    error('Invalid inputs')
end

set(handles.licks1Edit,'String','0')
set(handles.licks2Edit,'String','0')
set(handles.licks3Edit,'String','0')
set(handles.cues1Edit,'String','0')
set(handles.cues2Edit,'String','0')
set(handles.cues3Edit,'String','0')
set(handles.light1Edit,'String','0')
set(handles.light2Edit,'String','0')
set(handles.light3Edit,'String','0')
set(handles.bgdsolenoidsEdit,'String','0')
set(handles.fxdsolenoids1Edit,'String','0')
set(handles.fxdsolenoids2Edit,'String','0')
set(handles.fxdsolenoids3Edit,'String','0')
set(handles.fxdsolenoids4Edit,'String','0')
set(handles.primesolenoid1,'Visible','off')
set(handles.primesolenoid2,'Visible','off')
set(handles.primesolenoid3,'Visible','off')
set(handles.primesolenoid4,'Visible','off')
set(handles.primelickretractsolenoid1, 'Visible','off')
set(handles.primelickretractsolenoid2, 'Visible','off')

% disable/enable certain options
set(handles.startButton,'Enable','off')
set(handles.stopButton,'Enable','on')
set(handles.closeButton,'Enable','off')
set(handles.sendButton,'Enable','off')
set(handles.testcs1,'Enable','off')
set(handles.testcs2,'Enable','off')
set(handles.testcs3,'Enable','off')
set(handles.testlaser,'Enable','off')
set(handles.closeButton,'Enable','off')
set(handles.experimentmode,'Enable','off')
set(handles.uploadButton,'Enable','off')

if experimentmode==2
    set(handles.vacuumButton,'Enable', 'off')
end

fname = get(handles.fileName,'String');

params = sprintf('%u+', numtrials, CSfreq, CSsolenoid, CSprob, CSopentime,...
                 CSdur, CS_t_fxd, CSpulse, CSspeaker, golickreq, golicktube, CSsignal,...
                 minITI, maxITI, expitiflag, backgroundsolenoid, T_bgd, r_bgd, ...
                 mindelaybgdtocue, mindelayfxdtobgd, experimentmode, ...
                 trialbytrialbgdsolenoidflag, totPoisssolenoid, reqlicknum,...
                 licksolenoid, lickprob, lickopentime, delaytoreward, delaytolick,...
                 minrewards, signaltolickreq, soundsignalpulse, soundfreq, sounddur, soundspeaker,...
                 laserlatency, laserduration, randlaserflag, laserpulseperiod, laserpulseoffperiod,...
                 lasertrialbytrialflag, maxdelaycuetovacuum, CSlight);
             
params = params(1:end-1);

% Run arduino code
fprintf(s,'0');                          % Signals to Arduino to start the experiment
conditioning_prog

% Reset GUI
set(handles.stopButton,'Visible','off')
% set(handles.stopButton,'Enable','off')             % disable 'start' button
set(handles.startButton,'Enable','off')             % disable 'start' button
set(handles.sendButton,'Enable','off')              % enable 'send' button
set(handles.closeButton,'Enable','on')              % enable 'unlink' button
set(handles.openButton,'Enable','off')              % disable 'link' button
set(handles.refreshButton,'Enable','off')           % disable 'refresh' button

set(handles.testcs1, 'Enable', 'off');
set(handles.testcs2, 'Enable', 'off');
set(handles.testcs3, 'Enable', 'off');
set(handles.testlaser, 'Enable', 'off');
set(handles.testserialport, 'Enable', 'off');
set(handles.solenoid1Button, 'Enable', 'off');
set(handles.solenoid2Button, 'Enable', 'off');
set(handles.solenoid3Button, 'Enable', 'off');
set(handles.solenoid4Button, 'Enable', 'off');
set(handles.lickretractsolenoid1Button, 'Enable','off')
set(handles.lickretractsolenoid2Button, 'Enable','off')
set(handles.primesolenoid1, 'Enable', 'off');
set(handles.primesolenoid2, 'Enable', 'off');
set(handles.primesolenoid3, 'Enable', 'off');
set(handles.primesolenoid4, 'Enable', 'off');
set(handles.primelickretractsolenoid1, 'Enable','off')
set(handles.primelickretractsolenoid2, 'Enable','off')

flushinput(s);                                  % clear serial input buffer



% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)

global s running
running = false;            % Stop running MATLAB code for monitoring arduino
fprintf(s,'1');              % Send stop signal to arduino; 49 in the Arduino is the ASCII code for 1

set(handles.stopButton,'Visible','off')
% set(handles.stopButton,'Enable','off')             % disable 'start' button
set(handles.startButton,'Enable','off')             % disable 'start' button
set(handles.sendButton,'Enable','off')              % enable 'send' button
set(handles.closeButton,'Enable','on')              % enable 'unlink' button
set(handles.openButton,'Enable','off')              % disable 'link' button
set(handles.refreshButton,'Enable','off')           % disable 'refresh' button

set(handles.testcs1, 'Enable', 'off');
set(handles.testcs2, 'Enable', 'off');
set(handles.testcs3, 'Enable', 'off');
set(handles.testlaser, 'Enable', 'off');
set(handles.testserialport, 'Enable', 'off');
set(handles.solenoid1Button, 'Enable', 'off');
set(handles.solenoid2Button, 'Enable', 'off');
set(handles.solenoid3Button, 'Enable', 'off');
set(handles.solenoid4Button, 'Enable', 'off');
set(handles.lickretractsolenoid1Button, 'Enable','off')
set(handles.lickretractsolenoid2Button, 'Enable','off')
set(handles.primesolenoid1, 'Enable', 'off');
set(handles.primesolenoid2, 'Enable', 'off');
set(handles.primesolenoid3, 'Enable', 'off');
set(handles.primesolenoid4, 'Enable', 'off');
set(handles.primelickretractsolenoid1, 'Enable','off')
set(handles.primelickretractsolenoid2, 'Enable','off')