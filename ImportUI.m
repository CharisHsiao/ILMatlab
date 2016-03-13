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

% Last Modified by GUIDE v2.5 28-Mar-2013 21:36:38

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
clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize

global Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize
defaultanswer={'6','3','8'};
sizeParameter=inputdlg({'耦合点数','响应点数','激励点数'},'设定参数',1,defaultanswer);
caSize=str2num(sizeParameter{1});    %读出输入的大小并赋值
oaSize=str2num(sizeParameter{2});
ibSize=str2num(sizeParameter{3});
close ImportUI
path=uigetdir('','直接方法');    % 弹出选择文件夹窗口  并获取用户选择的文件夹路径

if isequal(path,0)
    ImportUI
    return    %退出所在函数的执行
else
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    Hscaca = loadcbf(path,'Hscaca','ca','ca',caSize,caSize);      %调用函数loadcbf读入数据    function ret=loadcbf(path,name,head,tail,row,col)
    waitbar(1/6,hwait,'已载入Hscaca');
    Hscacb = loadcbf(path,'Hscacb','ca','cb',caSize,caSize);
    waitbar(2/6,hwait,'已载入Hscacb');
    Hscbcb = loadcbf(path,'Hscbcb','cb','cb',caSize,caSize);
    waitbar(1/2,hwait,'已载入Hscbcb');
    Hsoaca = loadcbf(path,'Hsoaca','oa','ca',oaSize,caSize);
    waitbar(4/6,hwait,'已载入Hsoaca');
    Hscaib = loadcbf(path,'Hscaib','ca','ib',caSize,ibSize);
    waitbar(5/6,hwait,'已载入Hscaib');
    Hsoaib = loadcbf(path,'Hsoaib','oa','ib',oaSize,ibSize);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);    %暂停0.1毫秒
    pre     %计算开始
close(hwait);
clear path;
end
DirectMainUI


function pre
global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');    %详见消息函数msgbox    modal表示消息框为'模式'模式

I=eye(caSize,caSize);  %单位矩阵
%预留临时变量空间
    HscacaTemp=zeros(caSize,caSize);
    HscacbTemp=zeros(caSize,caSize);
    HscbcbTemp=zeros(caSize,caSize);
    HsoacaTemp=zeros(oaSize,caSize);
    HscaibTemp=zeros(caSize,ibSize);

    %预留结果保存变量空间
Ks=zeros(caSize,caSize,401);
Hcaca=zeros(caSize,caSize,401);
Hcbcb=zeros(caSize,caSize,401);
Hoaca=zeros(oaSize,caSize,401);
Hcbib=zeros(caSize,ibSize,401);
C=zeros(caSize,caSize,401);

% 开始计算
for k=2:401%k为1时计算结果为NaN，跳过
    for i=1:caSize
        for j=1:caSize
            HscacaTemp(i,j)=Hscaca(i,401*(j-1)+k);
            HscacbTemp(i,j)=Hscacb(i,401*(j-1)+k);
            HscbcbTemp(i,j)=Hscbcb(i,401*(j-1)+k);
            if i<=oaSize
                HsoacaTemp(i,j)=Hsoaca(i,401*(j-1)+k);
            end
            if j<=ibSize
                HscaibTemp(i,j)=Hscaib(i,401*(j-1)+k);
            end
        end
    end
            KsTemp=inv(HscacaTemp/(HscacbTemp')*HscbcbTemp-HscacbTemp);
            Ks(:,:,k)=KsTemp;
            Hcaca(:,:,k)=HscacbTemp/(HscbcbTemp-HscacbTemp)/(KsTemp);
            Hcbcb(:,:,k)=HscacbTemp*((HscacbTemp')\HscbcbTemp-I)/(KsTemp);
            Hoaca(:,:,k)=HsoacaTemp/(I-inv(I+HscacaTemp\HscbcbTemp+(HscacaTemp)\inv(KsTemp)));
            Hcbib(:,:,k)=(I+HscbcbTemp/(HscacaTemp)+(KsTemp)\inv(HscacaTemp))*HscaibTemp;
            C(:,:,k)=inv(Hcaca(:,:,k).*I+Hcbcb(:,:,k).*I+inv(Ks(:,:,k).*I));
end

KS=zeros(caSize,401);
for i=1:caSize
    for j=1:401
        KS(i,j)=Ks(i,i,j);
    end
end

clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);


% --- Executes on button press in indirectButton.
function indirectButton_Callback(hObject, eventdata, handles)
% hObject    handle to indirectButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global size KS C Hoaca Hcbib
%defaultanswer={'4'};
defaultanswer={'2'};
sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
size=str2num(sizeParameter{1});
close ImportUI
path=uigetdir('','间接方法');

if isequal(path,0)
    ImportUI
	return
else
    [KS C Hoaca Hcbib]=loadcbf2(path,size);

clear path;
end
IndirectMainUI

