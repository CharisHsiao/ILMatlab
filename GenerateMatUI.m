function varargout = GenerateMatUI(varargin)
% GENERATEMAT M-file for GenerateMat.fig
%      GENERATEMAT, by itself, creates a new GENERATEMAT or raises the existing
%      singleton*.
%
%      H = GENERATEMAT returns the handle to a new GENERATEMAT or the handle to
%      the existing singleton*.
%
%      GENERATEMAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERATEMAT.M with the given input arguments.
%
%      GENERATEMAT('Property','Value',...) creates a new GENERATEMAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GenerateMat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GenerateMat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GenerateMat

% Last Modified by GUIDE v2.5 11-Apr-2016 20:14:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GenerateMat_OpeningFcn, ...
                   'gui_OutputFcn',  @GenerateMat_OutputFcn, ...
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


% --- Executes just before GenerateMat is made visible.
function GenerateMat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GenerateMat (see VARARGIN)

% Choose default command line output for GenerateMat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GenerateMat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GenerateMat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
