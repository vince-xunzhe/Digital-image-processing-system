function varargout = gray_transition(varargin)
% GRAY_TRANSITION MATLAB code for gray_transition.fig
%      GRAY_TRANSITION, by itself, creates a new GRAY_TRANSITION or raises the existing
%      singleton*.
%
%      H = GRAY_TRANSITION returns the handle to a new GRAY_TRANSITION or the handle to
%      the existing singleton*.
%
%      GRAY_TRANSITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAY_TRANSITION.M with the given input arguments.
%
%      GRAY_TRANSITION('Property','Value',...) creates a new GRAY_TRANSITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gray_transition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gray_transition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gray_transition

% Last Modified by GUIDE v2.5 05-Jul-2014 21:57:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gray_transition_OpeningFcn, ...
                   'gui_OutputFcn',  @gray_transition_OutputFcn, ...
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


% --- Executes just before gray_transition is made visible.
function gray_transition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gray_transition (see VARARGIN)

% Choose default command line output for gray_transition
global img_1
handles.output=img_1;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gray_transition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gray_transition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function files_Callback(hObject, eventdata, handles)
% hObject    handle to files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('Í¼ÏñÊµÏ°ÈÎÎñ.doc');


% --------------------------------------------------------------------
function details_Callback(hObject, eventdata, handles)
% hObject    handle to details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bj=imread('csu.jpg');
msgbox({'Architects£º';'Wen    Xunzhe       0145110818';'Xu       Youmin        0145110711'},'Notice','custom',bj);


% --------------------------------------------------------------------
function NEXT_Callback(hObject, eventdata, handles)
% hObject    handle to NEXT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('noise_filter');
close('gray_transition');


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1
[filename, pathname] = uigetfile( ...
{'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'; ...
'*.*', 'All Files (*.*)'}, ...
'Pick an image');
if isequal(filename,0) || isequal(pathname,0),
return;
end
axes(handles.axes1);
fpath=[pathname filename];
img_1=imread(fpath);
imshow(img_1);


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
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


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;clear global;
close('gray_transition');


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img_1
b=get(handles.slider2,'value');
f=imrotate(img_1,b);
axes(handles.axes2);
imshow(f);
set(handles.text4,'String',b);




% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f;
[m,n,k]=size(img_1);
im=double(img_1);
f=zeros(m,n,k);
f=double(f);
for i=1:k
    f(:,:,i)=log(im(:,:,i)+1);
    maxf=max(f(:,:,i));
    maxf=max(maxf);
    minf=min(f(:,:,i));
    minf=min(minf);
    f(:,:,i)=255*(f(:,:,i)-minf)/(maxf-minf);
end

f=uint8(f);   
axes(handles.axes2);
imshow(f);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1;
[m,n,k]=size(img_1);
im=double(img_1);
f=zeros(m,n,k);
f=double(f);
for i=1:k
    f(:,:,i)=im(:,:,i).^1.15;
end
f=uint8(f);   
axes(handles.axes2);
imshow(f);



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1;
[m,n,k]=size(img_1);
f=zeros(m,n,k);
f=double(f);
for i=1:k
    f(:,:,i)=256-img_1(:,:,i);
end
f=uint8(f);
axes(handles.axes2);
imshow(f);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1
gray=rgb2gray(img_1);
gray_e=histeq(gray,256);
axes(handles.axes2);
imshow(gray_e);
axes(handles.axes3);
imhist(gray_e);


% --------------------------------------------------------------------
function backward_Callback(hObject, eventdata, handles)
% hObject    handle to backward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('main_meun');
close('gray_transition')




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1;
g=rgb2gray(img_1);
gray=im2double(g);
f=1-gray;
axes(handles.axes2);
imshow(f)
axes(handles.axes3);
imhist(f);



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1;
g=rgb2gray(img_1);
gray=im2double(g);
axes(handles.axes1);
imshow(gray);
axes(handles.axes2);
imshow(gray);
axes(handles.axes3);
imhist(gray);


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img_1
b=get(handles.slider5,'value');
f=imresize(img_1,b);
axes(handles.axes2);
imshow(f);
set(handles.text5,'String',b);


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img_1
global gray
gray_a=rgb2gray(img_1);
gray=im2double(gray_a);
b=get(handles.slider6,'value');
th=b;
gray_thd=im2bw(gray,th);
axes(handles.axes2);
imshow(gray_thd);
axes(handles.axes3);
imhist(gray_thd);
set(handles.text1,'String',b);


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img_1;
g=rgb2gray(img_1);
gray=double(g);
b=get(handles.slider10,'value');
f=gray.^b;
%maxf=max(f(:));
%minf=min(f(:));
%f=255*(f-minf)/(maxf-minf);
axes(handles.axes2);
imshow(uint8(f));
axes(handles.axes3);
imhist(uint8(f));
set(handles.text2,'String',b);


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img_1;
g=rgb2gray(img_1);
gray=double(g);
b=get(handles.slider11,'value');
f=b*log(1+gray);
%maxf=max(f(:));
%minf=min(f(:));
%f=255*(f-minf)/(maxf-minf);
axes(handles.axes2);
imshow(uint8(f));
axes(handles.axes3);
imhist(uint8(f));
set(handles.text3,'String',b);


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
