function varargout = GetPath(varargin)



% GetPath MATLAB code for GetPath.fig
%      GetPath, by itself, creates a new GetPath or raises the existing
%      singleton*.
%
%      H = GetPath returns the handle to a new GetPath or the handle to
%      the existing singleton*.
%
%      GetPath('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GetPath.M with the given input arguments.
%
%      GetPath('Property','Value',...) creates a new GetPath or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GetPath_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GetPath_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GetPath

% Last Modified by GUIDE v2.5 17-Apr-2016 11:46:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GetPath_OpeningFcn, ...
                   'gui_OutputFcn',  @GetPath_OutputFcn, ...
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


% --- Executes just before GetPath is made visible.
function GetPath_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GetPath (see VARARGIN)
clear global data_path
global data_path   %暂时存放AssemblyLine的路径，
                   %默认Product的初始路径也为data_path
data_path = cd;
set(hObject,'Name',data_path);
ALpopupmenu_CreateFcn(handles.ALpopupmenu, eventdata, handles);
PRpopupmenu_CreateFcn(handles.PRpopupmenu, eventdata, handles);     
 
% global fileInfo   %想要得到的数据结构体
                   %包含有Assemblyline，Product的名字和路径，初始值为空格
% fileInfo=struct('ALname',' ',...
%                   'ALpath',' ',...
%                   'PRname',' ',...
%                   'PRpath',' ');
 




% Choose default command line output for GetPath
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GetPath wait for user response (see UIRESUME)
% uiwait(handles.GetPathfigure);


% --- Outputs from this function are returned to the command line.
function varargout = GetPath_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in ALpopupmenu.
function ALpopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to ALpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Temp_ALpath data_path
% name_list=get(handles.ALpopupmenu,'String');
% val=get(handles.ALpopupmenu,'Value');
% name=name_list{val};
% Temp_ALpath=[data_path '\' name];%cd返回当前路径地址
handles=guihandles;
guidata(hObject,handles);
PRpopupmenu_CreateFcn(handles.PRpopupmenu, eventdata, handles);
% ALpopupmenu_CreateFcn(handles.ALpopupmenu, eventdata, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns ALpopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ALpopupmenu


% --- Executes during object creation, after setting all properties.
function ALpopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ALpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global data_path
clear fileFolder FileList

FileList=dir(data_path);
ALfileFolderNameIndex=0;
fileFolder =[];
for rr=1:length(FileList)   % .isdir函数:判断是否为文件夹
    if(FileList(rr).isdir==1&&~strcmp(FileList(rr).name,'.')&&~strcmp(FileList(rr).name,'..'))%why?--Charis
        ALfileFolderNameIndex=ALfileFolderNameIndex+1;
        fileFolder{ALfileFolderNameIndex}=FileList(rr).name;%存储数据库中文件夹      
    end
end
set(hObject,'Value',1);  %这句话不可去掉
if(~isempty(fileFolder))  %如果目录下有文件夹
    set(hObject,'String',fileFolder);
else
    set(hObject,'String',{' '});
end
% PRpopupmenu_CreateFcn(handles.PRpopupmenu, eventdata, handles);

% set(hObject,'string',fileFolder);
%  set(hObject,'Value',1);  
%
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PRpopupmenu.
function PRpopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to PRpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Temp_ALpath Temp_PRpath
% name_list=get(handles.PRpopupmenu,'String'); 
% val=get(handles.PRpopupmenu,'Value');
% name=name_list{val};
% Temp_PRpath=[Temp_ALpath '\' name];

% Hints: contents = cellstr(get(hObject,'String')) returns PRpopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PRpopupmenu


% --- Executes during object creation, after setting all properties.
function PRpopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% global Temp_ALpath
 global  data_path  
 clear name_list fileFolder
 
 handles=guihandles;
guidata(hObject,handles);
name_list=get(handles.ALpopupmenu,'String');
val=get(handles.ALpopupmenu,'Value');
name=name_list{val};
Temp_ALpath=[data_path '\' name];%cd返回当前路径地址
% Temp_ALpath = cell2str(temp_ALpath);
FileList=dir(Temp_ALpath);
fileFolder =[];
PRfileFolderNameIndex=0;  %ALfileFolderNameIndex表示文件夹的数目
for rr=1:length(FileList)   % .isdir函数:判断是否为文件夹
    if(FileList(rr).isdir==1&&~strcmp(FileList(rr).name,'.')&&~strcmp(FileList(rr).name,'..'))
       PRfileFolderNameIndex=PRfileFolderNameIndex+1;
        fileFolder{PRfileFolderNameIndex}=[FileList(rr).name];%存储字库文件夹名
        
    end
end

set(hObject,'value',1);  %这句语句不可去掉
if(~isempty(fileFolder))  %如果目录下有文件夹
    set(hObject,'String',fileFolder);
else
    set(hObject,'String',{' '});
end


% name_list=get(handles.PRpopupmenu,'String'); 
% val=get(handles.PRpopupmenu,'Value');
% name=name_list{val};
% Temp_PRpath=[Temp_ALpath '\' name];

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SelectDBpushbutton.
function SelectDBpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to SelectDBpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_path
path = uigetdir('','更改数据库路径');
if(path)
    data_path= path;
    ALpopupmenu_CreateFcn(handles.ALpopupmenu, eventdata, handles);
    set(handles.GetPathfigure,'Name',data_path);
end




% --- Executes on button press in OKBtn.
function OKBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OKBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global  data_path fileInfo

name_list=get(handles.ALpopupmenu,'String');
val=get(handles.ALpopupmenu,'Value');
fileInfo.AlName=name_list{val};
fileInfo.AlPath=[data_path '\' fileInfo.AlName]; %输出时带不带引号都一样

name_list=get(handles.PRpopupmenu,'String'); 
val=get(handles.PRpopupmenu,'Value');
fileInfo.PrName=name_list{val};
fileInfo.PrPath=[fileInfo.AlPath '\' fileInfo.PrName];
clear dath_path  PRpopupmenu ALpopupmenu

varargout = fileInfo; 

close 




% --- Executes on button press in CancelBtn.
function CancelBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CancelBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global fileInfo

clear dath_path  PRpopupmenu ALpopupmenu
close 
