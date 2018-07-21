% function [threek1,threek2,threek3]=ostuthree(im)
im=imread('g.jpg'); %读取图像
im=rgb2gray(im);    %灰度转换
im=im2uint8(im);
subplot(2,2,1);
imshow(im);         %画出原图
subplot(2,2,2);
imhist(im);         %画出直方图
imgray=im;
[m,n]=size(imgray);  %
N=m*n;
numgray=zeros(1,256);
P=zeros(1,256);
% w0=zeros(256,256,256);
% u0=zeros(256,256,256);
% w1=zeros(256,256,256);
% u1=zeros(256,256,256);
% w2=zeros(256,256,256);
% u2=zeros(256,256,256);
% w3=zeros(256,256,256);
% u3=zeros(256,256,256);
% varthree=zeros(256,256,256);
for i=1:m
    for j=1:n
        numgray(imgray(i,j)+1)=numgray(imgray(i,j)+1)+1;
    end
end
for i=0:255
    P(i+1)=numgray(i+1)/N;
end
meanlevel=0;
w0=0;w1=0;w2=0;w3=0;
u0=0;u1=0;u2=0;u3=0;maxvar=0;
for i=0:255
    meanlevel=meanlevel+i*P(i+1);
end
for k1=0:150;
   for k2=(k1+1):250
       for k3=(k2+1):255
           for kk=0:k1
           w0=w0+P(kk+1);
           u0=u0+kk*P(kk+1);
           end
           for kk=k1:k2
           w1=w1+P(kk+1);
           u1=u1+kk*P(kk+1);
           end
           for kk=k2:k3
           w2=w2+P(kk+1);
           u2=u2+kk*P(kk+1);
           end
           for kk=k3:255
           w3=w3+P(kk+1);
           u3=u3+kk*P(kk+1);
           end
           varthree=w0*(u0-meanlevel)^2+w1*(u1-meanlevel)^2+w2*(u2-meanlevel)^2+w3*(u3-meanlevel)^2;
           w0=0;w1=0;w2=0;w3=0;
           u0=0;u1=0;u2=0;u3=0;
           if varthree>maxvar
               maxvar=varthree;
               threek1=k1;
               threek2=k2;
               threek3=k3;
           end
       end
   end
end
disp(threek1);
disp(threek2);
disp(threek3);
for i=1:m
    for j=1:n
        if imgray(i,j)<=threek1;
            imgray(i,j)=0;
        else if imgray(i,j)<=threek2
            imgray(i,j)=(threek1+threek2)/2;%(threshk1+threshk2)/2
            else if imgray(i,j)<=threek3
                imgray(i,j)=(threek3+threek2)/2;
                else
                    imgray(i,j)=255;
                end
            end
        end
    end
end
subplot(2,1,2);
imshow(imgray);


