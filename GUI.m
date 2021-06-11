function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 10-Jun-2021 21:28:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Suma_Resta.
function Suma_Resta_Callback(hObject, eventdata, handles)
    
    menu1 = menu('Elige la operacion','Suma','Resta');
    prompt = {'Ingresa un valor: '};
    dlgtitle = 'Valor de entrada';
    dims = [1 35]
    definput = {'20000'}
    resp = inputdlg(prompt, dlgtitle, dims, definput);
    val = str2double(resp);
    switch menu1
        case 1
            audio_file = get(handles.audio_name, 'String');
            [s, fs] = audioread(audio_file);
            l = s(:,1);
            sound(l,fs+val);
        case 2
            audio_file = get(handles.audio_name, 'String');
            [s, fs] = audioread(audio_file);
            l = s(:,1);
            sound(l,fs-val);
    end


% --- Executes on button press in Amp_Aten.
function Amp_Aten_Callback(hObject, eventdata, handles)

    menu1 = menu('Elige la operacion','Amplificar','Atenuar');
    prompt = {'Ingresa un valor entre [1 - 10]: '};
    dlgtitle = 'Valor de entrada';
    dims = [1 35];
    definput = {'5'};
    resp = inputdlg(prompt, dlgtitle, dims, definput);
    val = str2double(resp);
    switch menu1
        case 1
            audio_file = get(handles.audio_name, 'String');
            [s, fs] = audioread(audio_file);
            l = s(:,1);
            sound(l*val,fs);
        case 2
            audio_file = get(handles.audio_name, 'String');
            [s, fs] = audioread(audio_file);
            l = s(:,1);
            sound(l/val,fs);
    end

% --- Executes on button press in Reflejo.
function Reflejo_Callback(hObject, eventdata, handles)
    audio_file = get(handles.audio_name, 'String');
    [s, fs] = audioread(audio_file);
    l = s(:,1);
    sound(l(end:-1:1),fs);




% --- Executes on button press in Diezmacion_button.
function Diezmacion_button_Callback(hObject, eventdata, handles)
    audio_file = get(handles.audio_name, 'String');
    [s, fs] = audioread(audio_file);
    
    prompt = {'Ingresa un valor: '};
    dlgtitle = 'Valor de entrada';
    dims = [1 35]
    definput = {'2'}
    resp = inputdlg(prompt, dlgtitle, dims, definput);
    val = str2double(resp);
  
    l = s(:,1);
    sound(l(1:val:end)*2,fs);



function audio_name_Callback(hObject, eventdata, handles)
% hObject    handle to audio_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of audio_name as text
%        str2double(get(hObject,'String')) returns contents of audio_name as a double


% --- Executes during object creation, after setting all properties.
function audio_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to audio_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in audio_text_button.
function audio_text_button_Callback(hObject, eventdata, handles)
   
    audio_file = get(handles.audio_name, 'String');
    set(handles.audio_title, 'String', audio_file);
    
    [s, fs] = audioread(audio_file);
    
    tiempo = size(s,1)/fs;
    x = 0:1/fs:tiempo;

    plot(x(2:end),s), xlim([0 tiempo]);

    l = s(:,1);
    
    sound(l,fs); 
    

% --- Executes on button press in Grabar_button.
function Grabar_button_Callback(hObject, eventdata, handles)
    
    fs = 44100;
    nBits = 16;
    nChannels = 2;
    ID = -1;

    recording = audiorecorder(fs, nBits, nChannels, ID);
    disp('Start Speaking.');
        recordblocking(recording, 3);
    disp('End of Recording.');
    
    y = getaudiodata(recording);
    plot(y);
    
    sound(y, fs);
    
    
    
    
