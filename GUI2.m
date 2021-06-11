function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 10-Jun-2021 22:12:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)

% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function [B,C,D]= Interpolacion_cero(Ag1,k)
   
    n=length(Ag1);
    A=n*k;
    B=zeros(1,A);
    C=zeros(1,A);
    D=zeros(1,A);
    
    for i=1:1:n
        for j=i*k:k:A
            for b=1:1:k
                if b==1
                    B(j+b)=Ag1(i);
                else
                    B(j+b)=0;
                end
            end
        end
    end

    
   for i=1:1:n
        for j=i*k:k:A
            for b=1:1:k
                 C(j+b)=Ag1(i);

            end
        end
   end
   
   for i=1:1:n
       if i<n-1
           prom=(Ag1(i+1)-Ag1(i))/k;
       else 
           prom=(Ag1(i)+1)/k;
       end
       for j=i*k:k:A
            for b=1:1:k
                 D(j+b)=Ag1(i)+prom*(b-1);
            end
       end
   end 
   
    disp(B);
    disp(C);
    disp(D);



% --- Executes on button press in Interpolacion.
function Interpolacion_Callback(hObject, eventdata, handles)
    
    x = str2num(get(handles.vector1, 'String'));
    y = str2num(get(handles.vector2, 'String'));
    
    [B,C,D] = Interpolacion_cero(x,y);
    
    menu1 = menu('Elige el método de interpolación','Zero','Escalon','Lineal');
    
    switch menu1
        case 1
            plot(B);
        case 2
            plot(C);
        case 3
            plot(D);
    end
   
% --- Executes on button press in Desplazamineto.
function Desplazamineto_Callback(hObject, eventdata, handles)
    
    x = str2num(get(handles.vector1, 'String'));
    y = str2num(get(handles.vector2, 'String'));
    
    plot(x)
    hold on
    plot(x+y)

    

% --- Executes on button press in Convolucion.
function Convolucion_Callback(hObject, eventdata, handles)
    
    x = str2num(get(handles.vector1, 'String'));
    y = str2num(get(handles.vector2, 'String'));
    w = conv(x,y);
    plot(w);
  




function vector1_Callback(hObject, eventdata, handles)
% hObject    handle to vector1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vector1 as text
%        str2double(get(hObject,'String')) returns contents of vector1 as a double

% --- Executes during object creation, after setting all properties.
function vector1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vector1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function vector2_Callback(hObject, eventdata, handles)
% hObject    handle to vector2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vector2 as text
%        str2double(get(hObject,'String')) returns contents of vector2 as a double

% --- Executes during object creation, after setting all properties.
function vector2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vector2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
