function varargout = SAVE_Mat(varargin)
% SAVE_MAT MATLAB code for SAVE_Mat.fig
%      SAVE_MAT, by itself, creates a new SAVE_MAT or raises the existing
%      singleton*.
%
%      H = SAVE_MAT returns the handle to a new SAVE_MAT or the handle to
%      the existing singleton*.
%
%      SAVE_MAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAVE_MAT.M with the given input arguments.
%
%      SAVE_MAT('Property','Value',...) creates a new SAVE_MAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAVE_Mat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SAVE_Mat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SAVE_Mat

% Last Modified by GUIDE v2.5 17-Apr-2016 17:21:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SAVE_Mat_OpeningFcn, ...
                   'gui_OutputFcn',  @SAVE_Mat_OutputFcn, ...
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


% --- Executes just before SAVE_Mat is made visible.
function SAVE_Mat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAVE_Mat (see VARARGIN)
 

% Choose default command line output for SAVE_Mat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SAVE_Mat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAVE_Mat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkboxKS.
function checkboxKS_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxKS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get(handles.checkboxKS,'value');
% Hint: get(hObject,'Value') returns toggle state of checkboxKS


% --- Executes on button press in checkboxPC.
function checkboxPC_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxPC


% --- Executes on button press in pbtnCreate.
function pbtnCreate_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnCreate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global KS PC
global fileInfo

if (get(handles.checkboxKS,'value')==1)
  save_path=uigetdir('','保存路径');
  if (save_path~=0)
      %名字的不能含有'.'这个字符
     save([save_path '\' [fileInfo.PrName '的动态质量数据KS-' datestr(now,30) ] ],'KS');
    
  end
end

if (get(handles.checkboxPC,'value')==1)
 
  save_path=uigetdir('','保存路径');
  if (save_path~=0)
     save([save_path '\'  [fileInfo.PrName '的力传递率数据PC-' datestr(now,30) ] ],'PC');
  end
end
close


% --- Executes on button press in pbtnCancel.
function pbtnCancel_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
