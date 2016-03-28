function varargout = CoverPage(varargin)
% COVERPAGE M-file for CoverPage.fig
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

% Last Modified by GUIDE v2.5 28-Mar-2016 18:09:45

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
set(handles.KSlastpushbutton,'Enable',inactive);
set(handles.KSnextpushbutton,'Enable',inactive);
set(handles.PCiblastpushbutton,'Enable',inactive);
set(handles.PCibnextpushbutton,'Enable',inactive);
set(handles.PCoalastpushbutton,'Enable',inactive);
set(handles.PCoanextpushbutton,'Enable',inactive);
set(handles.FTiblastpushbutton,'Enable',inactive);
set(handles.FTibnextpushbutton,'Enable',inactive);
set(handles.Loadsample,'Enble','off');
set(handles.Comparecheckbox,'Value',0);
set(handles.Comparecheckbox,'Visible',0);
set(handles.gridset,'Value',0);
global LoadSflag ;
LoadSflag = 0;


% UIWAIT makes CoverPage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


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
clear g_1 method 
global g_1,method 
method  = 0;
if(~getSize(g_1,method))
    %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,method,g_1))
        %显示三个图表还有相关控件 
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_1.
function Indirectpushbutton_1_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 method 
global g_1,method 
method  = 1;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_2.
function Indirectpushbutton_2_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 method 
global g_1,method 
method  = 2;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件    
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end

% --- Executes on button press in Indirectpushbutton_3.
function Indirectpushbutton_3_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Indirectpushbutton_3
clear g_1 method 
global g_1,method 
method  = 3;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件  
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end

% --- Executes on button press in Indirectpushbutton_4.
function Indirectpushbutton_4_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 method 
global g_1,method 
method  = 4;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件    
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_5.
function Indirectpushbutton_5_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Indirectpushbutton_4.
clear g_1 method 
global g_1,method 
method  = 5;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,method,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件  
        displayWhole(g_1);
else
        %给出提示信息
        clear g_1 method
    return;
end

function KSnedit_Callback(hObject, eventdata, handles)
% hObject    handle to KSnedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KSnedit as text
%        str2double(get(hObject,'String')) returns contents of KSnedit as a double
global method Loadsflag g_1 s 
str = get(handles.KSnedit,'String');
len = length(str);
s = [];
flag = 1;
%盘算输入的字符串的合法性 （只能输入正整数）
for i = 1:len
    if str(i)>'9'||str(i)<'0'
           flag = 0;
           break;
     end      
end

if(~flag)
    %显示提示信息：输入不合法
    errordlg({'输入不合法！';'只能输入非零正整数，不能包含空格以及其他字符'});
else
    n = str2num(str);
    if(method == 0&&n<=g_1.caSzie )||(method ~=0 && n <= g_1.Size)||n~=0
        if(~Loadsflag)
        KSDraw(g_1,n);
        else
            KSDraw(g_1,s,n);
        end
    else
          %显示提示信息：输入的值超出范围
          errordlg({'输入的值超出范围';});
    end 
    
    if(n ==1 )
        set(handles.KSlastpushbutton,'Enable',inactive);
    else
        set(handles.KSlastpushbutton,'Enable',on);
    end
    if(method == 0&& n==g_1.caSzie )||(method ~=0 && n == g_1.Size)
        set(handles.KSnextpushbutton,'Enable',inactive);
    else
        set(handles.KSnextpushbutton,'Enable',on);
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
global Loadsflag g_1 s
n=str2num(get(handles.KSnedit,'String'));
if(n>=2)
    n=n-1;
    set(handles.KSnedit,'String',num2str(n));
    if(~Loadsflag)  %判断是否已经加载样品的数据
        KSDraw(g_1,n);
    else
        KSDraw(g_1,s,n);
    end    
end
if n==1
    set(handles.KSlastpushbutton,'Enable','inactive');
end

if((method == 0 &&n<g_1.caSize)||(method ~= 0&&n<g_1.size))
     set(handles.KSnextpushbutton,'Enable',on);
end
% --- Executes on button press in KSnextpushbutton.
function KSnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s method 
n=str2num(get(handles.KSnedit,'String'));
if((method == 0 &&n<g_1.caSize)||(method ~= 0&&n<g_1.size))%判断当前选择的方法和KSn的最大值
    n=n+1;
    set(handles.KSnedit,'String',num2str(n));
    if(~Loadsflag)
        KSDraw(g_1,n);%判断是否已经加载样品的数据
    else
        KSDraw(g_1,s,n);
    end    
end

if (method == 0 &&n==g_1.caSize)||(method ~= 0&&n==g_1.size)
    set(handles.KSnextpushbutton,'Enable',inactive);
end

if n>1
    set(handles.KSlastpushbutton,'Enable',on);
end



% --- Executes on button press in Smoothpushbutton.
function Smoothpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Smoothpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1 s LoadSflag 
global KSgSave KSsSave
KSgSave = g.KS;
KSsSave = s.KS;

n = str2num(get(handles.KSnedit,'String'));
KStemp = g_1.KS;

if(mathod == 0)
    t = round(g_1.caSize/4);
    Sizetemp = g_1.caSize;
else
        t = round(g_1.Size/4);
        Sizetemp = g_1.Size;
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
     if(LoadSflag)%如果样品数据也加载了，样品数据的线同步平滑
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
         KSDraw(g_1,n);
     else
         KSDraw(g_1,s,n);
     end
     
     



% --- Executes on button press in KSrecoverpushbutton.
function KSrecoverpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSrecoverpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global KSsSave KSgSave g_1 s
g_1.KS = KSsSave;
s.KS = KSsSave;
n = str2num(handles.KSnedit,'String');
if(~LoadsFlag)
    KSDraw(g_1,n);
else
    KSDraw(g_1,s,n);
end



function PCibedit_Callback(hObject, eventdata, handles)
% hObject    handle to PCibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCibedit as text
%        str2double(get(hObject,'String')) returns contents of PCibedit as a double
global method Loadsflag g_1 s 
str = get(handles.PCibedit,'String');
len = length(str);
s = [];
flag = 1;
%盘算输入的字符串的合法性 （只能输入正整数）
for i = 1:len
    if str(i)>'9'||str(i)<'0'
           flag = 0;
           break;
     end      
end

if(~flag)
    %显示提示信息：输入不合法
    errordlg({'输入不合法！';'只能输入非零正整数,不能包含空格以及其他字符'});
else
    ib = str2num(str);
    oa = str2num(get(handles.PCoaedit,'String'));
    if(method == 0&&ib<=g_1.ibSzie )||(method ~=0 && ib <= g_1.Size)|| ib~=0
        if(~Loadsflag)
        PCDraw(g_1,ib,oa);
        else
            PCDraw(g_1,s,ib,oa);
        end
    else
          %显示提示信息：输入的值超出范围
          errordlg({'输入的值超出范围';});
    end 
    
    if(ib ==1 )
        set(handles.PCiblastpushbutton,'Enable',inactive);
    else
        set(handles.PCiblastpushbutton,'Enable',on);
    end
    if(method == 0&& ib ==g_1.ibSzie )||(method ~=0 && ib == g_1.Size)
        set(handles.PCibnextpushbutton,'Enable',inactive);
    else
        set(handles.PCibnextpushbutton,'Enable',on);
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
global Loadsflag g_1 s method 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if(ib>=2)
    ib=ib-1;
    set(handles.PCibedit,'String',num2str(ib));
    if(~Loadsflag)  %判断是否已经加载样品的数据
        PCDraw(g_1,ib,oa);
    else
        PCDraw(g_1,s,ob,oa);
    end    
end

if ib== 1
    set(handles.PCiblastpushbutton,'Enable',inactive);
end
if (method == 0 &&ib<g_1.ibSize)||(method ~= 0&&ib<g_1.size)
    set(handles.PCibnextpushbutton,'Enable',inactive);
end




% --- Executes on button press in PCibnextpushbutton.
function PCibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s method 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if((method == 0 && ib<g_1.ibSize)||(method ~= 0&&ib<g_1.size))%判断当前选择的方法和KSn的最大值
    ib=ib+1;
    set(handles.PCibedit,'String',num2str(ib));
    if(~Loadsflag)
        PCDraw(g_1,ib,oa);%判断是否已经加载样品的数据
    else
        PCDraw(g_1,s,ib,oa);
    end    
end

if (method == 0 &&ib==g_1.ibSize)||(method ~= 0&&ib==g_1.size)
    set(handles.PCibnextpushbutton,'Enable',inactive);
end

if ib>1
    set(handles.PCiblastpushbutton,'Enable',on);
end


function PCoaedit_Callback(hObject, eventdata, handles)
% hObject    handle to PCoaedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCoaedit as text
%        str2double(get(hObject,'String')) returns contents of PCoaedit as a double
global method Loadsflag g_1 s 
str = get(handles.Poabedit,'String');
len = length(str);
s = [];
flag = 1;
%盘算输入的字符串的合法性 （只能输入正整数）
for i = 1:len
    if str(i)>'9'||str(i)<'0'  %如果不是数字
           flag = 0;
           break;
     end      
end

if(~flag)
    %显示提示信息：输入不合法
    errordlg({'输入不合法！';'只能输入非零正整数,不能包含空格以及其他字符'});
else
    oa = str2num(str);
    ib = str2num(get(handles.PCibedit,'String'));
    if(method == 0&&oa<=g_1.ibSzie )||(method ~=0 && oa <= g_1.Size)|| oa~=0
        if(~Loadsflag)
            PCDraw(g_1,ib,oa);
        else
            PCDraw(g_1,s,ib,oa);
        end
    else
          %显示提示信息：输入的值超出范围
          errordlg({'输入的值超出范围';});
    end 
    
    if(oa ==1 )
        set(handles.PCoalastpushbutton,'Enable',inactive);
    else
        set(handles.PCoalastpushbutton,'Enable',on);
    end
    if(method == 0&& oa ==g_1.oaSzie )||(method ~=0 && oa == g_1.Size)
        set(handles.PCoanextpushbutton,'Enable',inactive);
    else
        set(handles.PCoanextpushbutton,'Enable',on);
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
global Loadsflag g_1 s method 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if(oa>=2)
    oa=oa-1;
    set(handles.PCoaedit,'String',num2str(oa));
    if(~Loadsflag)  %判断是否已经加载样品的数据
        PCDraw(g_1,ib,oa);
    else
        PCDraw(g_1,s,ob,oa);
    end    
end

if oa== 1
    set(handles.PCoalastpushbutton,'Enable',inactive);
end
if (method == 0 &&oa<g_1.oaSize)||(method ~= 0&&oa<g_1.size)
    set(handles.PCoanextpushbutton,'Enable',inactive);
end

% --- Executes on button press in PCoanextpushbutton17.
function PCoanextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoanextpushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s method 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if((method == 0 && oa<g_1.oaSize)||(method ~= 0&&oa<g_1.size))%判断当前选择的方法和最大值
    oa=oa+1;
    set(handles.PCoaedit,'String',num2str(oa));
    if(~Loadsflag)
        PCDraw(g_1,ib,oa);%判断是否已经加载样品的数据
    else
        PCDraw(g_1,s,ib,oa);
    end    
end

if (method == 0 &&oa==g_1.oaSize)||(method ~= 0&&oa==g_1.size)
    set(handles.PCoanextpushbutton,'Enable',inactive);
end

if oa>1
    set(handles.PCoalastpushbutton,'Enable',on);
end


function FTibedit_Callback(hObject, eventdata, handles)
% hObject    handle to FTibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FTibedit as text
%        str2double(get(hObject,'String')) returns contents of FTibedit as a double
global method Loadsflag g_1 s 
str = get(handles.FTibedit,'String');
len = length(str);
s = [];
flag = 1;
%盘算输入的字符串的合法性 （只能输入正整数）
for i = 1:len
    if str(i)>'9'||str(i)<'0'
           flag = 0;
           break;
     end      
end

if(~flag)
    %显示提示信息：输入不合法
    errordlg({'输入不合法！';'只能输入非零正整数,不能包含空格以及其他字符'});
else   
    ib = str2num(get(handles.FTibedit,'String'));
    if(method == 0&&ib<=g_1.ibSzie )||(method ~=0 && ib <= g_1.Size)|| ib~=0
        if(~Loadsflag)
        FTDraw(g_1,ib);
        else
            FTDraw(g_1,s,ib);
        end
    else
          %显示提示信息：输入的值超出范围
          errordlg({'输入的值超出范围';});
    end 
    
    if(ib ==1 )
        set(handles.FTiblastpushbutton,'Enable',inactive);
    else
        set(handles.FTiblastpushbutton,'Enable',on);
    end
    if(method == 0&& ib ==g_1.ibSzie )||(method ~=0 && ib == g_1.Size)
        set(handles.FTibnextpushbutton,'Enable',inactive);
    else
        set(handles.FTibnextpushbutton,'Enable',on);
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
global Loadsflag g_1 s method 
ib=str2num(get(handles.FTibedit,'String'));
if(ib>=2)
    ib=ib-1;
    set(handles.FTibedit,'String',num2str(ib));
    if(~Loadsflag)  %判断是否已经加载样品的数据
        FTDraw(g_1,ib);
    else
        FDraw(g_1,s,ib);
    end    
end

if ib == 1
    set(handles.FTiblastpushbutton,'Enable',inactive);
end
if (method == 0 &&ib<g_1.ibSize)||(method ~= 0&&ib<g_1.size)
    set(handles.FTibnextpushbutton,'Enable',inactive);
end

% --- Executes on button press in FTibnextpushbutton.
function FTibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s method 
ib=str2num(get(handles.FTibedit,'String'));
if((method == 0 && ib<g_1.ibSize)||(method ~= 0&&ib<g_1.size))
    ib=ib+1;
    set(handles.FTibedit,'String',num2str(ib));
    if(~Loadsflag)
        FTDraw(g_1,ib,oa);%判断是否已经加载样品的数据
    else
        FTDraw(g_1,s,ib,oa);
    end    
end

if (method == 0 &&ib==g_1.ibSize)||(method ~= 0&&ib==g_1.size)
    set(handles.FTibnextpushbutton,'Enable',inactive);
end

if ib>1
    set(handles.FTiblastpushbutton,'Enable',on);
end




% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Loadsample_Callback(hObject, eventdata, handles)
% hObject    handle to Loadsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global method s g_1 PRpath 
if(method == 0)
    s.caSize = g_1.caSize;
    s.ibSize = g_1.ibSize;
    s.oaSize = g_1.oaSize;
else
    s.Size = g_1.Size;
end
if(load_needed_data(PRpath,method,s)&&calculate(PRpath,method,s))
%显示所有对比的图像和选择是否显示对比的复选框
KSn = str2num(get(handles.KSnedit,'String'));
PCib = str2num(get(handles.PCibedit,'String'));
PCoa = str2num(get(handles.PCoaedit,'String'));
FTib = str2num(get(handles.FTibedit,'String'));
KSDraw(g_1,s,KSn);
PCDraw(g_1,s,PCib,PCoa);
FTDraw(g_1,s,FTib);
set(handles.Comparecheckbox,'Visible',on);
set(handles.Comparecheckbox,'Value',1);
else
    clear s;
end
    




% --------------------------------------------------------------------
function File_loadPR_Callback(hObject, eventdata, handles)
% hObject    handle to File_loadPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --------------------------------------------------------------------
function About_Help_Callback(hObject, eventdata, handles)
% hObject    handle to About_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function displayWhole(g)
%UNTITLED3 Summary of this function goes here
%Detailed explanation goes here
%前置条件：产品类对象g的数据都已经加载
global method 
set(handles.KSnedit,'String','1');
set(handles.PCoaedit,'String','1');
set(handles.PCibedit,'String','1');
set(handles.FTibedit,'String','1');
KSDraw(g,1);
PCDraw(g,1,1);
FTDraw(g,1,1);
set(handles.KSlastpushbutton,'Enable',inactive);
set(handles.KSnextpushbutton,'Enable',on);
set(handles.PCiblastpushbutton,'Enable',inactive);
set(handles.PCibnextpushbutton,'Enable',on);
set(handles.PCoalastpushbutton,'Enable',inactive);
set(handles.PCoanextpushbutton,'Enable',on);
set(handles.FTiblastpushbutton,'Enable',inactive);
set(handles.FTibnextpushbutton,'Enable',on);

if (method == 0 &&n==g_1.caSize)||(method ~= 0&&n==g.size)
    set(handles.KSnextpushbutton,'Enable',inactive);
end  
if (method == 0 &&n==g.ibSize)||(method ~= 0&&n==g.size)
    set(handles.PCibnextpushbutton,'Enable',inactive);
end 

if (method == 0 &&n==g.oaSize)||(method ~= 0&&n==g.size)
    set(handles.PCoanextpushbutton,'Enable',inactive);
end 
if (method == 0 &&n==g.ibSize)||(method ~= 0&&n==g.size)
    set(handles.FTibnextpushbutton,'Enable',inactive);
end 




function KSDraw(g,s,n)
handles=guidata(gcf);
cla(handles.KSaxes);    %清除图像
%cla reset;
xlabel(handles.KSaxes,'频率 [Hz]');
ylabel(handles.KSaxes,'K_s [N/m]');
%title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);
switch nargin
    case 2        
        semilogy(handles.axes1,g.f(:),abs(g.KS(n,:)),'--r');    %semilogy 横坐标为线性坐标轴，纵坐标为对数坐标轴     
    case 3 
        semilogy(handles.axes1,g.f(:),abs(g.KS(n,:)),'--r'); 
        hold on ;
        semilogy(handles.axes1,s.f(:),abs(s.KS(n,:)),'--b'); %semilogy 横坐标为线性坐标轴，纵坐标为对数坐标轴
end


 function PCDraw(g,s,ib,oa)
%前置条件 ib和oa的值正确
%PC面板有对比的功能
handles=guidata(gcf);
cla(handles.PCaxes);
i = oa;
j = ib;
 xlabel(handles.PCaxes,'测量点');
 ylabel(handles.PCaxes,'');
switch nargin
    case 3      
        bar(handles.PCaxes,abs(g.PC(i,j)),'b');
    case 4
        bar(handles.PCaxes,x-.2,g.PC(i,j),.4,'b');
        hold on;
        bar(handles.PCaxes,x+.2,s.PC(i,j),.4,'r');
end
  

function FTDraw(g,s,ib)
%前置条件 ib的值正确,g,s的数据已经全部加载计算完
%FT面板有对比的

handles=guidata(gcf);
    cla(handles.FTaxes);
    xlabel(handles.FTaxes,'测量点');
    ylabel(handles.FTaxes,'');
    switch nargin
        case 2
            bar(handles.FTaxes,abs(g.FT(:,ib)),'b');
  %  title(strcat('FT:  ',num2str(Myib)));
        case 3
            bar(handles.FTaxes,x-.2,abs(g.FT(:,ib)),.4,'b');
            hold on;
            bar(handles.FTaxes,x-.2,abs(s.FT(:,ib)),.4,'r');
    end
    


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
    grid on
else grid off
end
% Hint: get(hObject,'Value') returns toggle state of gridset


% --- Executes on button press in Comparecheckbox.
function Comparecheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to Comparecheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_1,s
    KSn = str2num(get(handles.KSnedit,'String'));
    PCib = str2num(get(handles.PCibedit,'String'));
    PCoa = str2num(get(handles.PCoaedit,'String'));
    FTib = str2num(get(handles.FTibedit,'String'));
if(isequal(get(handles.Comparecheckbox,'Value'),1))
    KSDraw(g_1,s,KSn);
    PCDraw(g_1,s,PCib,PCoa);
    FTDraw(g_1,s,FTib);
else
     KSDraw(g_1,KSn);
     PCDraw(g_1,PCib,PCoa);
     FTDraw(g_1,FTib);
end

    
% Hint: get(hObject,'Value') returns toggle state of Comparecheckbox
