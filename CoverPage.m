function varargout = CoverPage(varargin)
% COVERPAGE M-start for CoverPage.fig
%      COVERPAGE, by itself, creates a new COVERPAGE or raises the existing
%      singleton*.
%
%      H = COVERPAGE returns the handle to a new COVERPAGE or the handle to
%      the existing singleton*.
%
%      COVERPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVERPAGE.M with the given input arguments.
%
%      COVERPAGE('Property','Value',...) creates a new COVERPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CoverPage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CoverPage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CoverPage

% Last Modified by GUIDE v2.5 17-Apr-2016 12:33:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @CoverPage_OpeningFcn, ...
    'gui_OutputFcn',  @CoverPage_OutputFcn, ...
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


% --- Executes just before CoverPage is made visible.
function CoverPage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CoverPage (see VARARGIN)

% Choose default command line output for CoverPage

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.KSlastpushbutton,'Enable','inactive');
set(handles.KSnextpushbutton,'Enable','inactive');
set(handles.PCiblastpushbutton,'Enable','inactive');
set(handles.PCibnextpushbutton,'Enable','inactive');
set(handles.PCoalastpushbutton,'Enable','inactive');
set(handles.PCoanextpushbutton,'Enable','inactive');
set(handles.FTiblastpushbutton,'Enable','inactive');
set(handles.FTibnextpushbutton,'Enable','inactive');
set(handles.Directpushbutton,'Enable','inactive');
set(handles.Indirectpushbutton_1,'Enable','inactive');
set(handles.Indirectpushbutton_2,'Enable','inactive');
set(handles.Indirectpushbutton_3,'Enable','inactive');
set(handles.Indirectpushbutton_4,'Enable','inactive');
set(handles.Indirectpushbutton_5,'Enable','inactive');
% set(handles.Load_Loadsample,'Check','off');
set(handles.Load_Loadsample,'Enable','off');
set(handles.Comparecheckbox,'Value',0);
set(handles.Comparecheckbox,'Visible','off');
set(handles.gridset,'Value',0);
global LoadSflag 
LoadSflag = 0;
clear  global g_1 s  fileInfo
global g_1 s  
g_1 = Project();
s = Project();
% fileInfo = FileInfo();
% fileInfo.PrPath = 'F:\git\ILMatlab\AssemblyLine_1\General';
% fileInfo.AlPath = 'F:\git\ILMatlab\AssemblyLine_1';
% fileInfo.PrName = 'General';
% fileInfo.AlName = 'AssemblyLine_1';
g_1.method = 0;


% UIWAIT makes CoverPage wait for user response (see UIRESUME)
% uiwait(handles.CoverPagefigure);
% uiwait(GetPath);

% --- Outputs from this function are returned to the command line.
function varargout = CoverPage_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Directpushbutton.
function Directpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Directpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear  g_1 
global g_1  fileInfo  KSgSave
g_1.method  = 0;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','on');
    set(handles.outtext,'Visible','on');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.methodtext,'String','ֱ�����ӽṹ��');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.ctext,'String',['��ϵ�����' num2str(g_1.caSize)]);
    set(handles.intext,'String',['��������ib��' num2str(g_1.ibSize)]);
    set(handles.outtext,'String',['��Ӧ����oa��' num2str(g_1.oaSize)]);
    displayWhole(g_1);
else
    %������ʾ��Ϣ
    clear  g_1  
    return;
end


% --- Executes on button press in Indirectpushbutton_1.
function Indirectpushbutton_1_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear  g_1 
global g_1  fileInfo KSgSave

% g_1 = Project();
g_1.method  = 1;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','off');
    set(handles.outtext,'Visible','off');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.methodtext,'String','��һ�������ӽṹ��');
    set(handles.ctext,'String',['������' num2str(g_1.size)]);
    displayWhole(g_1);
    
else
    %������ʾ��Ϣ
    clear  g_1  
    return;
end





% --- Executes on button press in Indirectpushbutton_2.
function Indirectpushbutton_2_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear   g_1
global g_1  fileInfo KSgSave
g_1.method  = 2;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','off');
    set(handles.outtext,'Visible','off');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.methodtext,'String','�ڶ��������ӽṹ��');
    set(handles.ctext,'String',['������' num2str(g_1.size)]);
    displayWhole(g_1);
else
    %������ʾ��Ϣ
    clear  g_1 
    return;
end

% --- Executes on button press in Indirectpushbutton_3.
function Indirectpushbutton_3_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Indirectpushbutton_3
clear g_1
global g_1  fileInfo KSgSave
g_1.method  = 3;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','off');
    set(handles.outtext,'Visible','off');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.methodtext,'String','�����������ӽṹ��');
    set(handles.ctext,'String',['������' num2str(g_1.size)]);
    displayWhole(g_1);
else
    %������ʾ��Ϣ
    clear  g_1  method
    return;
end

% --- Executes on button press in Indirectpushbutton_4.
function Indirectpushbutton_4_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear  g_1  
global g_1  fileInfo KSgSave
g_1.method  = 4;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','off');
    set(handles.outtext,'Visible','off');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.methodtext,'String','�����������ӽṹ��');
    set(handles.ctext,'String',['������' num2str(g_1.size)]);
    displayWhole(g_1);
else
    %������ʾ��Ϣ
    clear  g_1  
    return;
end



% --- Executes on button press in Indirectpushbutton_5.
function Indirectpushbutton_5_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Indirectpushbutton_4.
clear  g_1  
global g_1  fileInfo KSgSave
g_1.method  = 5;
if(~getSize(g_1))
    %������ʾ��Ϣ
    return;
elseif isequal(fileInfo.PrPath,0)
    %������ʾ��Ϣ,·��������
    return
elseif(load_needed_data(fileInfo.PrPath,g_1)&&calculate(g_1))
    %��ʾ����ͼ������ؿؼ�
    KSgSave = g_1.KS;
    set(handles.intext,'Visible','off');
    set(handles.outtext,'Visible','off');
    set(handles.Comparecheckbox,'Visible','off');
    set(handles.Load_Loadsample,'Enable','on');
    set(handles.methodtext,'String','�����������ӽṹ��');
    set(handles.ctext,'String',['������' num2str(g_1.size)]);
    displayWhole(g_1);
else
    %������ʾ��Ϣ
    clear  g_1  
    return;
end

function KSnedit_Callback(hObject, eventdata, handles)
% hObject    handle to KSnedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KSnedit as text
%        str2double(get(hObject,'String')) returns contents of KSnedit as a double
global  LoadSflag g_1 s
str = get(handles.KSnedit,'String');
len = length(str);
s = [];
flag = 1;
%����������ַ����ĺϷ��� ��ֻ��������������

for i = 1:len
    if str(i)>'9'||str(i)<'0'
        flag = 0;
        break;
    end
end

if(~flag)
    %��ʾ��ʾ��Ϣ�����벻�Ϸ�
    errordlg({'���벻�Ϸ���';'ֻ��������������������ܰ����ո��Լ������ַ�'});
else
    n = str2num(str);
    if isequal(length(n),0)
        errordlg({'����������';});
    else
        
        if((g_1.method == 0&&n<=g_1.caSize )||(g_1.method ~=0 && n <= g_1.size))&&n>0
            if(~LoadSflag)
                KSDraw(n,g_1);
            else
                KSDraw(n,g_1,s);
            end
        else
            %��ʾ��ʾ��Ϣ�������ֵ������Χ
            errordlg({'�����ֵ������Χ';});
            set(handles.KSnedit,'String','');
        end
        
        
        if(n ==1 )
            set(handles.KSlastpushbutton,'Enable','inactive');
        else
            set(handles.KSlastpushbutton,'Enable','on');
        end
        if(g_1.method == 0&& n==g_1.caSize )||(g_1.method ~=0 && n == g_1.size)
            set(handles.KSnextpushbutton,'Enable','inactive');
        else
            set(handles.KSnextpushbutton,'Enable','on');
        end
        
    end
end


% --- Executes during object creation, after setting all properties.
function KSnedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to KSnedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in KSlastpushbutton.
function KSlastpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSlastpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
n=str2num(get(handles.KSnedit,'String'));
if~isempty(get(handles.KSnedit,'String'))
    
    if(n>=2)
        n=n-1;
        set(handles.KSnedit,'String',num2str(n));
        if(~LoadSflag)  %�ж��Ƿ��Ѿ�������Ʒ������
            KSDraw(n,g_1);
        else
            KSDraw(n,g_1,s);
        end
    end
    if n==1
        set(handles.KSlastpushbutton,'Enable','inactive');
    else
        set(handles.KSlastpushbutton,'Enable','on');
    end
    
    if((g_1.method == 0 &&n<g_1.caSize)||(g_1.method ~= 0&&n<g_1.size))
        set(handles.KSnextpushbutton,'Enable','on');
    else
        set(handles.KSnextpushbutton,'Enable','inactive');
    end
end
% --- Executes on button press in KSnextpushbutton.
function KSnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
n=str2num(get(handles.KSnedit,'String'));
if~isempty(get(handles.KSnedit,'String'))
    if((g_1.method == 0 &&n<g_1.caSize)||(g_1.method ~= 0&&n<g_1.size))%�жϵ�ǰѡ��ķ�����KSn�����ֵ
        n=n+1;
        set(handles.KSnedit,'String',num2str(n));
        if(~LoadSflag)
            KSDraw(n,g_1);%�ж��Ƿ��Ѿ�������Ʒ������
        else
            KSDraw(n,g_1,s);
        end
    end
    
    if (g_1.method == 0 &&n==g_1.caSize)||(g_1.method ~= 0&&n==g_1.size)
        set(handles.KSnextpushbutton,'Enable','inactive');
    end
    
    if n>1
        set(handles.KSlastpushbutton,'Enable','on');
    end
end



% --- Executes on button press in Smoothpushbutton.
function Smoothpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Smoothpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1 s LoadSflag 


n = str2num(get(handles.KSnedit,'String'));
KStemp = g_1.KS;

if(g_1.method == 0)
    t = round(g_1.caSize/4);
    Sizetemp = g_1.caSize;
else
    t = round(g_1.size/4);
    Sizetemp = g_1.size;
end

for i = 1:Sizetemp
    for j = 1:t
        g_1.KS(i,j)=KStemp(i,j);
    end
    for j=(t+1):(length(g_1.f(:))-t-1)
        g_1.KS(i,j)=mean(KStemp(i,j-t:j+t));
    end
    for j=401-t:401
        g_1.KS(i,j)=KStemp(i,j);
    end
end
if(LoadSflag)%�����Ʒ����Ҳ�����ˣ���Ʒ���ݵ���ͬ��ƽ��
    for i = 1:Sizetemp
        for j = 1:t
            s.KS(i,j)=Kstemp(i,j);
        end
        for j=(t+1):(length(g_1.f(:))-t-1)
            s.KS(i,j)=mean(KStemp(i,j-t:j+t));
        end
        for j=401-t:401
            s.KS(i,j)=KStemp(i,j);
        end
    end
end
if ~LoadSflag
    KSDraw(n,g_1);
else
    KSDraw(n,g_1,s);
end





% --- Executes on button press in KSrecoverpushbutton.
function KSrecoverpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSrecoverpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global KSsSave KSgSave g_1 s LoadSflag
g_1.KS = KSgSave;
s.KS = KSsSave;
temp = get(handles.KSnedit,'String');
n = str2num(temp);
if(~LoadSflag)
    KSDraw(n,g_1);
else
    KSDraw(n,g_1,s);
end




function PCibedit_Callback(hObject, eventdata, handles)
% hObject    handle to PCibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCibedit as text
%        str2double(get(hObject,'String')) returns contents of PCibedit as a double
global  LoadSflag g_1 s
str = get(handles.PCibedit,'String');
len = length(str);
s = [];
flag = 1;
%����������ַ����ĺϷ��� ��ֻ��������������
for i = 1:len
    if str(i)>'9'||str(i)<'0'
        flag = 0;
        break;
    end
end

if(~flag)
    %��ʾ��ʾ��Ϣ�����벻�Ϸ�
    errordlg({'���벻�Ϸ���';'ֻ���������������,���ܰ����ո��Լ������ַ�'});
    set(handles.PCibedit,'String','');
else
    ib = str2num(str);
    if isequal(length(ib),0)
        errordlg({'����������';});
    else
        oa = str2num(get(handles.PCoaedit,'String'));
        if((g_1.method == 0&& ib<=g_1.ibSize )||(g_1.method ~=0 &&  ib <= g_1.size))&&ib>0
            if(~LoadSflag)
                PCDraw(ib,oa,g_1);
            else
                PCDraw(ib,oa,g_1,s);
            end
        else
            %��ʾ��ʾ��Ϣ�������ֵ������Χ
            errordlg({'�����ֵ������Χ';});
            set(handles.PCibedit,'String','');
        end
        
        if(ib ==1 )
            set(handles.PCiblastpushbutton,'Enable','inactive');
        else
            set(handles.PCiblastpushbutton,'Enable','on');
        end
        if(g_1.method == 0&& ib ==g_1.ibSize )||(g_1.method ~=0 && ib == g_1.size)
            set(handles.PCibnextpushbutton,'Enable','inactive');
        else
            set(handles.PCibnextpushbutton,'Enable','on');
        end
    end
end


% --- Executes during object creation, after setting all properties.
function PCibedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PCiblastpushbutton.
function PCiblastpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCiblastpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if~isempty(get(handles.PCibedit,'String'))
    if(ib>=2)
        ib=ib-1;
        set(handles.PCibedit,'String',num2str(ib));
        if(~LoadSflag)  %�ж��Ƿ��Ѿ�������Ʒ������
            PCDraw(ib,oa,g_1);
        else
            PCDraw(ob,oa,g_1,s);
        end
    end
    
    if ib== 1
        set(handles.PCiblastpushbutton,'Enable','inactive');
    else
        set(handles.PCiblastpushbutton,'Enable','on');
    end
    if (g_1.method == 0 &&ib<g_1.ibSize)||(g_1.method ~= 0&&ib<g_1.size)
        set(handles.PCibnextpushbutton,'Enable','on');
    else
        set(handles.PCibnextpushbutton,'Enable','inactive');
    end
end




% --- Executes on button press in PCibnextpushbutton.
function PCibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if~isempty(get(handles.PCibedit,'String'))
    if((g_1.method == 0 && ib<g_1.ibSize)||(g_1.method ~= 0&&ib<g_1.size))%�жϵ�ǰѡ��ķ�����KSn�����ֵ
        ib=ib+1;
        set(handles.PCibedit,'String',num2str(ib));
        if(isequal(LoadSflag,0))
            PCDraw(ib,oa,g_1);%�ж��Ƿ��Ѿ�������Ʒ������
        else
            PCDraw(ib,oa,g_1,s);
        end
    end
    
    if (g_1.method == 0 &&ib==g_1.ibSize)||(g_1.method ~= 0&&ib==g_1.size)
        set(handles.PCibnextpushbutton,'Enable','inactive');
    end
    
    if ib>1
        set(handles.PCiblastpushbutton,'Enable','on');
    end
end


function PCoaedit_Callback(hObject, eventdata, handles)
% hObject    handle to PCoaedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCoaedit as text
%        str2double(get(hObject,'String')) returns contents of PCoaedit as a double
global  LoadSflag g_1 s
str = get(handles.Poabedit,'String');
len = length(str);
s = [];
flag = 1;
%����������ַ����ĺϷ��� ��ֻ��������������
for i = 1:len
    if str(i)>'9'||str(i)<'0'  %�����������
        flag = 0;
        break;
    end
end

if(~flag)
    %��ʾ��ʾ��Ϣ�����벻�Ϸ�
    errordlg({'���벻�Ϸ���';'ֻ���������������,���ܰ����ո��Լ������ַ�'});
    set(handles.PCoaedit,'String','');
else
    oa = str2num(str);
    if isequal(length(oa),0)
        errordlg({'����������';});
    else
        ib = str2num(get(handles.PCibedit,'String'));
        if((g_1.method == 0&&oa<=g_1.oaSize )||(g_1.method ~=0 && oa <= g_1.size))&&oa>0
            if(~LoadSflag)
                PCDraw(ib,oa,g_1);
            else
                PCDraw(ib,oa,g_1,s);
            end
        else
            %��ʾ��ʾ��Ϣ�������ֵ������Χ
            errordlg({'�����ֵ������Χ';});
            set(handles.PCoaedit,'String','');
        end
        
        if(oa ==1 )
            set(handles.PCoalastpushbutton,'Enable','inactive');
        else
            set(handles.PCoalastpushbutton,'Enable','on');
        end
        if(g_1.method == 0&& oa ==g_1.oaSzie )||(g_1.method ~=0 && oa == g_1.size)
            set(handles.PCoanextpushbutton,'Enable','inactive');
        else
            set(handles.PCoanextpushbutton,'Enable','on');
        end
    end
end



% --- Executes during object creation, after setting all properties.
function PCoaedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCoaedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PCoalastpushbutton16.
function PCoalastpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoalastpushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if~isempty(get(handles.PCoaedit,'String'))
    if(oa>=2)
        oa=oa-1;
        set(handles.PCoaedit,'String',num2str(oa));
        if(~LoadSflag)  %�ж��Ƿ��Ѿ�������Ʒ������
            PCDraw(ib,oa,g_1);
        else
            PCDraw(ib,oa,g_1,s);
        end
    end
    
    if oa== 1
        set(handles.PCoalastpushbutton,'Enable','inactive');
    else
        set(handles.PCoalastpushbutton,'Enable','on');
    end
    if (g_1.method == 0 &&oa<g_1.oaSize)||(g_1.method ~= 0&&oa<g_1.size)
        set(handles.PCoanextpushbutton,'Enable','on');
    else
        set(handles.PCoanextpushbutton,'Enable','inactive');
    end
end


% --- Executes on button press in PCoanextpushbutton17.
function PCoanextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoanextpushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if~isempty(get(handles.PCoaedit,'String'))
    if((g_1.method == 0 && oa<g_1.oaSize)||(g_1.method ~= 0&&oa<g_1.size))%�жϵ�ǰѡ��ķ��������ֵ
        oa=oa+1;
        set(handles.PCoaedit,'String',num2str(oa));
        if ~LoadSflag
            PCDraw(ib,oa,g_1);%�ж��Ƿ��Ѿ�������Ʒ������
        else
            PCDraw(ib,oa,g_1,s);
        end
    end
    
    if (g_1.method == 0 &&oa==g_1.oaSize)||(g_1.method ~= 0&&oa==g_1.size)
        set(handles.PCoanextpushbutton,'Enable','inactive');
    end
    
    if oa>1
        set(handles.PCoalastpushbutton,'Enable','on');
    end
end

function FTibedit_Callback(hObject, eventdata, handles)
% hObject    handle to FTibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FTibedit as text
%        str2double(get(hObject,'String')) returns contents of FTibedit as a double
global  LoadSflag g_1 s
str = get(handles.FTibedit,'String');
len = length(str);
s = [];
flag = 1;
%����������ַ����ĺϷ��� ��ֻ��������������
for i = 1:len
    if str(i)>'9'||str(i)<'0'
        flag = 0;
        break;
    end
end

if(~flag)
    %��ʾ��ʾ��Ϣ�����벻�Ϸ�
    errordlg({'���벻�Ϸ���';'ֻ���������������,���ܰ����ո��Լ������ַ�'});
    set(handles.FTibedit,'String','');
else
    ib = str2num(get(handles.FTibedit,'String'));
    if isequal(length(ib),0)
        errordlg({'����������';});
    else
        if((g_1.method == 0&& ib<=g_1.ibSize )||(g_1.method ~=0 &&  ib <= g_1.size))&&ib>0
            if(~LoadSflag)
                FTDraw(ib,g_1)
            else
                FTDraw(g_1,s,ib);
            end
        else
            %��ʾ��ʾ��Ϣ�������ֵ������Χ
            errordlg({'�����ֵ������Χ';});
            set(handles.FTibedit,'String','');
        end
        
        if(ib ==1 )
            set(handles.FTiblastpushbutton,'Enable','inactive');
        else
            set(handles.FTiblastpushbutton,'Enable','on');
        end
        if(g_1.method == 0&& ib ==g_1.ibSize )||(g_1.method ~=0 && ib == g_1.size)
            set(handles.FTibnextpushbutton,'Enable','inactive');
        else
            set(handles.FTibnextpushbutton,'Enable','on');
        end
    end
end


% --- Executes during object creation, after setting all properties.
function FTibedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FTibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FTiblastpushbutton.
function FTiblastpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTiblastpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.FTibedit,'String'));
if~isempty(get(handles.FTibedit,'String'))
    if(ib>=2)
        ib=ib-1;
        set(handles.FTibedit,'String',num2str(ib));
        if(~LoadSflag)  %�ж��Ƿ��Ѿ�������Ʒ������
            FTDraw(ib,g_1)
        else
            FTDraw(ib,g_1,s);
        end
    end
    
    if ib == 1
        set(handles.FTiblastpushbutton,'Enable','inactive');
    else
        set(handles.FTiblastpushbutton,'Enable','on');
    end
    if (g_1.method == 0 &&ib<g_1.ibSize)||(g_1.method ~= 0&&ib<g_1.size)
        set(handles.FTibnextpushbutton,'Enable','on');
    else
        set(handles.FTibnextpushbutton,'Enable','inactive');
    end
end

% --- Executes on button press in FTibnextpushbutton.
function FTibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LoadSflag g_1 s 
ib=str2num(get(handles.FTibedit,'String'));
if~isempty(get(handles.FTibedit,'String'))
    if((g_1.method == 0 && ib<g_1.ibSize)||(g_1.method ~= 0&&ib<g_1.size))
        ib=ib+1;
        set(handles.FTibedit,'String',num2str(ib));
        if(~LoadSflag)
            FTDraw(ib,g_1);%�ж��Ƿ��Ѿ�������Ʒ������
        else
            FTDraw(ib,g_1,s);
        end
    end
    
    if (g_1.method == 0 &&ib==g_1.ibSize)||(g_1.method ~= 0&&ib==g_1.size)
        set(handles.FTibnextpushbutton,'Enable','inactive');
    end
    
    if ib>1
        set(handles.FTiblastpushbutton,'Enable','on');
    end
end



% --------------------------------------------------------------------
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Load_Loadsample_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Loadsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  s g_1 fileInfo  KSsSave LoadSflag
if(g_1.method == 0)
    s.caSize = g_1.caSize;
    s.ibSize = g_1.ibSize;
    s.oaSize = g_1.oaSize;
else
    s.size = g_1.size;
end
s.method = g_1.method;
if(load_needed_data(fileInfo.PrPath,s)&&calculate(s))
    %��ʾ���жԱȵ�ͼ���ѡ���Ƿ���ʾ�Աȵĸ�ѡ��
    LoadSflag = 1;
    KSn = str2num(get(handles.KSnedit,'String'));
    PCib = str2num(get(handles.PCibedit,'String'));
    PCoa = str2num(get(handles.PCoaedit,'String'));
    FTib = str2num(get(handles.FTibedit,'String'));
    KSDraw(KSn,g_1,s);
    PCDraw(PCib,PCoa,g_1,s);
    FTDraw(FTib,g_1,s);
    set(handles.Comparecheckbox,'Visible','on');
    set(handles.Comparecheckbox,'Value',1);
    KSsSave = s.KS;
else
    clear s;
end





% --------------------------------------------------------------------
function Start_LoadPR_Callback(hObject, eventdata, handles)
% hObject    handle to Start_LoadPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(GetPath);
set(handles.Directpushbutton,'Enable','on');
set(handles.Indirectpushbutton_1,'Enable','on');
set(handles.Indirectpushbutton_2,'Enable','on');
set(handles.Indirectpushbutton_3,'Enable','on');
set(handles.Indirectpushbutton_4,'Enable','on');
set(handles.Indirectpushbutton_5,'Enable','on');

% --------------------------------------------------------------------
function File_EditDSPath_Callback(hObject, eventdata, handles)
% hObject    handle to File_EditDSPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function About_Maker_Callback(hObject, eventdata, handles)
% hObject    handle to About_Maker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
message= '���ϴ�ѧ��ѧ�����´�ҵ��Ŀ����з���������ϢѧԺ��ָ����ʦ��������';
h=msgbox(message,'���������','listdlg');
% uniwait(h);
% --------------------------------------------------------------------
function About_Help_Callback(hObject, eventdata, handles)
% hObject    handle to About_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function displayWhole(g)
%UNTITLED3 Summary of this function goes here
%Detailed explanation goes here
%ǰ����������Ʒ�����g�����ݶ��Ѿ�����

handles=guidata(gcf);
set(handles.KSnedit,'String','1');
set(handles.PCoaedit,'String','1');
set(handles.PCibedit,'String','1');
set(handles.FTibedit,'String','1');
KSDraw(1,g);
PCDraw(1,1,g);
FTDraw(1,g);
set(handles.KSlastpushbutton,'Enable','inactive');
set(handles.KSnextpushbutton,'Enable','on');
set(handles.PCiblastpushbutton,'Enable','inactive');
set(handles.PCibnextpushbutton,'Enable','on');
set(handles.PCoalastpushbutton,'Enable','inactive');
set(handles.PCoanextpushbutton,'Enable','on');
set(handles.FTiblastpushbutton,'Enable','inactive');
set(handles.FTibnextpushbutton,'Enable','on');

if (g.method == 0 &&1==g.caSize)||(g.method ~= 0&& 1 ==g.size)
    set(handles.KSnextpushbutton,'Enable','inactive');
end
if (g.method == 0 &&1==g.ibSize)||(g.method ~= 0&& 1 ==g.size)
    set(handles.PCibnextpushbutton,'Enable','inactive');
end

if (g.method == 0 &&1==g.oaSize)||(g.method ~= 0&& 1==g.size)
    set(handles.PCoanextpushbutton,'Enable','inactive');
end
if (g.method == 0 &&1==g.ibSize)||(g.method ~= 0&& 1 ==g.size)
    set(handles.FTibnextpushbutton,'Enable','inactive');
end




function KSDraw( n,g,s )
%global f
handles=guidata(gcf);
cla(handles.KSaxes);    %���ͼ��
%cla reset;

%title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);
switch nargin
    case 2
        semilogy(handles.KSaxes,g.f(:),abs(g.KS( n ,:)),'b');    %semilogy ������Ϊ���������ᣬ������Ϊ����������
    case 3
        semilogy(handles.KSaxes,g.f(:),abs(g.KS( n ,:)),'b');
        hold on ;
        semilogy(handles.KSaxes,s.f(:),abs(s.KS( n ,:)),'r'); %semilogy ������Ϊ���������ᣬ������Ϊ����������
end
xlabel(handles.KSaxes,'Ƶ�� [Hz]');
ylabel(handles.KSaxes,'K_s [N/m]');

function PCDraw(ib,oa,g,s)
%ǰ������ ib��oa��ֵ��ȷ
%PC����жԱȵĹ���
handles=guidata(gcf);
cla(handles.PCaxes);
i = oa;
j = ib;

if g.method == 0
    temp1 =zeros(g.caSize,1);%������ȡ��ȡg.PC(i,j)
%     temp2 =zeros(g.caSize,2);%������ȡ��ȡg.PC(oa,ib)��s.PC(oa,ib)
    for k = 1:g.caSize;
        temp1(k)=g.PC(i,j,k);%��ȡg.PC(i,j)
    end
    %x=(1:g.caSize);
else
    temp1 =zeros(g.size,1);
%     temp2 =zeros(g.size,2);
    for k = 1:g.size;
        temp1(k)=g.PC(i,j,k);%��ȡg.PC(i,j)
    end
end



switch nargin
    case 3
        bar(handles.PCaxes,abs(temp1),'b');
        % bar(handles.PCaxes,abs(temp1),.4,'b');
    case 4     
    if g.method == 0
        temps =zeros(s.caSize,1);
        for k = 1:g.caSize;
            temps(k)=s.PC(i,j,k);%��ȡs.PC(i,j)
        end
    else
        temps =zeros(g.size,1);
        for k = 1:s.size;
            temps(k)=s.PC(i,j,k);%��ȡs.PC(i,j)
        end
    end
    temp2=[temp1 temps];
        bar(handles.PCaxes,abs(temp2),1.3);
        %  bar(handles.PCaxes,x-.2,abs(temp),.4,'b');
        %  hold on;
        %  bar(handles.PCaxes,x+.2,abs(temps),.4,'r');
end
xlabel(handles.PCaxes,'������');
ylabel(handles.PCaxes,'');

function FTDraw(ib,g,s)
%ǰ������ ib��ֵ��ȷ,g,s�������Ѿ�ȫ�����ؼ�����
%FT����жԱȵ�  
handles=guidata(gcf);
cla(handles.FTaxes);
% temp1 = g.FT(:,ib);
% temp2 = g.FT(:,ib);
% if LoadSflag
%     temp2 = [g.FT(:,ib) s.FT(:,ib)];
% end

switch nargin
    case 2
        temp1 = g.FT(:,ib);
        bar(handles.FTaxes,abs(temp1),'b');
        %            bar(handles.FTaxes,abs(g.FT(:,ib)),'b');
        %           title(strcat('FT:  ',num2str(Myib)));
    case 3
         temp2 = [g.FT(:,ib) s.FT(:,ib)];
        bar(handles.FTaxes,abs(temp2),1.3);

end
xlabel(handles.FTaxes,'������');
ylabel(handles.FTaxes,'');


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ggg_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gridset.
function gridset_Callback(hObject, eventdata, handles)
% hObject    handle to gridset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.gridset,'Value') == 1)
    grid(handles.KSaxes, 'on');
    grid(handles.PCaxes, 'on');
    grid(handles.FTaxes, 'on');
else
    grid(handles.KSaxes, 'off');
    grid(handles.PCaxes, 'off');
    grid(handles.FTaxes, 'off');
end
% Hint: get(hObject,'Value') returns toggle state of gridset


% --- Executes on button press in Comparecheckbox.
function Comparecheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to Comparecheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1 s
KSn = str2num(get(handles.KSnedit,'String'));
PCib = str2num(get(handles.PCibedit,'String'));
PCoa = str2num(get(handles.PCoaedit,'String'));
FTib = str2num(get(handles.FTibedit,'String'));
if(isequal(get(handles.Comparecheckbox,'Value'),1))
    KSDraw(KSn,g_1,s);
    PCDraw(PCib,PCoa,g_1,s);
    FTDraw(FTib,g_1,s);
else
    KSDraw(KSn,g_1);
    PCDraw(PCib,PCoa,g_1);
    FTDraw(FTib,g_1);
end


% Hint: get(hObject,'Value') returns toggle state of Comparecheckbox


% --- Executes during object creation, after setting all properties.
function KSaxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to KSaxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate KSaxes


% --------------------------------------------------------------------
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Start_GenerateWord_Callback(hObject, eventdata, handles)
% hObject    handle to Start_GenerateWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GenerateWordUI

% --------------------------------------------------------------------
function Start_GenerateExcel_Callback(hObject, eventdata, handles)
% hObject    handle to Start_GenerateExcel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GenerateExcelUI;

% --------------------------------------------------------------------
function Start_GenerateMat_Callback(hObject, eventdata, handles)
% hObject    handle to Start_GenerateMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Start_Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Start_Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['�˳�����?'],...
    ['�˳� ' ],...
    '��','��','��');
if strcmp(selection,'��')
    return;
end
delete(handles.CoverPagefigure)
clear all
