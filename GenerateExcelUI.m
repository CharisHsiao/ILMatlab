function varargout = GenerateExcelUI(varargin)
% GENERATEEXCELUI M-file for GenerateExcelUI.fig
%      GENERATEEXCELUI, by itself, creates a new GENERATEEXCELUI or raises the existing
%      singleton*.
%
%      H = GENERATEEXCELUI returns the handle to a new GENERATEEXCELUI or the handle to
%      the existing singleton*.
%
%      GENERATEEXCELUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERATEEXCELUI.M with the given input arguments.
%
%      GENERATEEXCELUI('Property','Value',...) creates a new GENERATEEXCELUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GenerateExcelUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GenerateExcelUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GenerateExcelUI

% Last Modified by GUIDE v2.5 17-Apr-2016 20:18:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GenerateExcelUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GenerateExcelUI_OutputFcn, ...
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


% --- Executes just before GenerateExcelUI is made visible.
function GenerateExcelUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GenerateExcelUI (see VARARGIN)

% Choose default command line output for GenerateExcelUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.KS_save,'Value',1);
set(handles.PC_save,'Value',1);
set(handles.FT_save,'Value',1);
% UIWAIT makes GenerateExcelUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GenerateExcelUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in KS_save.
function KS_save_Callback(hObject, eventdata, handles)
% hObject    handle to KS_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of KS_save


% --- Executes on button press in FT_save.
function FT_save_Callback(hObject, eventdata, handles)
% hObject    handle to FT_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FT_save


% --- Executes on button press in PC_save.
function PC_save_Callback(hObject, eventdata, handles)
% hObject    handle to PC_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PC_save


% --- Executes on button press in export.
function export_Callback(hObject, eventdata, handles)
% hObject    handle to export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1
select = zeros(1, 3);
select(1,1) = get(handles.KS_save,'Value');
select(1,2) = get(handles.FT_save,'Value');
select(1,3) = get(handles.PC_save,'Value');
% select(1,4) = get(handles.C_save,'Value');
% select(1,5) = get(handles.Kss_save,'Value');

if(sum(select) == 0)
    msgbox('请选择导出内容!','错误', 'error','non-modal');
elseif(~GenerateExcel(g_1, select))    %根据不同的返回值提示错误类型
    msgbox('导出Excel文件时出错!','错误', 'error','non-modal');
else
    msgbox('导出成功!');
    close GenerateExcelUI;
end




% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close GenerateExcelUI;


