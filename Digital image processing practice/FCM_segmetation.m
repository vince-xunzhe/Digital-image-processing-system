function v=FCM_segmetation(im,p,q)
imgray=rgb2gray(im);
% disp(imgray);
[m,n]=size(imgray);
% subplot(1,2,1),imshow(imgray),title('原图');
c=6;
pm=2;
u=zeros(c,m*n);
u2=zeros(c,m*n);
umin=zeros(c,m*n);
x=zeros(1,m*n);
for i=1:m
    for j=1:n
        x(1,(i-1)*n+j)=imgray(i,j);
%         disp(x(1,i*j));
    end
end
v=[23.3 25.55 160.5 80.5 255.3 200.6];
 for i=1:c     
        sumd=zeros(1,m*n);
        for k=1:c
            sumd=sumd+((x-v(i))./(x-v(k))).^2;
        end
        u(i,:)=1./sumd;
 end
 h=zeros(c,m*n);
 for cen=1:c
 for i=1:m*n
     xpos=fix(i/n)+1;
     ypos=mod(i,n);
     if xpos>2 && ypos>2 && n-xpos>2 && m-ypos>2
         sumh=0;
         for j=ypos-2:ypos+2
             for k=xpos-2:xpos+2
                 sumh=sumh+u(cen,(j-1)*n+k);
             end
         end
         h(cen,i)=sumh;
     else
         h(cen,i)=u(cen,i);
     end
 end
 end
 minJ=+inf;
 cot=0;
 u2=(u.^p).*(h.^q);
wait=waitbar(0,'正在计算，请等待');
 while cot<10
    cot=cot+1;
    for i=1:c
        v(i)=((u2(i,:).^2)*x')/sum(u2(i,:).^2);
    end
     disp(v);
%      disp(J);
    for i=1:c     
        sumd=zeros(1,m*n);
        for k=1:c
           sumd=sumd+((x-v(i))./(x-v(k))).^2;
        end
        u(i,:)=1./sumd;
    end
 h=zeros(c,m*n);
 for cen=1:c
 for i=1:m*n
     xpos=fix(i/n)+1;
     ypos=mod(i,n);
     if xpos>2 && ypos>2 && n-xpos>2 && m-ypos>2
         sumh=0;
         for j=ypos-2:ypos+2
             for k=xpos-2:xpos+2
                 sumh=sumh+u(cen,(j-1)*n+k);
             end
         end
         h(cen,i)=sumh;
     else
         h(cen,i)=u(cen,i);
     end
 end
 end
 u2=(u.^p).*(h.^q);
    sumj=0;
    for k=1:c
        sumj=sumj+(u2(k,:).^2)*((x-v(k)).^2)';
    end
   J=sumj;
    if minJ>J
        minJ=J;
        vmin=v;
        umin=u2;
    end
     s=['正在进行迭代处理:' num2str(ceil(cot*100/10)) '%'];
    waitbar(cot/10,wait,s);
 end
u=umin;
v=vmin;
close(wait);