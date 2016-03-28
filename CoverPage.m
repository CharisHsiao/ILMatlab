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

% Last Modified by GUIDE v2.5 28-Mar-2016 10:32:49

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
%set(Loadsample,'Enble','off');

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
clear g_1 mathod 
global g_1,mathod 
method  = 0;
if(~getSize(g_1,method))
    %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,method,g_1))
        %��ʾ����ͼ��������ؿؼ� 
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_1.
function Indirectpushbutton_1_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 mathod 
global g_1,mathod 
method  = 1;
if(~getSize(g_1,method))
     %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %��ʾ����ͼ��������ؿؼ�     
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_2.
function Indirectpushbutton_2_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 mathod 
global g_1,mathod 
method  = 2;
if(~getSize(g_1,method))
     %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %��ʾ����ͼ��������ؿؼ�    
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end

% --- Executes on button press in Indirectpushbutton_3.
function Indirectpushbutton_3_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Indirectpushbutton_3
clear g_1 mathod 
global g_1,mathod 
method  = 3;
if(~getSize(g_1,method))
     %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %��ʾ����ͼ��������ؿؼ�  
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end

% --- Executes on button press in Indirectpushbutton_4.
function Indirectpushbutton_4_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear g_1 mathod 
global g_1,mathod 
method  = 4;
if(~getSize(g_1,method))
     %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %��ʾ����ͼ��������ؿؼ�    
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end



% --- Executes on button press in Indirectpushbutton_5.
function Indirectpushbutton_5_Callback(hObject, eventdata, handles)
% hObject    handle to Indirectpushbutton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Indirectpushbutton_4.
clear g_1 mathod 
global g_1,mathod 
method  = 5;
if(~getSize(g_1,method))
     %������ʾ��Ϣ
        return;
elseif isequal(PRpath,0)
     %������ʾ��Ϣ,·��������
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %��ʾ����ͼ��������ؿؼ�  
        displayWhole(g_1);
else
        %������ʾ��Ϣ
        clear g_1 method
    return;
end

function KSnedit_Callback(hObject, eventdata, handles)
% hObject    handle to KSnedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KSnedit as text
%        str2double(get(hObject,'String')) returns contents of KSnedit as a double


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
    if(~Loadsflag)  %�ж��Ƿ��Ѿ�������Ʒ������
        KSDraw(g_1,n);
    else
        KSDraw(g_1,s,n);
    end    
end
if n==1
    set(handles.KSlastpushbutton,'Enable','inactive');
end

if((mathod == 0 &&n<g.caSize)||(mathod ~= 0&&n<g.size))
     set(handles.KSnextpushbutton,'Enable',on);
end
% --- Executes on button press in KSnextpushbutton.
function KSnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s mathod 
n=str2num(get(handles.KSnedit,'String'));
if((mathod == 0 &&n<g.caSize)||(mathod ~= 0&&n<g.size))%�жϵ�ǰѡ��ķ�����KSn�����ֵ
    n=n+1;
    set(handles.KSnedit,'String',num2str(n));
    if(~Loadsflag)
        KSDraw(g_1,n);%�ж��Ƿ��Ѿ�������Ʒ������
    else
        KSDraw(g_1,s,n);
    end    
end

if (mathod == 0 &&n==g.caSize)||(mathod ~= 0&&n==g.size)
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


% --- Executes on button press in KSrecoverpushbutton.
function KSrecoverpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSrecoverpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function PCibedit_Callback(hObject, eventdata, handles)
% hObject    handle to PCibedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCibedit as text
%        str2double(get(hObject,'String')) returns contents of PCibedit as a double


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
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if(ib>=2)
    ib=ib-1;
    set(handles.PCibedit,'String',num2str(ib));
    if(~Loadsflag)  %�ж��Ƿ��Ѿ�������Ʒ������
        PCDraw(g_1,ib,oa);
    else
        PCDraw(g_1,s,ob,oa);
    end    
end

if ib== 1
    set(handles.PCiblastpushbutton,'Enable',inactive);
end
if (mathod == 0 &&ib<g.ibSize)||(mathod ~= 0&&ib<g.size)
    set(handles.PCibnextpushbutton,'Enable',inactive);
end




% --- Executes on button press in PCibnextpushbutton.
function PCibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if((mathod == 0 && ib<g.ibSize)||(mathod ~= 0&&ib<g.size))%�жϵ�ǰѡ��ķ�����KSn�����ֵ
    ib=ib+1;
    set(handles.PCibedit,'String',num2str(ib));
    if(~Loadsflag)
        PCDraw(g_1,ib,oa);%�ж��Ƿ��Ѿ�������Ʒ������
    else
        PCDraw(g_1,s,ib,oa);
    end    
end

if (mathod == 0 &&ib==g.ibSize)||(mathod ~= 0&&ib==g.size)
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
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if(oa>=2)
    oa=oa-1;
    set(handles.PCoaedit,'String',num2str(oa));
    if(~Loadsflag)  %�ж��Ƿ��Ѿ�������Ʒ������
        PCDraw(g_1,ib,oa);
    else
        PCDraw(g_1,s,ob,oa);
    end    
end

if oa== 1
    set(handles.PCoalastpushbutton,'Enable',inactive);
end
if (mathod == 0 &&oa<g.oaSize)||(mathod ~= 0&&oa<g.size)
    set(handles.PCoanextpushbutton,'Enable',inactive);
end

% --- Executes on button press in PCoanextpushbutton17.
function PCoanextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoanextpushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.PCibedit,'String'));
oa=str2num(get(handles.PCoaedit,'String'));
if((mathod == 0 && oa<g.oaSize)||(mathod ~= 0&&oa<g.size))%�жϵ�ǰѡ��ķ��������ֵ
    oa=oa+1;
    set(handles.PCoaedit,'String',num2str(oa));
    if(~Loadsflag)
        PCDraw(g_1,ib,oa);%�ж��Ƿ��Ѿ�������Ʒ������
    else
        PCDraw(g_1,s,ib,oa);
    end    
end

if (mathod == 0 &&oa==g.oaSize)||(mathod ~= 0&&oa==g.size)
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
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.FTibedit,'String'));
if(ib>=2)
    ib=ib-1;
    set(handles.FTibedit,'String',num2str(ib));
    if(~Loadsflag)  %�ж��Ƿ��Ѿ�������Ʒ������
        FTDraw(g_1,ib);
    else
        FDraw(g_1,s,ib);
    end    
end

if ib == 1
    set(handles.FTiblastpushbutton,'Enable',inactive);
end
if (mathod == 0 &&ib<g.ibSize)||(mathod ~= 0&&ib<g.size)
    set(handles.FTibnextpushbutton,'Enable',inactive);
end

% --- Executes on button press in FTibnextpushbutton.
function FTibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Loadsflag g_1 s mathod 
ib=str2num(get(handles.FTibedit,'String'));
if((mathod == 0 && ib<g.ibSize)||(mathod ~= 0&&ib<g.size))
    ib=ib+1;
    set(handles.FTibedit,'String',num2str(ib));
    if(~Loadsflag)
        FTDraw(g_1,ib,oa);%�ж��Ƿ��Ѿ�������Ʒ������
    else
        FTDraw(g_1,s,ib,oa);
    end    
end

if (mathod == 0 &&ib==g.ibSize)||(mathod ~= 0&&ib==g.size)
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
%   Detailed explanation goes here
%ǰ����������Ʒ�����g�����ݶ��Ѿ�����
global mathod 
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

if (mathod == 0 &&n==g.caSize)||(mathod ~= 0&&n==g.size)
    set(handles.KSnextpushbutton,'Enable',inactive);
end  
if (mathod == 0 &&n==g.ibSize)||(mathod ~= 0&&n==g.size)
    set(handles.PCibnextpushbutton,'Enable',inactive);
end 
if (mathod == 0 &&n==g.oaSize)||(mathod ~= 0&&n==g.size)
    set(handles.PCoanextpushbutton,'Enable',inactive);
end 
if (mathod == 0 &&n==g.ibSize)||(mathod ~= 0&&n==g.size)
    set(handles.FTibnextpushbutton,'Enable',inactive);
end 




function KSDraw(g,s,n)
handles=guidata(gcf);
cla(handles.KSaxes);    %���ͼ��
%cla reset;
xlabel(handles.KSaxes,'Ƶ�� [Hz]');
ylabel(handles.KSaxes,'K_s [N/m]');
%title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);
switch nargin
    case 2        
        semilogy(handles.axes1,g.f(:),abs(g.KS(n,:)),'--r');    %semilogy ������Ϊ���������ᣬ������Ϊ����������     
    case 3 
        semilogy(handles.axes1,g.f(:),abs(g.KS(n,:)),'--r'); 
        hold on ;
        semilogy(handles.axes1,s.f(:),abs(s.KS(n,:)),'--b'); %semilogy ������Ϊ���������ᣬ������Ϊ����������
end


 function PCDraw(g,s,ib,oa)
%ǰ������ ib��oa��ֵ��ȷ
%PC����жԱȵĹ���
handles=guidata(gcf);
cla(handles.PCaxes);
i = oa;
j = ib;
 xlabel(handles.PCaxes,'������');
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
%ǰ������ ib��ֵ��ȷ,g,s�������Ѿ�ȫ�����ؼ�����
%FT����жԱȵ�
handles=guidata(gcf);
    cla(handles.FTaxes);
    xlabel(handles.FTaxes,'������');
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
    
            


% --- Executes on button press in PCoalastpushbutton.
function PCoalastpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoalastpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PCoanextpushbutton.
function PCoanextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCoanextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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

% Hint: get(hObject,'Value') returns toggle state of gridset