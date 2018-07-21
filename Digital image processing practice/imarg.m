function arg=imarg(f)
% im=imread('eye.jpg')
% b0=strel('disk',3);
% imgray=rgb2gray(im);
% f=im2uint8(imgray);
[m,n]=size(f);
% f=imtophat(f,b0);
sumpixels=sum(f(:));
arg=sumpixels/(m*n);
% disp(arg);