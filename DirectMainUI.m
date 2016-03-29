function varargout = DirectMainUI(varargin)
% DirectMainUI MATLAB code for DirectMainUI.fig
%      DirectMainUI, by itself, creates a new DirectMainUI or raises the existing
%      singleton*.
%
%      H = DirectMainUI returns the handle to a new DirectMainUI or the handle to
%      the existing singleton*.
%
%      DirectMainUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DirectMainUI.M with the given input arguments.
%
%      DirectMainUI('Property','Value',...) creates a new DirectMainUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DirectMainUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DirectMainUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DirectMainUI

% Last Modified by GUIDE v2.5 12-Mar-2016 17:06:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @DirectMainUI_OpeningFcn, ...
    'gui_OutputFcn',  @DirectMainUI_OutputFcn, ...
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


% --- Executes just before DirectMainUI is made visible.
function DirectMainUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DirectMainUI (see VARARGIN)

% Choose default command line output for DirectMainUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DirectMainUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
pan1pos=get(handles.KSpanel,'Position');
set(handles.PCpanel,'Position',pan1pos)
set(handles.FTpanel,'Position',pan1pos)

global  KSsaved g_1
g_1=Project()
KSsaved=g_1.KS;
set(handles.SizeText,'String',['耦合点数=' num2str(g_1.caSize) '  响应点数=' num2str(g_1.oaSize)  '  激励点数=' num2str(g_1.ibSize)]); %设置对象属性值
KsDraw(1);

% --- Outputs from this function are returned to the command line.
function varargout = DirectMainUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function KsDraw(n)
global f g_1
cla;    %清除图像
cla reset;
handles=guidata(gcf);
set(handles.KSn,'String',num2str(n));
semilogy(handles.axes1,f(:),abs(g_1.KS(n,:)));    %semilogy 横坐标为线性坐标轴，纵坐标为对数坐标轴
xlabel('频率 [Hz]');ylabel('K_s [N/m]');
title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);


% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close DirectMainUI
ImportUI

% --- Executes on button press in KSpushbutton.
function KSpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.KSpanel,'Visible','on');
set(handles.PCpanel,'Visible','off');
set(handles.FTpanel,'Visible','off');
KsDraw(1);    %标签切换时即时更新

% --- Executes on button press in PCpushbutton.
function PCpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.KSpanel,'Visible','off');
set(handles.PCpanel,'Visible','on');
set(handles.FTpanel,'Visible','off');
PC_plot(1,1,handles);

% --- Executes on button press in FTpushbutton.
function FTpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.KSpanel,'Visible','off');
set(handles.PCpanel,'Visible','off');
set(handles.FTpanel,'Visible','on');
FT_plot(1,handles);


function KSn_Callback(hObject, eventdata, handles)
% hObject    handle to KSn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KSn as text
%        str2double(get(hObject,'String')) returns contents of KSn as a double
global caSize KSntemp
n=str2num(get(hObject,'String'));
b=round(n);%取整
if b~=n
    n=0;
end

if  n>caSize|| n<1
    errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(caSize) '的正整数']});
    set(handles.KSn,'String',KSntemp);
    n=KSntemp;
else
    KSntemp=n;
    KsDraw(n);
end

% --- Executes during object creation, after setting all properties.
function KSn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to KSn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global KSntemp
KSntemp=1;
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in KSnext.
function KSnext_Callback(hObject, eventdata, handles)
% hObject    handle to KSnext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global caSize
n=str2num(get(handles.KSn,'String'));
n=n+1;
if  n>caSize|| n<1
    n=n-1;
    errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(caSize) '的正整数']});
else
    KsDraw(n);
end

% --- Executes on button press in KSlast.
function KSlast_Callback(hObject, eventdata, handles)
% hObject    handle to KSlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global caSize
n=str2num(get(handles.KSn,'String'));
n=n-1;
if  n>caSize|| n<1
    n=n+1;
    errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(caSize) '的正整数']});
else
    KsDraw(n);
end

% --- Executes on button press in smooth.
function smooth_Callback(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global caSize KS
% Moving smoothing
Kstemp=KS;
t=round(caSize/4);    %round 四舍五入
for i=1:caSize
    for j=1:t
        KS(i,j)=Kstemp(i,j);
    end
    for j=(t+1):(401-t-1)
        KS(i,j)=mean(Kstemp(i,j-t:j+t));
    end
    for j=401-t:401
        KS(i,j)=Kstemp(i,j);
    end
end
KsDraw(round(str2num(get(handles.KSn,'String'))));


% --- Executes on button press in PCcheckbox.
function PCcheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to PCcheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PCcheckbox
global oa ib yPC caSize;
H=findobj('tag','PCcheckbox');
Value=get(H,'value');
if Value==1
    cla;
    x=(1:caSize);
    % y2 = random('Poisson',1:caSize,1,caSize);
    y2=yPC;
    bar(x-.2,yPC,.4,'b');
    hold on;
    bar(x+.2,y2,.4,'r');
else
    cla;
    bar(yPC);
end

% --- Executes on button press in cal_PC.
function cal_PC_Callback(hObject, eventdata, handles)
% hObject    handle to cal_PC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hoaca Hcbib C caSize oaSize ibSize oa ib yPC;
oa=oaSize+1;ib=ibSize+1;
defaultanswer={'1','1'};
pcParameter=inputdlg({'oa','ib'},'设定路径贡献参数',1,defaultanswer);
oa=str2num(pcParameter{1});
ib=str2num(pcParameter{2});
if oa<=oaSize&&ib<=ibSize  %x==fix(x) fix（x)为取整
    PC=zeros(caSize,1);
    for j=1:caSize
        temp=0;
        for k=1:401
            temp=temp+(Hoaca(oa,j,k)*C(j,j,k)*Hcbib(j,ib,k))^2;
        end
        PC(j)= sqrt(temp/401);
    end
    cla;
    bar(abs(PC));
    yPC=abs(PC);
    xlabel('测量点');ylabel('');
    title(strcat('PC: ',num2str(ib),' TO ',num2str(oa)));
    set(handles.PCcheckbox,'Visible','on');
    set(handles.PCcheckbox,'Value',0);
else
    errordlg({'输入的数值不在范围内！';['oa不大于' num2str(oaSize) ' ib不大于' num2str(ibSize)]});
end

% --- Executes on button press in cal_FT.
function cal_FT_Callback(hObject, eventdata, handles)
% hObject    handle to cal_FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hcbib C caSize ibSize;
ib=ibSize+1;
defaultanswer={'1'};
ftParameter=inputdlg('ib','设定力传递参数',1,defaultanswer);
ib=str2num(ftParameter{1});
if ib<=ibSize
    FT=zeros(caSize,1);
    for j=1:caSize
        temp=0;
        for k=1:401
            temp=temp+(C(j,j,k)*Hcbib(j,ib,k))^2;
        end
        FT(j)= sqrt(temp/401);
    end
    cla;
    bar(abs(FT));
    xlabel('测量点');ylabel('');
    title(strcat('FT: ',num2str(ib)));
else
    errordlg({'输入的数值不在范围内！';['ib不大于' num2str(ibSize)]});
end


% --- Executes on button press in gridset.
function gridset_Callback(hObject, eventdata, handles)
% hObject    handle to gridset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.gridset,'Value') == 1)
    grid on
else grid off
end
% Hint: get(hObject,'Value') returns toggle state of gridset


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close DirectMainUI
pc


function PC_plot(Myib,Myoa,handles)
global Hoaca Hcbib C caSize oaSize ibSize yPC
cla;
set(handles.PCcheckbox,'Visible','on');
set(handles.PCcheckbox,'Value',0);
set(handles.gridset,'Value',0);
if Myoa<=oaSize&&0<Myoa
    if Myib<=ibSize&&0<Myib  %x==fix(x) fix（x)为取整
        set(handles.oanum,'String',['oa:' num2str(Myoa)]);
        set(handles.sliderOA,'Value',Myoa);
        set(handles.sliderOA,'Max',oaSize);
        p=1/oaSize;
        set(handles.sliderOA,'SliderStep', [p p]);
        set(handles.ibnum,'String',['ib:' num2str(Myib)]);
        set(handles.sliderIB,'Value',Myib);
        set(handles.sliderIB,'Max',ibSize);
        p=1/ibSize;
        set(handles.sliderIB,'SliderStep', [p p]);
        PC=zeros(caSize,1);
        for j=1:caSize
            temp=0;
            for k=1:401
                temp=temp+(Hoaca(Myoa,j,k)*C(j,j,k)*Hcbib(j,Myib,k))^2;
            end
            PC(j)= sqrt(temp/401);
        end
        yPC=abs(PC);
        bar(yPC);
        xlabel('测量点');ylabel('');
        title(strcat('PC: ',num2str(Myib),' TO ',num2str(Myoa)));
    else
        errordlg({'输入的数值不在范围内！';['      0<ib<=' num2str(ibSize)]},'Error');
        ib=round(get(handles.sliderIB,'Value'));
        set(handles.ib_edit,'String',num2str(ib));
    end
else
    errordlg({'输入的数值不在范围内！';['      0<ca<=' num2str(caSize)]},'Error');
    oa=round(get(handles.sliderOA,'Value'));
    set(handles.oa_edit,'String',num2str(oa));
end


function FT_plot(Myib,handles)
global Hcbib C caSize ibSize yFT
cla;
set(handles.FTcheckbox,'Visible','on');
set(handles.FTcheckbox,'Value',0);
set(handles.gridset,'Value',0);
if Myib<=ibSize&&0<Myib  %x==fix(x) fix（x)为取整
    set(handles.ibnum4FT,'String',['ib:' num2str(Myib)]);
    set(handles.sliderIB4FT,'Value',Myib);
    set(handles.sliderIB4FT,'Max',ibSize);
    p=1/ibSize;
    set(handles.sliderIB4FT,'SliderStep', [p p]);
    FT=zeros(caSize,1);
    for j=1:caSize
        temp=0;
        for k=1:401
            temp=temp+(C(j,j,k)*Hcbib(j,Myib,k))^2;
        end
        FT(j)= sqrt(temp/401);
    end
    cla;
    yFT=abs(FT);
    bar(yFT);
    xlabel('测量点');ylabel('');
    title(strcat('FT:  ',num2str(Myib)));
else
    errordlg({'输入的数值不在范围内！';['      0<ib<=' num2str(ibSize)]},'Error');
    ib=round(get(handles.slider3,'Value'));
    set(handles.ib_edit,'String',num2str(ib));
end


% --- Executes on slider movement.
function sliderIB_Callback(hObject, eventdata, handles)
% hObject    handle to sliderIB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
ib=round(get(handles.sliderIB,'Value'));
set(handles.ibnum,'String',['ib:' num2str(ib)]);
set(handles.ib_edit,'String',num2str(ib));
oa=round(get(handles.sliderOA,'Value'));
PC_plot(ib,oa,handles);

% --- Executes during object creation, after setting all properties.
function sliderIB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderIB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderOA_Callback(hObject, eventdata, handles)
% hObject    handle to sliderOA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
oa=round(get(handles.sliderOA,'Value'));
set(handles.ibnum,'String',['oa:' num2str(oa)]);
set(handles.oa_edit,'String',num2str(oa));
ib=round(get(handles.sliderIB,'Value'));
PC_plot(ib,oa,handles);

% --- Executes during object creation, after setting all properties.
function sliderOA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderOA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ib_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ib_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ib_edit as text
%        str2double(get(hObject,'String')) returns contents of ib_edit as a double
ib = str2num(get(handles.ib_edit,'String'));
oa=str2num(get(handles.oa_edit,'String'));
PC_plot(ib,oa,handles);

% --- Executes during object creation, after setting all properties.
function ib_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ib_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oa_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oa_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oa_edit as text
%        str2double(get(hObject,'String')) returns contents of oa_edit as a double
ib = str2num(get(handles.ib_edit,'String'));
oa=str2num(get(handles.oa_edit,'String'));
PC_plot(ib,oa,handles);

% --- Executes during object creation, after setting all properties.
function oa_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oa_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderIB4FT_Callback(hObject, eventdata, handles)
% hObject    handle to sliderIB4FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
ib=round(get(handles.sliderIB4FT,'Value'));
set(handles.ibnum4FT,'String',['ib:' num2str(ib)]);
set(handles.ib_edit4FT,'String',num2str(ib));
FT_plot(ib,handles);

% --- Executes during object creation, after setting all properties.
function sliderIB4FT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderIB4FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function ib_edit4FT_Callback(hObject, eventdata, handles)
% hObject    handle to ib_edit4FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ib_edit4FT as text
%        str2double(get(hObject,'String')) returns contents of ib_edit4FT as a double
ib = str2num(get(handles.ib_edit4FT,'String'));
FT_plot(ib,handles);

% --- Executes during object creation, after setting all properties.
function ib_edit4FT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ib_edit4FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FTcheckbox.
function FTcheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to FTcheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global yFT caSize;
H=findobj('tag','FTcheckbox');
Value=get(H,'value');
if Value==1
    cla;
    x=(1:caSize);
    % y2 = random('Poisson',1:caSize,1,caSize);
    y2=yFT/2;
    bar(x-.2,yFT,.4,'b');
    hold on;
    bar(x+.2,y2,.4,'r');
else
    cla;
    bar(yFT);
end
% Hint: get(hObject,'Value') returns toggle state of FTcheckbox


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['退出程序?'],...
    ['退出 ' ],...
    '是','否','是');
if strcmp(selection,'否')
    return;
end
delete(handles.figure1)
clear handles.axes1 all


% --- Executes on button press in KSrecover.
function KSrecover_Callback(hObject, eventdata, handles)
% hObject    handle to KSrecover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global KSsaved KS
KS=KSsaved;
KsDraw(round(str2num(get(handles.KSn,'String'))));


% --------------------------------------------------------------------
function project_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function projectInfo_Callback(hObject, eventdata, handles)
projInfoParameter=inputdlg({'项目名称','实验地点','实验日期','参与人员'},'项目信息');
projName=(projInfoParameter{1});
projPlace=(projInfoParameter{2});
projDate=(projInfoParameter{3});
projPep=(projInfoParameter{4});

% --------------------------------------------------------------------
function structure_Callback(hObject, eventdata, handles)
structureParameter=inputdlg({'子结构A','子结构B','子结构C'},'结构信息');
ssA=(structureParameter{1});
ssB=(structureParameter{2});
ssC=(structureParameter{3});


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'珠海广通客车有限公司','','客车装配动态质量逆子结构检测技术软件','','珠海市科工贸信局-暨南大学产学研项目资助','','2013年6月   v2.0'},'关于IVSSA', 'none','modal');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over KSpushbutton.
function KSpushbutton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to KSpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
