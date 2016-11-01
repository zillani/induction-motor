function varargout = ts(varargin)
% TS MATLAB code for ts.fig
%      TS, by itself, creates a new TS or raises the existing
%      singleton*.
%
%      H = TS returns the handle to a new TS or the handle to
%      the existing singleton*.
%
%      TS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TS.M with the given input arguments.
%
%      TS('Property','Value',...) creates a new TS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ts_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ts_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ts

% Last Modified by GUIDE v2.5 23-Oct-2016 16:58:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ts_OpeningFcn, ...
                   'gui_OutputFcn',  @ts_OutputFcn, ...
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


% --- Executes just before ts is made visible.
function ts_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ts (see VARARGIN)

% Choose default command line output for ts
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ts wait for user response (see UIRESUME)
% uiwait(handles.figure1);

grid on;
% --- Outputs from this function are returned to the command line.
function varargout = ts_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Vth = str2num(get(handles.voltage,'string'));
P=6;
Rth = 0;
Xth = 0;
R2 = str2num(get(handles.rotor_resistance,'string'));

X2 = str2num(get(handles.rotor_reactance,'string'));

f=50;
Ns=120*f/P;
ws=Ns*2*pi/60;
s=1:-0.001:-1;

Nm=(1-s)*Ns; % 1x2001 double%
grid on;
for i=1:2001
%T(i)=(3*Vth^2*R2/(1-(Nm(i)/Ns))/(ws*((Rth+R2/(1-(Nm(i)/Ns)))^2+(Xth+X2)^2)));
T(i)=(3*Vth^2*R2/s(i))/(ws*((Rth+R2/s(i))^2+(Xth+X2)^2));%
end

plot(Nm,T);
grid on;


function voltage_Callback(hObject, eventdata, handles)
% hObject    handle to voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voltage as text
%        str2double(get(hObject,'String')) returns contents of voltage as a double


% --- Executes during object creation, after setting all properties.
function voltage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit_text_voltage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function rotor_resistance_Callback(hObject, eventdata, handles)
% hObject    handle to rotor_resistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotor_resistance as text
%        str2double(get(hObject,'String')) returns contents of rotor_resistance as a double


% --- Executes during object creation, after setting all properties.
function rotor_resistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotor_resistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotor_resistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function rotor_reactance_Callback(hObject, eventdata, handles)
% hObject    handle to rotor_reactance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotor_reactance as text
%        str2double(get(hObject,'String')) returns contents of rotor_reactance as a double


% --- Executes during object creation, after setting all properties.
function rotor_reactance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotor_reactance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
