function varargout = HPGAMINGGUI(varargin)
% HPGAMINGGUI MATLAB code for HPGAMINGGUI.fig
%      HPGAMINGGUI, by itself, creates a new HPGAMINGGUI or raises the existing
%      singleton*.
%
%      H = HPGAMINGGUI returns the handle to a new HPGAMINGGUI or the handle to
%      the existing singleton*.
%
%      HPGAMINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HPGAMINGGUI.M with the given input arguments.
%
%      HPGAMINGGUI('Property','Value',...) creates a new HPGAMINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HPGAMINGGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HPGAMINGGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HPGAMINGGUI

% Last Modified by GUIDE v2.5 23-Jun-2021 10:17:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HPGAMINGGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @HPGAMINGGUI_OutputFcn, ...
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


% --- Executes just before HPGAMINGGUI is made visible.
function HPGAMINGGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HPGAMINGGUI (see VARARGIN)

% Choose default command line output for HPGAMINGGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HPGAMINGGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HPGAMINGGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
x=[2,2200,12,2000000,16;4,4000,8,2700000,64;2,2200,16,2100000,32;6,6000,48,4000000,128;8,8000,48,6000000,64];



% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
x=xlsread('tugas_saw.xls');
k=[1,1,1,0,1];
w=[0.3,0.2,0.1,0.25,0.15];
[m n]=size (x);
R=zeros (m,n);
Y=zeros (m,n);
for j=1:n,
 if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
  R(:,j)=x(:,j)./max(x(:,j));
 else
  R(:,j)=min(x(:,j))./x(:,j);
 end;
    
end;

for i=1:m,
 V(i)= sum(w.*R(i,:))
end;

set(handles.uitable2,'Data',V)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.output = hObject;

  [file,path] = uigetfile({'.xls;.xlsx','Excel Files'},'tugas_saw');
  filename = strcat(path,file);
    data = xlsread(filename);
    set(handles.uitable1,'Data',data);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.uitable1, 'Data', cell(size(get(handles.uitable1,'Data'))));
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
