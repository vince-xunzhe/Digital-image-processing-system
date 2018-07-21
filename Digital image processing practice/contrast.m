function [c,v]=contrast(f)
% clear;
im=imread('e4.jpg');
imgray=rgb2gray(im);
fold=im2uint8(imgray);
imgray=f;
% disp(fold);
% subplot(2,2,1),
% imshow(f);
% subplot(2,2,4),
% imhist(imgray),title('原直方图');
[m,n]=size(imgray);
numgray=zeros(1,256);
% numgray1=zeros(1,256);%增强图像局部像素集合
P=zeros(1,256);
% P1=zeros(1,256);
w=zeros(1,256);
u=zeros(1,256);
w1=zeros(1,256);
u1=zeros(1,256);
var=zeros(1,256);
for i=1:m     %局部阈值处理
    for j=1:n
        if fold(i,j)>32
        numgray(imgray(i,j)+1)=numgray(imgray(i,j)+1)+1;
        end
    end
end
% subplot(2,2,2);
% imshow(fold),title('视网膜边界提取');
% disp(numgray);
for i=0:255
    P(i+1)=numgray(i+1)/sum(numgray(:));
end
meanlevel=0;
for i=0:255
    meanlevel=meanlevel+i*P(i+1);
end
for k=0:255
    for kk=0:k
        w(k+1)=w(k+1)+P(kk+1);
        u(k+1)=u(k+1)+kk*P(kk+1);
    end
    for kk=k+1:255
        w1(k+1)=w1(k+1)+P(kk+1);
        u1(k+1)=u1(k+1)+kk*P(kk+1);
    end
     var(k+1)=w(k+1)*(u(k+1)-meanlevel)^2+w1(k+1)*(u1(k+1)-meanlevel)^2;
end
for k=1:256
    if var(k)==max(var)
        thresh=k-1;
        break;
    end
end
v=max(var);
disp(thresh);%局部阈值处理，找到最佳阈值分割点
y=u(thresh+1);
g=u1(thresh+1);
% y=0;
% g=0;
% for k1=0:thresh-1
%     y=y+k1*P(k1+1);
% end
% for k2=thresh:255
%     g=g+k2*P(k2+1);
% end
c=abs(y-g)/(g+y);
% for i=1:m
%     for j=1:n
%         if imgray(i,j)>=thresh
%             imgray(i,j)=255;
%         else
%             imgray(i,j)=0;
%         end
%     end
% end
% subplot(2,2,3),imshow(imgray),title('局部阈值处理');




