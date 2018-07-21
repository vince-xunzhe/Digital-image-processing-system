function varargout = additional_function(varargin)
% ADDITIONAL_FUNCTION MATLAB code for additional_function.fig
%      ADDITIONAL_FUNCTION, by itself, creates a new ADDITIONAL_FUNCTION or raises the existing
%      singleton*.
%
%      H = ADDITIONAL_FUNCTION returns the handle to a new ADDITIONAL_FUNCTION or the handle to
%      the existing singleton*.
%
%      ADDITIONAL_FUNCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADDITIONAL_FUNCTION.M with the given input arguments.
%
%      ADDITIONAL_FUNCTION('Property','Value',...) creates a new ADDITIONAL_FUNCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before additional_function_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to additional_function_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help additional_function

% Last Modified by GUIDE v2.5 06-Jul-2014 11:34:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @additional_function_OpeningFcn, ...
                   'gui_OutputFcn',  @additional_function_OutputFcn, ...
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


% --- Executes just before additional_function is made visible.
function additional_function_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to additional_function (see VARARGIN)

% Choose default command line output for additional_function
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes additional_function wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = additional_function_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global saveimg
global val2
global imf2
global imf3
gray=rgb2gray(im);
axes(handles.axes4);
imhist(gray),title('原灰度直方图','Color','r','FontSize',10); 
switch val2
    case 1
    case 2
          axes(handles.axes2);
          imshow(imf2),title('灰度分层处理','Color','r','FontSize',10);
          saveimg=imf2;
    case 3
          axes(handles.axes2);
          imshow(imf3),title('正弦灰度变换','Color','r','FontSize',10);
          saveimg=imf3;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val
global imgf2
global imgf3
global imgf4
global imgf1
global saveimg
global grayvote
switch val
    case 1
    case 2
       axes(handles.axes1);
       imshow(imgf1),title('原灰度图','Color','r','FontSize',10); 
       axes(handles.axes4);
       imhist(imgf1),title('原灰度图','Color','r','FontSize',10);
       saveimg=imgf1;
    case 3
       axes(handles.axes2);
       imshow(imgf2),title('原图直接高斯拟合线性拉伸','Color','r','FontSize',10); 
       axes(handles.axes4);
       imhist(imgf2),title('原图直接高斯拟合线性拉伸','Color','r','FontSize',10);
       saveimg=imgf2;
    case 4
       axes(handles.axes2);
       imshow(imgf3),title('多尺度变换顶帽变换增强','Color','r','FontSize',10); 
       axes(handles.axes4);
       imhist(imgf3),title('多尺度变换顶帽变换增强','Color','r','FontSize',10); 
       saveimg=imgf3;
    case 5
       axes(handles.axes1);
       imshow(imgf4),title('多尺度顶帽变换后高斯拟合线性拉伸','Color','r','FontSize',10); 
       axes(handles.axes4);
       imhist(imgf4),title('多尺度顶帽变换后高斯拟合线性拉伸','Color','r','FontSize',10);
       saveimg=imgf4;
    case 6
         axes(handles.axes2);
       imshow(grayvote),title('灰度投票算法视网膜增强','Color','r','FontSize',10); 
       axes(handles.axes4);
       imhist(grayvote),title('灰度投票算法视网膜增强','Color','r','FontSize',10);
       saveimg=grayvote;
        
end



% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global imgf2
global imgf3
global imgf4
global imgf1
global imf2
global imf3
global grayvote
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
imgf1=uint8(imgray);
% axes(handles.axes2);
% imshow(imgray),title('原灰度图','Color','r','FontSize',10);
f=im2uint8(imgray);
fold=f;
fc=f;
[m,n]=size(f);
% figure(2),subplot(2,2,1);
% imhist(f),title('原直方图'),xlabel('灰度值'),ylabel('数量');
[counts1,cur]=imhist(f);%归一化
cous1=counts1(15:255);%多尺度变换前高斯拉伸
cur1=cur(15:255);
curk1=144-2*24.14;
curk2=144+2*24.14;
curk=255/(curk2-curk1);
wait=waitbar(0,'正在计算，请等待');
for i=1:m
    for j=1:n
        if fc(i,j)<=curk1
            fc(i,j)=0;
        else if fc(i,j)<=curk2
                fc(i,j)=curk*(fc(i,j)-curk1);
%                 disp(fen(i,j));
            else
            fc(i,j)=255;
            end
        end
    end
    s=['正在处理图像:' num2str(ceil(i*100/m)) '%'];
     waitbar(i/m,wait,s);
end
close (wait);
imgf2=fc;
% figure(2),subplot(2,2,3);
% imhist(fc),title('高斯拉伸直方图'),xlabel('灰度值'),ylabel('数量');
% figure(1),subplot(2,2,3);
% imshow(fc),title('原图直接高斯拟合线性拉伸');
p1=counts1/sum(counts1);
% figure(1),subplot(2,2,1),
% imshow(fold),title('原图');
argpixels=zeros(1,20);
argpixels1=zeros(1,20);
argdwth=zeros(1,20);
argbwth=zeros(1,20);
wait=waitbar(0,'正在计算，请等待');
for i=1:20
    f=multitophat(fold,i);
    af(:,:,i)=f;
    argpixels(i)=imarg(f);
    s=['正在进行多尺度顶帽变换:' num2str(ceil(i*100/20)) '%'];
    waitbar(i/20,wait,s);
end
[m1,c1]=max(argpixels);
fwr=af(:,:,c1);                 
% disp(fwr);
close(wait);
for i=1:19
    dwth=af(:,:,i+1)-af(:,:,i);
    dwthf(:,:,i)=dwth;
    argdwth(i)=imarg(dwth);
end
% disp(argdwth);
[m2,c2]=max(argdwth);
fwd=dwthf(:,:,c2);
wait=waitbar(0,'正在计算，请等待');
for i=1:20
    f=multibothat(fold,i);
    bf(:,:,i)=f;
    argpixels1(i)=imarg(f);
    s=['正在进行多尺度底帽变换:' num2str(ceil(i*100/20)) '%'];
    waitbar(i/20,wait,s);
end
close(wait);
[m3,c3]=max(argpixels);
fbr=bf(:,:,c3);
for i=1:19
    bwth=af(:,:,i+1)-af(:,:,i);
    bwthf(:,:,i)=bwth;
    argbwth(i)=imarg(bwth);
end
[m4,c4]=max(argbwth);
fbd=bwthf(:,:,c4);
fen=fold+fwr+fwd-fbr-fbd;
% figure(1),subplot(2,2,2);
% imshow(fen),title('多尺度变换');
imgf3=fen;
fen2=fen;
[counts,I]=imhist(fen);
p2=counts/sum(counts);
% figure(2),subplot(2,2,2);
p21=p2(12:255);
I21=I(12:255);
% imhist(fen),title('多尺度变换');
counts2=counts(25:255);%截取画图区间
I2=I(25:255);
logcut=log(counts+0.01);
k1=153-2*34.92;
k2=153+2*34.92;
k=255/(k2-k1);
disp(k);
wait=waitbar(0,'正在计算，请等待');
for i=1:m
    for j=1:n
        if fen(i,j)<=k1
            fen(i,j)=0;
        else if fen(i,j)<=k2
                fen(i,j)=k*(fen(i,j)-k1);
%                 disp(fen(i,j));
            else
            fen(i,j)=255;
            end
        end
    end
   s=['即将处理完图像:' num2str(ceil(i*100/m)) '%'];
   waitbar(i/m,wait,s);
end
imgf4=fen;
close(wait);
gray=rgb2gray(im);
[m,n] = size(gray);
J = double(gray);
L=255;
wait=waitbar(0,'正在计算，请等待');
for i = 1:m
    for j = 1:n  
        if J(i,j) < L/16
            R(i,j) = 0;
            G(i,j) = 0;
            B(i,j) = 0;
        elseif J(i,j) < L/8
            R(i,j) = 26;
            G(i,j) = 16;
            B(i,j) = 63;         
        elseif J(i,j) < 3*L/16
            R(i,j) = 45;
            G(i,j) = 24;
            B(i,j) = 84;       
        elseif J(i,j) < L/4
            R(i,j) = 70;
            G(i,j) = 29;
            B(i,j) = 103;
        elseif J(i,j) < 5*L/16
            R(i,j) = 98;
            G(i,j) = 33;
            B(i,j) = 119;
        elseif J(i,j) < 3*L/8
            R(i,j) = 128;
            G(i,j) = 37;
            B(i,j) = 132;
        elseif J(i,j) < 7*L/16
            R(i,j) = 160;
            G(i,j) = 41;
            B(i,j) = 140;
        elseif J(i,j) < L/2
            R(i,j) = 195;
            G(i,j) = 48;
            B(i,j) = 141;
       elseif J(i,j) < 9*L/16
            R(i,j) = 223;
            G(i,j) = 65;
            B(i,j) = 136;       
        elseif J(i,j) < 5*L/8
            R(i,j) = 244;
            G(i,j) = 93;
            B(i,j) = 120;        
        elseif J(i,j) < 11*L/16
            R(i,j) = 254;
            G(i,j) = 126;
            B(i,j) = 104;
        elseif J(i,j) < 3*L/4
            R(i,j) = 255;
            G(i,j) = 159;
            B(i,j) = 96;
        elseif J(i,j) < 13*L/16
            R(i,j) = 253;
            G(i,j) = 190;
            B(i,j) = 104; 
        elseif J(i,j) < 7*L/8
            R(i,j) = 246;
            G(i,j) = 218;
            B(i,j) = 133;
        elseif J(i,j) < 15*L/16
            R(i,j) = 246;
            G(i,j) = 240;
            B(i,j) = 188;
        else 
            R(i,j) = 255;
            G(i,j) = 255;
            B(i,j) = 255;
        end
    end
    s=['正在进行灰度分层伪彩处理:' num2str(ceil(i*100/m)) '%'];
     waitbar(i/m,wait,s);
end
close(wait);
new = repmat(gray,[1 1 3]);
for i = 1:m
    for j = 1:n
        new(i,j,1) = R(i,j);
        new(i,j,2) = G(i,j);
        new(i,j,3) = B(i,j);
    end
end
imf2=new;
% axes(handles.axes2);
% imshow(imf),title('伪彩色结果','Color','r','FontSize',10);
img=rgb2gray(im);
z=3;
[x y]=size(img);
% figure(1),imshow(img);
img=double(img);
img_cai=zeros(x,y,z);
Max=max(max(img));
Min=min(min(img));
img=img*(255/(Max-Min))-(255*Min)/(Max-Min);
r=1;
g=2;
b=3;
wait=waitbar(0,'正在计算，请等待');
for i=1:x
    for j=1:y
        temp=(2*pi/(Max-Min))*img(i,j)-(2*pi*Min)/(Max-Min);       
       
        if temp<=pi/2
            img_cai(i,j,r)=0;
            img_cai(i,j,g)=0;
            img_cai(i,j,b)=255*(sin(temp));
        end
        
        if temp>pi/2 && temp<=pi
            img_cai(i,g,r)=0;
            img_cai(i,j,g)=255*(-cos(temp));
            img_cai(i,j,b)=255*(sin(temp));
        end
        
        if temp>pi && temp<=pi*3/2
            img_cai(i,j,r)=255*(-sin(temp));
            img_cai(i,j,g)=255*(-cos(temp));
            img_cai(i,j,b)=0;
        end
        
        if temp>pi*3/2
            img_cai(i,j,r)=255*(-sin(temp));
            img_cai(i,j,g)=0;
            img_cai(i,j,b)=0;     
        end
        
%        img_cai(i,j,1)=127.5*(-sin(temp))+127.5;
%        img_cai(i,j,2)=127.5*(-cos(temp))+127.5;
%        img_cai(i,j,3)=127.5*(sin(temp))+127.5;        
    end
    s=['正在进行灰度分层伪彩处理:' num2str(ceil(i*100/x)) '%'];
     waitbar(i/x,wait,s);
end
imf3=uint8(img_cai);
% figure(1),subplot(2,2,4);
% imshow(fen),title('多尺度顶帽变换后高斯拟合线性拉伸');
% [counts3,I3]=imhist(fen);%归一化
% figure(2),subplot(2,2,4),
% imhist(fen),title('多尺度顶帽变换后高斯拟合线性拉伸');
% thresh=graythresh(fen);
close (wait);
imgray=rgb2gray(im);
f=im2uint8(imgray);
[m,n]=size(f);
vote=zeros(m,n);
%figure(1),imshow(f);
for i=2:m-1
    for j=2:n-1
        xpos=i;
        ypos=j;
        cmp=f(i,j)-5;
        nummax=0;
        nummin=0;
        maxvalue=f(i,j);
        minvalue=f(i,j);
         for k2=ypos-1:ypos+1
             for k1=xpos-1:xpos+1
                 if f(k1,k2)>cmp
                     nummax=nummax+1;
                 else
                     nummin=nummin+1;
                 end
                  if maxvalue<f(k1,k2)
                      maxvalue=f(k1,k2);
                  end
                  if minvalue>f(k1,k2)
                      minvalue=f(k1,k2);
                  end
             end
         end
         vote(i,j)=nummax*maxvalue/8+nummin*minvalue/8;
    end
end
%figure,imshow(uint8(vote));
img=uint8(vote);
cc=medfilt2(img);
grayvote=cc;




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global val;
val=get(hObject,'Value');


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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global val2
val2=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global saveimg
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.png','PNG files'}, '另存为图片');
if isequal(filename,0) || isequal(pathname,0)
return;
else
  fpath=fullfile(pathname, filename);
end
imwrite(saveimg,fpath);


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
close('additional_function');


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('segementation');
close('additional_function');
