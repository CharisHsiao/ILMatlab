function varargout = ImportUI(varargin)        %参数可变列表  用于输入输出参数        %以下部分代码是在拖控件时自动生成的
% IMPORTUI MATLAB code for ImportUI.fig
%      IMPORTUI, by itself, creates a new IMPORTUI or raises the existing
%      singleton*.
%
%      H = IMPORTUI returns the handle to a new IMPORTUI or the handle to
%      the existing singleton*.
%
%      IMPORTUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPORTUI.M with the given input arguments.
%
%      IMPORTUI('Property','Value',...) creates a new IMPORTUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImportUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImportUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImportUI

% Last Modified by GUIDE v2.5 25-Mar-2016 14:13:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;

%自动生成的结构体
gui_State = struct('gui_Name',       mfilename, ...    %返回当前运行函数所在.m文件的文件名
                   'gui_Singleton',  gui_Singleton, ...    %貌似为某个标记变量
                   'gui_OpeningFcn', @ImportUI_OpeningFcn, ...  %函数句柄
                   'gui_OutputFcn',  @ImportUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})    %nargin  判断输入变量个数
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------

% --- Executes just before ImportUI is made visible.
function ImportUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImportUI (see VARARGIN)

% Choose default command line output for ImportUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clear global;     %清除全局变量
clear;
clc;
% UIWAIT makes ImportUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImportUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in directButton.
function directButton_Callback(hObject, eventdata, handles)
% hObject    handle to directButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize

%global  caSize oaSize ibSize
global g_1 ;
g_1 = Project();
defaultanswer={'6','3','8'};
sizeParameter=inputdlg({'耦合点数','响应点数','激励点数'},'设定参数',1,defaultanswer);
g_1.caSize=str2num(sizeParameter{1});    %读出输入的大小并赋值
g_1.oaSize=str2num(sizeParameter{2});
g_1.ibSize=str2num(sizeParameter{3});
%close ImportUI

path=uigetdir('','直接方法');    % 弹出选择文件夹窗口  并获取用户选择的文件夹路径
load_needed_data(path,0,g_1);   % 导入数据，0 表示使用直接逆子结构法
  calculate(0,g_1);              %计算结果 0 表示使用直接逆子结构法
clear path;
close ImportUI

DirectMainUI

% --- Executes on button press in indirectButton_1.
function indirectButton_1_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
global g_1;
g_1 = Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 1;
path=uigetdir('','第一类间接方法');
  load_needed_data(path,mathod,g_1)  %  导入数据,1 表示使用第一类间接逆子结构法
   calculate(mathod,g_1);             % 计算结果, 1 表示使用第一类间接逆子结构法

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_2.
function indirectButton_2_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 2;
path=uigetdir('','第二类间接方法');
  load_needed_data(path,mathod,g_1)  %  导入数据,1 表示使用第一类间接逆子结构法
   calculate(mathod,g_1);             % 计算结果, 1 表示使用第一类间接逆子结构法

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_3.
function indirectButton_3_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 3;
path=uigetdir('','第三类间接方法');
  load_needed_data(path,mathod,g_1)  %  导入数据,1 表示使用第一类间接逆子结构法
   calculate(mathod,g_1);             % 计算结果, 1 表示使用第一类间接逆子结构法

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_4.
function indirectButton_4_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});
mathod = 4;
path=uigetdir('','第四类间接方法');
  load_needed_data(path,mathod,g_1)  %  导入数据,1 表示使用第一类间接逆子结构法
   calculate(mathod,g_1);             % 计算结果, 1 表示使用第一类间接逆子结构法

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_5.
function indirectButton_5_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %清除全局变量
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 5;
path=uigetdir('','第五类间接方法');
  load_needed_data(path,mathod,g_1)  %  导入数据,1 表示使用第一类间接逆子结构法
   calculate(mathod,g_1);             % 计算结果, 1 表示使用第一类间接逆子结构法

clear path;
close ImportUI
IndirectMainUI
