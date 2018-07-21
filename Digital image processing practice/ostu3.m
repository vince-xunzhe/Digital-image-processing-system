function [threek1,threek2,threek3]=ostu3(im)
im=im2uint8(im);
% subplot(2,2,1);
% imshow(im);
% subplot(2,2,2);
% imhist(im);
imgray=im;
[m,n]=size(imgray);
N=m*n;
numgray=zeros(1,256);
P=zeros(1,256);
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
% disp(maxvar)
wait=waitbar(0,'正在计算，请等待');
for k1=0:150;
   for k2=80:220
       for k3=100:255
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
    s=['正在进行三阈值处理:' num2str(ceil(k1*100/150)) '%'];
    waitbar(k1/150,wait,s);
end
close(wait);
