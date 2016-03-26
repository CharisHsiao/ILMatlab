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

% Last Modified by GUIDE v2.5 26-Mar-2016 17:53:05

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
set(KSlastpushbutton,'Enable',off);
set(KSnextpushbutton,'Enable',off);
set(PCiblastpushbutton,'Enable',off);
set(PCibnextpushbutton,'Enable',off);
set(PCoalastpushbutton,'Enable',off);
set(PCoanextpushbutton,'Enable',off);
set(FTiblastpushbutton,'Enable',off);
set(FTibnextpushbutton,'Enable',off);
set(Loadsample,'Enble',off);

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
    %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,method,g_1))
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
clear g_1 mathod 
global g_1,mathod 
method  = 1;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
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
clear g_1 mathod 
global g_1,mathod 
method  = 2;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
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
clear g_1 mathod 
global g_1,mathod 
method  = 3;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
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
clear g_1 mathod 
global g_1,mathod 
method  = 4;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
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
clear g_1 mathod 
global g_1,mathod 
method  = 5;
if(~getSize(g_1,method))
     %给出提示信息
        return;
elseif isequal(PRpath,0)
     %给出提示信息,路径不存在
    return       
elseif(load_needed_data(PRpath,mathod,g_1)&&calculate(PRpath,0,g_1))
        %显示三个图表还有相关控件     
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


% --- Executes on button press in KSnextpushbutton.
function KSnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to KSnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in PCibnextpushbutton.
function PCibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to PCibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
function PCoalastpushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to PCoalastpushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PCoanextpushbutton17.
function PCoanextpushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to PCoanextpushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in FTibnextpushbutton.
function FTibnextpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to FTibnextpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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









function displayWhole( g_1, s  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global method 
set(KSlastpushbutton,'Enable',off);
set(KSnextpushbutton,'Enable',off);
set(PCiblastpushbutton,'Enable',off);
set(PCoalastpushbutton,'Enable',off);
set(FTiblastpushbutton,'Enable',off);
switch nargin
    case 1
        KsDraw(1);
        set(KSnedit,'String','1');
        
    case 2
end



function KsDraw(n)
global f KS
cla;    %清除图像
cla reset;
handles=guidata(gcf);
set(handles.KSn,'String',num2str(n));
semilogy(handles.axes1,f(:),abs(KS(n,:)));    %semilogy 横坐标为线性坐标轴，纵坐标为对数坐标轴
xlabel('频率 [Hz]');ylabel('K_s [N/m]');
title(strcat('KS ',num2str(n)));
set(handles.gridset,'Value',0);


function PCDraw(PCj1,PCj2)
%前置条件 ib和oa的值正确
%PC面板有对比的功能
cla(handle.PCaxes);
switch nargin
    case 3
          y1=abs(PCj1);        
        bar(handle.PCaxes,y1);
        xlabel('测量点');ylabel('');
        %title(strcat('PC: ',num2str(Myib),' TO ',num2str(Myoa)));
    case 4
        y1 =abs(PCj1);
        y2 = abs(PCj2);
        bar(handle.PCaxes,y1,y2);
         xlabel('测量点');ylabel('');
end
   

function FTDraw(FT,ib)
%前置条件 ib的值正确
%FT面板没有对比的
    cla(handle.FTaxes);
    yFT=abs(FT(:,ib));
    bar(yFT);
    xlabel('测量点');ylabel('');
    title(strcat('FT:  ',num2str(Myib)));
