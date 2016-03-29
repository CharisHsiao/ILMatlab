function varargout = IndirectMainUI(varargin)
% IndirectMainUI MATLAB code for IndirectMainUI.fig
%      IndirectMainUI, by itself, creates a new IndirectMainUI or raises the existing
%      singleton*.
%
%      H = IndirectMainUI returns the handle to a new IndirectMainUI or the handle to
%      the existing singleton*.
%
%      IndirectMainUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IndirectMainUI.M with the given input arguments.
%
%      IndirectMainUI('Property','Value',...) creates a new IndirectMainUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IndirectMainUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IndirectMainUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IndirectMainUI

% Last Modified by GUIDE v2.5 07-Apr-2013 18:17:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IndirectMainUI_OpeningFcn, ...
                   'gui_OutputFcn',  @IndirectMainUI_OutputFcn, ...
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


% --- Executes just before IndirectMainUI is made visible.
function IndirectMainUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IndirectMainUI (see VARARGIN)

% Choose default command line output for IndirectMainUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IndirectMainUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
pan1pos=get(handles.KSpanel,'Position');
set(handles.PCpanel,'Position',pan1pos)
set(handles.FTpanel,'Position',pan1pos)

global g_1 KSsaved 
KSsaved=g_1.KS;
set(handles.SizeText,'String',['耦合\响应\激励 点数=' num2str(g_1.size) ]);
KsDraw(1);

% --- Outputs from this function are returned to the command line.
function varargout = IndirectMainUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function KsDraw(n)
%global f KS
global g_1 f
cla;
cla reset;
handles=guidata(gcf);
   set(handles.KSn,'String',num2str(n));
    semilogy(handles.axes1,f(:),abs(g_1.KS(n,:)));
    xlabel('频率 [Hz]');ylabel('K_s [N/m]');
    title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);


% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear global;
%close IndirectMainUI
ImportUI

%%  Tab  panel

% --- Executes on button press in KSpushbutton.
function KSpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSpushbutton (see GCcccBO)
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
FT_plot(1,handles)

%%      KS part

function KSn_Callback(hObject, eventdata, handles)
% hObject    handle to KSn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KSn as text
%        str2double(get(hObject,'String')) returns contents of KSn as a double
global g_1 KSntemp
n=str2num(get(hObject,'String'));
b=round(n);%取整
if b~=n
    n=0;
end

if  n>g_1.size|| n<1
	errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(size) '的正整数']});
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
global g_1
n=str2num(get(handles.KSn,'String'));
n=n+1;
if  n>g_1.size|| n<1
     n=n-1;
	errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(size) '的正整数']});
else
    KsDraw(n);
end

% --- Executes on button press in KSlast.
function KSlast_Callback(hObject, eventdata, handles)
% hObject    handle to KSlast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1
n=str2num(get(handles.KSn,'String'));
n=n-1;
if  n>g_1.size|| n<1
     n=n+1;
	errordlg({'输入的数值不在范围内！';['输入值应为不大于' num2str(size) '的正整数']});
else
    KsDraw(n);
end

% --- Executes on button press in smooth.
function smooth_Callback(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1
% Moving smoothing
Kstemp=g_1.KS;
t=round(g_1.size/4);
for i=1:g_1.size
    for j=1:t
        g_1.KS(i,j)=Kstemp(i,j);
    end
    for j=(t+1):(401-t-1)
        g_1.KS(i,j)=mean(Kstemp(i,j-t:j+t));
    end
    for j=401-t:401
        g_1.KS(i,j)=Kstemp(i,j);
    end
end
KsDraw(round(str2num(get(handles.KSn,'String'))));

%%    PC part

% --- Executes on button press in PCcheckbox.
function PCcheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to PCcheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PCcheckbox
global oa ib yPC g_1;
H=findobj('tag','PCcheckbox');
Value=get(H,'value');
if Value==1
cla;
x=(1:g_1.size);
% y2 = random('Poisson',1:size,1,size);
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
global g_1 oa ib  yPC;
oa=g_1.size+1;ib=g_1.size+1;
defaultanswer={'1','1'};
pcParameter=inputdlg({'oa','ib'},'设定路径贡献参数',1,defaultanswer);
oa=str2num(pcParameter{1});
ib=str2num(pcParameter{2});

if oa<=g_1.size&&ib<=g_1.size  %x==fix(x) fix（x)为取整
    PC=zeros(g_1.size,1);
    for j=1:g_1.size
        temp=0;
        for k=1:401
            temp=temp+(g_1.Hoaca(oa,j,k)*C(j,j,k)*g_1.Hcbib(j,ib,k))^2;
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
    errordlg({'输入的数值不在范围内！';['oa不大于' num2str(g_1.size) ' ib不大于' num2str(g_1.size)]});
end
%%  FT part

% --- Executes on button press in cal_FT.
function cal_FT_Callback(hObject, eventdata, handles)
% hObject    handle to cal_FT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1;
ib=g_1.size+1;
defaultanswer={'1'};
ftParameter=inputdlg('ib','设定力传递参数',1,defaultanswer);
ib=str2num(ftParameter{1});
if ib<=g_1.size
    FT=zeros(g_1.size,1);
    for j=1:g_1.size
        temp=0;
        for k=1:401
            temp=temp+(g_1.C(j,j,k)*g_1.Hcbib(j,ib,k))^2;
        end
        FT(j)= sqrt(temp/401);
    end
    cla;
    bar(abs(FT));
    xlabel('测量点');ylabel('');
    title(strcat('FT: ',num2str(ib)));
else
    errordlg({'输入的数值不在范围内！';['ib不大于' num2str(g_1.size)]});
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
close IndirectMainUI
pc


function PC_plot(Myib,Myoa,handles)
global g_1 yPC
cla;
set(handles.PCcheckbox,'Visible','on');
set(handles.PCcheckbox,'Value',0);
set(handles.gridset,'Value',0);
if Myoa<=g_1.size&&0<Myoa
    if Myib<=g_1.size&&0<Myib  %x==fix(x) fix（x)为取整
            set(handles.oanum,'String',['oa:' num2str(Myoa)]);
            set(handles.sliderOA,'Value',Myoa);
            set(handles.sliderOA,'Max',g_1.size);
            p=1/g_1.size;
            set(handles.sliderOA,'SliderStep', [p p]);
            set(handles.ibnum,'String',['ib:' num2str(Myib)]);
            set(handles.sliderIB,'Value',Myib);
            set(handles.sliderIB,'Max',g_1.size);
            p=1/g_1.size;
            set(handles.sliderIB,'SliderStep', [p p]);
            PC=zeros(g_1.size,1);
            for j=1:g_1.size
                temp=0;
                for k=1:401
                     temp=temp+(g_1.Hoaca(Myoa,j,k)*g_1.C(j,j,k)*g_1.Hcbib(j,Myib,k))^2;
                end
                PC(j)= sqrt(temp/401);
            end
            yPC=abs(PC);
            bar(yPC);
            xlabel('测量点');ylabel('');
            title(strcat('PC: ',num2str(Myib),' TO ',num2str(Myoa)));
    else
        errordlg({'输入的数值不在范围内！';['      0<ib<=' num2str(g_1.size)]},'Error');
        ib=round(get(handles.sliderIB,'Value'));
        set(handles.ib_edit,'String',num2str(ib));
    end
else
    errordlg({'输入的数值不在范围内！';['      0<ca<=' num2str(g_1.size)]},'Error');
    oa=round(get(handles.sliderOA,'Value'));
    set(handles.oa_edit,'String',num2str(oa));
end


function FT_plot(Myib,handles)
global g_1 yFT
cla;
set(handles.FTcheckbox,'Visible','on');
set(handles.FTcheckbox,'Value',0);
set(handles.gridset,'Value',0);
if Myib<=g_1.size&&0<Myib  %x==fix(x) fix（x)为取整
	set(handles.ibnum4FT,'String',['ib:' num2str(Myib)]);
	set(handles.sliderIB4FT,'Value',Myib);
 	set(handles.sliderIB4FT,'Max',g_1.size);
 	p=1/g_1.size;
	set(handles.sliderIB4FT,'SliderStep', [p p]);
    FT=zeros(g_1.size,1);
    for j=1:g_1.size
        temp=0;
        for k=1:401
             temp=temp+(g_1.C(j,j,k)*g_1.Hcbib(j,Myib,k))^2;
        end
        FT(j)= sqrt(temp/401);
    end
    cla;
    yFT=abs(FT);
    bar(yFT);
    xlabel('测量点');ylabel('');
    title(strcat('FT:  ',num2str(Myib)));
else
	errordlg({'输入的数值不在范围内！';['      0<ib<=' num2str(g_1.size)]},'Error');
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
global yFT g_1;
H=findobj('tag','FTcheckbox');
Value=get(H,'value');
if Value==1
cla;
x=(1:g_1.size);
% y2 = random('Poisson',1:size,1,size);
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
msgbox({'珠海广通客车有限公司','','客车动态质量逆子结构检测技术软件','','暨南大学大学生创新创业训练计划资助','','2013年4月   v2.0'},'关于IVSSA', 'none','modal');
