function [tk1,tk2]=ostudouble(im)
imgray=im;
[m,n]=size(imgray);
N=m*n;
numgray=zeros(1,256);
P=zeros(1,256);
w0=zeros(256,256);
u0=zeros(256,256);
w1=zeros(256,256);
u1=zeros(256,256);
w2=zeros(256,256);
u2=zeros(256,256);
vardouble=zeros(256,256);
for i=1:m
    for j=1:n
        numgray(imgray(i,j)+1)=numgray(imgray(i,j)+1)+1;
    end
end
for i=0:255
    P(i+1)=numgray(i+1)/N;
end
meanlevel=0;
for i=0:255
    meanlevel=meanlevel+i*P(i+1);
end
for k1=0:255;
   for k2=(k1+1):255
       for kk=0:k1
           w0(k1+1,k2+1)=w0(k1+1,k2+1)+P(kk+1);
           u0(k1+1,k2+1)=u0(k1+1,k2+1)+kk*P(kk+1);
       end
       for kk=k1:k2
           w1(k1+1,k2+1)=w1(k1+1,k2+1)+P(kk+1);
           u1(k1+1,k2+1)=u1(k1+1,k2+1)+kk*P(kk+1);
       end
       for kk=k2:255
           w2(k1+1,k2+1)=w2(k1+1,k2+1)+P(kk+1);
           u2(k1+1,k2+1)=u2(k1+1,k2+1)+kk*P(kk+1);
       end
       vardouble(k1+1,k2+1)=w0(k1+1,k2+1)*(u0(k1+1,k2+1)-meanlevel)^2+w1(k1+1,k2+1)*(u1(k1+1,k2+1)-meanlevel)^2+w2(k1+1,k2+1)*(u2(k1+1,k2+1)-meanlevel)^2;
   end
end
maxvar=max(vardouble);
for i=1:256
    for j=i+1:256
        if vardouble(i,j)==max(maxvar)
            tk1=i-1;
            tk2=j-1;
            return
        end
    end
end
%tk1=100;
%tk2=200;

