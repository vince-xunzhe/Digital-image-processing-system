function thresh=ostuthreshold(im)
imgray=im;
[m,n]=size(imgray);
N=m*n;
numgray=zeros(1,256);
P=zeros(1,256);
w=zeros(1,256);
u=zeros(1,256);
w0=zeros(1,256);
u0=zeros(1,256);
w1=zeros(1,256);
u1=zeros(1,256);
var=zeros(1,256);
var1=zeros(1,256);
var2=zeros(1,256);
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
for k=0:255
    for kk=0:k
        w0(k+1)=w0(k+1)+P(kk+1);
        u0(k+1)=u0(k+1)+kk*P(kk+1);
        w(k+1)=w(k+1)+P(kk+1);
        u(k+1)=u(k+1)+kk*P(kk+1);
    end
    for kk=k+1:255
        w1(k+1)=w1(k+1)+P(kk+1);
        u1(k+1)=u1(k+1)+kk*P(kk+1);
    end
    var1(k+1)=w0(k+1)*(u0(k+1)-meanlevel)^2+w1(k+1)*(u1(k+1)-meanlevel)^2;
    var2(k+1)=w0(k+1)*w1(k+1)*(u0(k+1)-u1(k+1))^2;
    if w(k+1)>0&&w(k+1)<1
    var(k+1)=((meanlevel*w(k+1)-u(k+1))^2)/(w(k+1)*(1-w(k+1)));
    end
end
for k=1:256
    if var1(k)==max(var1)
        thresh=k-1;
        break;
    end
end
% [vc,vi]=max(var2);
% disp(vc);disp(vi)
