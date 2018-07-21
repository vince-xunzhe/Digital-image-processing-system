% function b=multi_dilate(n)
im=imread('eye.jpg')
imgray=rgb2gray(im);
f=im2uint8(imgray);
f1=f;
subplot(2,2,1);
imshow(f);
[m,n]=size(f);
b0=strel('disk',3);
b=b0;
disp(b);
% if(n==1)
%     b=b0;
% else for k=2:n
%        b=imdilate(b,b0);
%     end
% end
% for k=1:4
%        f=imdilate(f,b0);
%        subplot(2,2,k);
%        imshow(f);
% end
f=imtophat(f,b0);
subplot(2,2,2);
imshow(f);
sumpixles=sum(f(:));
farg=sumpixles/(m*n);
f=f1+farg;
disp(f);
subplot(2,2,3);
imshow(f);