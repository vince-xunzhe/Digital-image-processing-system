function varargout = morph_process(varargin)
% MORPH_PROCESS MATLAB code for morph_process.fig
%      MORPH_PROCESS, by itself, creates a new MORPH_PROCESS or raises the existing
%      singleton*.
%
%      H = MORPH_PROCESS returns the handle to a new MORPH_PROCESS or the handle to
%      the existing singleton*.
%
%      MORPH_PROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPH_PROCESS.M with the given input arguments.
%
%      MORPH_PROCESS('Property','Value',...) creates a new MORPH_PROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before morph_process_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to morph_process_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help morph_process

% Last Modified by GUIDE v2.5 05-Jul-2014 14:18:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @morph_process_OpeningFcn, ...
                   'gui_OutputFcn',  @morph_process_OutputFcn, ...
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


% --- Executes just before morph_process is made visible.
function morph_process_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to morph_process (see VARARGIN)

% Choose default command line output for morph_process
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes morph_process wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = morph_process_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
g=rgb2gray(img_1);
gray=im2double(g);
axes(handles.axes1);
imshow(gray);
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton1'
        st=strel('square',3);
        f=imopen(gray,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton2'   
        st=strel('square',5);
        f=imopen(gray,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton3'
        st=strel('square',10);
        f=imopen(gray,st);
        axes(handles.axes2);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
g=rgb2gray(img_1);
gray=im2double(g);
axes(handles.axes1);
imshow(gray);
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton5'
        st=strel('square',3);
        f=imclose(gray,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton6'   
        st=strel('square',5);
        f=imclose(gray,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton7'
        st=strel('square',10);
        f=imclose(gray,st);
        axes(handles.axes2);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
g=rgb2gray(img_1);
gray=im2double(g);
axes(handles.axes1);
imshow(gray);
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton8'
        st=strel('disk',1);
        f=imdilate(g,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton9'   
        st=strel('disk',3);
        f=imdilate(g,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton10'
        st=strel('disk',5);
        f=imdilate(g,st);
        axes(handles.axes2);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
g=rgb2gray(img_1);
gray=im2double(g);
axes(handles.axes1);
imshow(gray);
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton14'  
        st=strel('disk',1);
        f=imerode(g,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton15'  
        st=strel('disk',3);
        f=imerode(g,st);
        axes(handles.axes2);
        imshow(f);
    case 'radiobutton16'  
        st=strel('disk',5);
        f=imerode(g,st);
        axes(handles.axes2);
        imshow(f);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('Í¼ÏñÊµÏ°ÈÎÎñ.doc');


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bj=imread('csu.jpg');
msgbox({'Architects£º';'Wen    Xunzhe       0145110818';'Xu       Youmin        0145110711'},'Notice','custom',bj);


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('main_meun');
close('morph_process');


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('additional_function')
close('morph_process');



% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.png','PNG files'}, 'Áí´æÎªÍ¼Æ¬');
if isequal(filename,0) || isequal(pathname,0)
return;
else
  fpath=fullfile(pathname, filename);
end
imwrite(f,fpath);
