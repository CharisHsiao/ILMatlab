function varargout = ImportUI(varargin)        %�����ɱ��б�  ���������������        %���²��ִ��������Ͽؼ�ʱ�Զ����ɵ�
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

%�Զ����ɵĽṹ��
gui_State = struct('gui_Name',       mfilename, ...    %���ص�ǰ���к�������.m�ļ����ļ���
                   'gui_Singleton',  gui_Singleton, ...    %ò��Ϊĳ����Ǳ���
                   'gui_OpeningFcn', @ImportUI_OpeningFcn, ...  %�������
                   'gui_OutputFcn',  @ImportUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})    %nargin  �ж������������
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
clear global;     %���ȫ�ֱ���
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
%clear global;     %���ȫ�ֱ���
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize

%global  caSize oaSize ibSize
global g_1 ;
g_1 = Project();
defaultanswer={'6','3','8'};
sizeParameter=inputdlg({'��ϵ���','��Ӧ����','��������'},'�趨����',1,defaultanswer);
g_1.caSize=str2num(sizeParameter{1});    %��������Ĵ�С����ֵ
g_1.oaSize=str2num(sizeParameter{2});
g_1.ibSize=str2num(sizeParameter{3});
%close ImportUI

path=uigetdir('','ֱ�ӷ���');    % ����ѡ���ļ��д���  ����ȡ�û�ѡ����ļ���·��
load_needed_data(path,0,g_1);   % �������ݣ�0 ��ʾʹ��ֱ�����ӽṹ��
  calculate(0,g_1);              %������ 0 ��ʾʹ��ֱ�����ӽṹ��
clear path;
close ImportUI

DirectMainUI

% --- Executes on button press in indirectButton_1.
function indirectButton_1_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %���ȫ�ֱ���
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
global g_1;
g_1 = Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 1;
path=uigetdir('','��һ���ӷ���');
  load_needed_data(path,mathod,g_1)  %  ��������,1 ��ʾʹ�õ�һ�������ӽṹ��
   calculate(mathod,g_1);             % ������, 1 ��ʾʹ�õ�һ�������ӽṹ��

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_2.
function indirectButton_2_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %���ȫ�ֱ���
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 2;
path=uigetdir('','�ڶ����ӷ���');
  load_needed_data(path,mathod,g_1)  %  ��������,1 ��ʾʹ�õ�һ�������ӽṹ��
   calculate(mathod,g_1);             % ������, 1 ��ʾʹ�õ�һ�������ӽṹ��

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_3.
function indirectButton_3_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %���ȫ�ֱ���
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 3;
path=uigetdir('','�������ӷ���');
  load_needed_data(path,mathod,g_1)  %  ��������,1 ��ʾʹ�õ�һ�������ӽṹ��
   calculate(mathod,g_1);             % ������, 1 ��ʾʹ�õ�һ�������ӽṹ��

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_4.
function indirectButton_4_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %���ȫ�ֱ���
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});
mathod = 4;
path=uigetdir('','�������ӷ���');
  load_needed_data(path,mathod,g_1)  %  ��������,1 ��ʾʹ�õ�һ�������ӽṹ��
   calculate(mathod,g_1);             % ������, 1 ��ʾʹ�õ�һ�������ӽṹ��

clear path;
close ImportUI
IndirectMainUI

% --- Executes on button press in indirectButton_5.
function indirectButton_5_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;     %���ȫ�ֱ���
%clear Hsoaib size Hcaca Hcbcb Hoaca Hcbib KS C
%global size  KS C
global g_1;
g_1=Project();
defaultanswer={'2'};
sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
g_1.size=str2num(sizeParameter{1});

mathod = 5;
path=uigetdir('','�������ӷ���');
  load_needed_data(path,mathod,g_1)  %  ��������,1 ��ʾʹ�õ�һ�������ӽṹ��
   calculate(mathod,g_1);             % ������, 1 ��ʾʹ�õ�һ�������ӽṹ��

clear path;
close ImportUI
IndirectMainUI