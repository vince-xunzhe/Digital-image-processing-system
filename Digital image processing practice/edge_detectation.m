function varargout = edge_detectation(varargin)
% EDGE_DETECTATION MATLAB code for edge_detectation.fig
%      EDGE_DETECTATION, by itself, creates a new EDGE_DETECTATION or raises the existing
%      singleton*.
%
%      H = EDGE_DETECTATION returns the handle to a new EDGE_DETECTATION or the handle to
%      the existing singleton*.
%
%      EDGE_DETECTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGE_DETECTATION.M with the given input arguments.
%
%      EDGE_DETECTATION('Property','Value',...) creates a new EDGE_DETECTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edge_detectation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edge_detectation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edge_detectation

% Last Modified by GUIDE v2.5 05-Jul-2014 15:27:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edge_detectation_OpeningFcn, ...
                   'gui_OutputFcn',  @edge_detectation_OutputFcn, ...
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


% --- Executes just before edge_detectation is made visible.
function edge_detectation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edge_detectation (see VARARGIN)

% Choose default command line output for edge_detectation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edge_detectation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edge_detectation_OutputFcn(hObject, eventdata, handles) 
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
    gray=rgb2gray(img_1);
    g=im2double(gray);
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    imshow(g);
switch current
      case 'radiobutton1'
        f=edge(g,'canny',[0.03,0.06]); 
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton2'   
        f=edge(g,'canny',[0.05,0.1]);     
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton3'   
        f=edge(g,'canny',[0.05,0.1],2);   
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
    gray=rgb2gray(img_1);
    g=im2double(gray);
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    imshow(g);
switch current
      case 'radiobutton7'
        f=edge(g,'log',0.002,1.7); 
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton10'   
        f=edge(g,'log',0.007,1.7);      
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton11'   
         f=edge(g,'log',0.007,3);   
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton21'   
        h=fspecial('laplacian');
        f=imfilter(g,h);
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
    gray=rgb2gray(img_1);
    g=im2double(gray);
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    imshow(g);
switch current
      case 'radiobutton12'
        f=edge(g,'prewitt',0.02); 
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton13'   
        f=edge(g,'prewitt',0.07);      
        axes(handles.axes2);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
    gray=rgb2gray(img_1);
    g=im2double(gray);
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    imshow(g);
switch current
      case 'radiobutton15'
        f=edge(g,'roberts',0.02); 
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton16'   
        f=edge(g,'roberts',0.07);      
        axes(handles.axes2);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
    gray=rgb2gray(img_1);
    g=gray;
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    imshow(g);
switch current
      case 'radiobutton17'
        f=edge(g,'sobel',0.02); 
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton18'   
        f=edge(g,'sobel',0.07);      
        axes(handles.axes2);
        imshow(f);
      case 'radiobutton22'   
        h1=[-1 0 1;
            -2 0 2;
            -1 0 1;];
        f=imfilter(g,h1);
        axes(handles.axes2);
        imshow(f);
       case 'radiobutton23'   
        h2=[1 2 1;
            0 0 0;
            -1 -2 -1;];
        f=imfilter(g,h2);
        axes(handles.axes2);
        imshow(f);
        case 'radiobutton25'   
        h1=[1 2 1;
            0 0 0;
            -1 -2 -1;];
        h2=[-1 0 1;
            -2 0 2;
            -1 0 1;];
        h3=[-1 -2 -1;
            0 0 0;
            1 2 1;];
        h4=[1 0 -1;
            2 0 -2;
            1 0 -1;];
        k1=imfilter(g,h1);
        k2=imfilter(g,h2);
        k3=imfilter(g,h3);
        k4=imfilter(g,h4);
        f=double(k1)+double(k2)+double(k3)+double(k4);
        m=uint8(f/4);
        %c=imadjust(m,[0 0.5],[]);
        f=m;
        axes(handles.axes2);
        imshow(f);        
        
end


% --- Executes when selected object is changed in uipanel8.
function uipanel8_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel8 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
    gray=rgb2gray(img_1);
    g=double(gray);
    current=get(eventdata.NewValue,'Tag');
    axes(handles.axes1);
    g=uint8(g);
    imshow(g);
switch current
      case 'radiobutton19'
        h=[-1 -1 -1;
           -1  8 -1;
           -1 -1 -1;];
         f=imfilter(g,h);
        axes(handles.axes2);
        f=uint8(f);
        imshow(f);
       case 'radiobutton20'
           %h=fspecial('average',[10 10]);
           %f_1=imfilter(g,h);
           %k_1=g-f_1;
           st=strel('disk',5);
           f=imclose(g,st);
           f=g-f;
           axes(handles.axes2);
           f=uint8(f);
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
close('edge_detectation');


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('morph_process');
close('edge_detectation');


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
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
