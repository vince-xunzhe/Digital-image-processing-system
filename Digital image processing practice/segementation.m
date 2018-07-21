function varargout = segementation(varargin)
% SEGEMENTATION MATLAB code for segementation.fig
%      SEGEMENTATION, by itself, creates a new SEGEMENTATION or raises the existing
%      singleton*.
%
%      H = SEGEMENTATION returns the handle to a new SEGEMENTATION or the handle to
%      the existing singleton*.
%
%      SEGEMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGEMENTATION.M with the given input arguments.
%
%      SEGEMENTATION('Property','Value',...) creates a new SEGEMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before segementation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to segementation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help segementation

% Last Modified by GUIDE v2.5 06-Jul-2014 13:26:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @segementation_OpeningFcn, ...
                   'gui_OutputFcn',  @segementation_OutputFcn, ...
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


% --- Executes just before segementation is made visible.
function segementation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to segementation (see VARARGIN)

% Choose default command line output for segementation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes segementation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = segementation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global val1
val1=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val1
global grayimf1
global grayimf2
global grayimf3
% global im
% imgrayhist=rgb2gray(im);
% axes(handles.axes3);
% imhist(imgrayhist),title('原图直方图','Color','r','FontSize',10);
switch val1
    case 1
    case 2
        axes(handles.axes1);
        imshow(grayimf1),title('单阈值分割','Color','r','FontSize',10);
    case 3
        axes(handles.axes2);
        imshow(grayimf2),title('双阈值分割','Color','r','FontSize',10);
    case 4
        axes(handles.axes1);
        imshow(grayimf3),title('三阈值分割','Color','r','FontSize',10);
end
% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global val2
val2=get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global val2
global v1
global v2
global v3
global v4
f=rgb2gray(im);
[m,n]=size(f);
f=double(f);
switch val2
    case 1
    case 2
        for i=1:m
           for j=1:n
%         disp(u(:,i*j));
           midv=abs(v1-f(i,j));
           cenk=find(midv==min(midv));
           f(i,j)=v1(cenk);
           end
        end
        f=uint8(f);
        axes(handles.axes1);
        imshow(f),title('传统聚类分割','Color','r','FontSize',8);
    case 3
        for i=1:m
           for j=1:n
%         disp(u(:,i*j));
           midv=abs(v2-f(i,j));
           cenk=find(midv==min(midv));
           f(i,j)=v2(cenk);
           end
        end
        f=uint8(f);
        axes(handles.axes2);
        imshow(f),title('P=1,Q=1 FCM聚类分割','Color','r','FontSize',8);
    case 4
        for i=1:m
           for j=1:n
%         disp(u(:,i*j));
           midv=abs(v3-f(i,j));
           cenk=find(midv==min(midv));
           f(i,j)=v3(cenk);
           end
        end
        f=uint8(f);
        axes(handles.axes1);
        imshow(f),title('P=0,Q=2 FCM聚类分割','Color','r','FontSize',8);
    case 5
        for i=1:m
           for j=1:n
%          disp(u(:,i*j));
           midv=abs(v4-f(i,j));
           cenk=find(midv==min(midv));
           f(i,j)=v4(cenk);
           end
        end
        f=uint8(f);
        axes(handles.axes2);
        imshow(f),title('P=1,Q=2 FCM聚类分割','Color','r','FontSize',8);
end

% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global grayimf1
global grayimf2
global grayimf3
global v1
global v2
global v3
global v4
[filename, pathname] = uigetfile( ...
{'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'; ...
'*.*', 'All Files (*.*)'}, ...
'Pick an image');
if isequal(filename,0) || isequal(pathname,0),
return;
end
axes(handles.axes1);
fpath=[pathname filename];
im=imread(fpath);
imshow(im),title('原图','Color','r','FontSize',10);
imgray=rgb2gray(im);
axes(handles.axes2);
imshow(imgray),title('原图灰度图','Color','r','FontSize',10);
imgray=im2uint8(imgray);
imgray2=imgray;
imgray3=imgray;
% subplot(2,2,1);
% imshow(imgray);
% subplot(2,2,2);
% imhist(imgray);
% [cunt,cuntx]=imhist(imgray);
[m,n]=size(imgray);
ostuthresh=ostuthreshold(imgray);
disp(ostuthresh);
[threshk1,threshk2]=ostudouble(imgray);
disp(threshk1);
disp(threshk2);
for i=1:m
    for j=1:n
        if imgray(i,j)>=ostuthresh
            imgray(i,j)=255;
        else
            imgray(i,j)=0;
        end
    end
end
% subplot(2,2,3);
% imshow(imgray);
grayimf1=imgray;
for i=1:m
    for j=1:n
        if imgray2(i,j)<=threshk1;
            imgray2(i,j)=0;
        else if imgray2(i,j)<=threshk2
            imgray2(i,j)=(threshk1+threshk2)/2;%(threshk1+threshk2)/2
            else
                imgray2(i,j)=255;
            end
        end
    end
end
grayimf2=imgray2;
[threek1,threek2,threek3]=ostu3(imgray3);
for i=1:m
    for j=1:n
        if imgray3(i,j)<=threek1;
            imgray3(i,j)=0;
        else if imgray(i,j)<=threek2
            imgray3(i,j)=(threek1+threek2)/2;%(threshk1+threshk2)/2
            else if imgray3(i,j)<=threek3
                imgray3(i,j)=(threek3+threek2)/2;
                else
                    imgray3(i,j)=255;
                end
            end
        end
    end
end
grayimf3=imgray3;
v1=FCM_SEG(im);
v2=FCM_segmetation(im,1,1);
v3=FCM_segmetation(im,0,2);
v4=FCM_segmetation(im,1,2);

% subplot(2,2,4);
% imshow(imgray2);


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global saveseg
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.png','PNG files'}, '另存为图片');
if isequal(filename,0) || isequal(pathname,0)
return;
else
  fpath=fullfile(pathname, filename);
end
imwrite(saveseg,fpath);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgray=rgb2gray(im);
axes(handles.axes3);
imshow(imgray),title('原灰度图','Color','r','FontSize',8);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgray=rgb2gray(im);
axes(handles.axes3);
imhist(imgray),title('原直方图','Color','r','FontSize',8);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('图像实习任务.doc');


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bj=imread('csu.jpg');
msgbox({'Architects：';'Wen    Xunzhe       0145110818';'Xu       Youmin        0145110711'},'Notice','custom',bj);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('main_meun');
close('morph_process');

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bj=imread('csu.jpg');
msgbox({'特别鸣谢:';'      喻罡       老师';'      黄忠朝   老师'},'Notice','custom',bj);
