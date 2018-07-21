function varargout = main_meun(varargin)
% MAIN_MEUN MATLAB code for main_meun.fig
%      MAIN_MEUN, by itself, creates a new MAIN_MEUN or raises the existing
%      singleton*.
%
%      H = MAIN_MEUN returns the handle to a new MAIN_MEUN or the handle to
%      the existing singleton*.
%
%      MAIN_MEUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_MEUN.M with the given input arguments.
%
%      MAIN_MEUN('Property','Value',...) creates a new MAIN_MEUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_meun_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_meun_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_meun

% Last Modified by GUIDE v2.5 30-Jun-2014 14:15:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_meun_OpeningFcn, ...
                   'gui_OutputFcn',  @main_meun_OutputFcn, ...
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


% --- Executes just before main_meun is made visible.
function main_meun_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_meun (see VARARGIN)

% Choose default command line output for main_meun
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
hand=axes('units','normalized','position',[0.15 0.15 0.7 0.6]);
uistack(hand,'down')
II=imread('csu.jpg');
image(II)
colormap gray
set(hand,'handlevisibility','off','visible','off');
% UIWAIT makes main_meun wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_meun_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('gray_transition');
close('main_meun');
