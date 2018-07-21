function varargout = noise_filter(varargin)
% NOISE_FILTER MATLAB code for noise_filter.fig
%      NOISE_FILTER, by itself, creates a new NOISE_FILTER or raises the existing
%      singleton*.
%
%      H = NOISE_FILTER returns the handle to a new NOISE_FILTER or the handle to
%      the existing singleton*.
%
%      NOISE_FILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOISE_FILTER.M with the given input arguments.
%
%      NOISE_FILTER('Property','Value',...) creates a new NOISE_FILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before noise_filter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to noise_filter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help noise_filter

% Last Modified by GUIDE v2.5 05-Jul-2014 16:08:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @noise_filter_OpeningFcn, ...
                   'gui_OutputFcn',  @noise_filter_OutputFcn, ...
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


% --- Executes just before noise_filter is made visible.
function noise_filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to noise_filter (see VARARGIN)

% Choose default command line output for noise_filter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes noise_filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = noise_filter_OutputFcn(hObject, eventdata, handles) 
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
global img_1
global noise_pic
global f
gray=rgb2gray(img_1);
g=im2double(gray);
axes(handles.axes1);
imshow(g);
val=get(hObject,'value');
switch val
    case 1
        
    case 2
        noise_pic=imnoise(g,'gaussian',0,0.01);
    case 3
        noise_pic=imnoise(g,'salt & pepper',0.05);
    case 4
        noise_pic=imnoise(g,'poisson');
    case 5
        noise_pic=imnoise(g,'speckle',0.04);
    case 6
        [m,n]=size(g);
        noise_pic=raylrnd(g,m,n);
end
        


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
global noise_pic
axes(handles.axes2);
imshow(noise_pic);


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global noise_pic
global f
current=get(eventdata.NewValue,'Tag');
switch current
      case 'radiobutton1'
        f=filter2(fspecial('average',3),noise_pic);
        axes(handles.axes1);
        imshow(f);
      case 'radiobutton2'   
        f=filter2(fspecial('average',5),noise_pic);
        axes(handles.axes1);
        imshow(f);
      case 'radiobutton3'   
        f=filter2(fspecial('average',10),noise_pic);
        axes(handles.axes1);
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
global noise_pic
global f
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton4'
        M4=[0 1 0;1 0 1;0 1 0];
        M4=M4/4;
        f=filter2(M4,noise_pic);
        axes(handles.axes1);
        imshow(f);
    case 'radiobutton5'   
        M8=[1 1 1;1 0 1;1 1 1];
        M8=M8/8;
        f=filter2(M8,noise_pic);
        axes(handles.axes1);
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
global noise_pic
global f
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton7'
        f=medfilt2(noise_pic);
        axes(handles.axes1);
        imshow(f);
    case 'radiobutton8'   
        f=medfilt2(noise_pic,[5 5]);
        axes(handles.axes1);
        imshow(f);
    case 'radiobutton9'   
        f=medfilt2(noise_pic,[7 7]);
        axes(handles.axes1);
        imshow(f);
    case 'radiobutton10'   
        f=medfilt2(noise_pic,[9 9]);
        axes(handles.axes1);
        imshow(f);
end


% --- Executes when selected object is changed in uipanel9.
function uipanel9_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel9 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global f
global noise_pic
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton11'
        [m n]=size(noise_pic);
        p1(m,n)=0;
        for i=1:10
            p1=p1+double(noise_pic)/10;
        end
        axes(handles.axes1);
        imshow(mat2gray(p1));
    case 'radiobutton12'   
        [m n]=size(noise_pic);
        p2(m,n)=0;
        for i=1:50
            p2=p2+double(noise_pic)/50;
        end
        axes(handles.axes1);
        f=mat2gray(p2);
        imshow(f);

end


% --- Executes when selected object is changed in uipanel10.
function uipanel10_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel10 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global noise_pic
global f
current=get(eventdata.NewValue,'Tag');
switch current
    case 'radiobutton13'
        f=wiener2(noise_pic,[3 3]);
        axes(handles.axes1);
        imshow(f);
    case 'radiobutton14'   
        f=wiener2(noise_pic,[5 5]);
        axes(handles.axes1);
        imshow(f);

end





% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18


% --- Executes when selected object is changed in uipanel12.
function uipanel12_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel12 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
gray=rgb2gray(img_1);
current=get(eventdata.NewValue,'Tag');
switch current
   case 'radiobutton19'
    D=40;
    Fuv=fftshift(fft2(gray));
    [p,q]=size(Fuv);
    x0=floor(p/2);y0=floor(q/2);
    for u=1:p
        for v=1:q
            d=sqrt((u-x0)^2+(v-y0)^2);
            if(d>=D)
                h(u,v)=0;
            else
                h(u,v)=1;
            end
        end
    end
    Guv=h.*Fuv;
    f=ifftshift(Guv);
    f=uint8(real(ifft2(f)));
    axes(handles.axes1);
    imshow(f);
    %理想低通滤波
    
   case 'radiobutton20'
     D=40;
     Fuv=fftshift(fft2(gray));
     [p,q]=size(Fuv);
     x0=floor(p/2);y0=floor(q/2);
     for u=1:p
         for v=1:q
             d=sqrt((u-x0)^2+(v-y0)^2);
             if(d>=D)
                 h(u,v)=1;
             else
                 h(u,v)=0;
             end
         end
     end
     Guv=h.*Fuv;
     f=ifftshift(Guv);
     f=uint8(real(ifft2(f)));
     axes(handles.axes1);
     imshow(f);
     %理想高通滤波
     
   case 'radiobutton21'
     D=40;N=2;
     Fuv=fftshift(fft2(gray));
     [p,q]=size(Fuv);
     x0=floor(p/2);y0=floor(q/2);
     wait=waitbar(0,'正在计算，请等待');
     for u=1:p
         waitbar(u/p,wait);
         for v=1:q
             d=sqrt((u-x0)^2+(v-y0)^2);
             h(u,v)=1/(1+(d/D)^(2*N));
         end
     end
     Guv=h.*Fuv;
     f=ifftshift(Guv);
     f=uint8(real(ifft2(f)));
     axes(handles.axes1);
     imshow(f);
     %巴特沃斯低通滤波
     close(wait);
     
   case 'radiobutton22'
     D=40;N=2;
     Fuv=fftshift(fft2(gray));
     [p,q]=size(Fuv);
     x0=floor(p/2);y0=floor(q/2);
     wait=waitbar(0,'正在计算，请等待');
     for u=1:p
         waitbar(u/p,wait);
         for v=1:q
             d=sqrt((u-x0)^2+(v-y0)^2);
             if d==0
                 h(u,v)=0;
             else
               h(u,v)=1/(1+(D/d)^(2*N));
             end
         end
     end
     Guv=h.*Fuv;
     f=ifftshift(Guv);
     f=uint8(real(ifft2(f)));
     axes(handles.axes1);
     imshow(f);
     %巴特沃斯高通滤波
     close (wait);
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
winopen('图像实习任务.doc');


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bj=imread('csu.jpg');
msgbox({'Architects：';'Wen    Xunzhe       0145110818';'Xu       Youmin        0145110711'},'Notice','custom',bj);


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('main_meun');
close('noise_filter');


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('edge_detectation');
close('noise_filter');


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1
global f
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.png','PNG files'}, '另存为图片');
if isequal(filename,0) || isequal(pathname,0)
return;
else
  fpath=fullfile(pathname, filename);
end
imwrite(f,fpath);
