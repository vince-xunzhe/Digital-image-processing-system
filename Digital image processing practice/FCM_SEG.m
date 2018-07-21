function v=FCM_SEG(im)
imgray=rgb2gray(im);
% disp(imgray);
[m,n]=size(imgray);
% subplot(1,2,1),imshow(imgray),title('原图');
c=5;
pm=2;
u=zeros(c,m*n);
umin=zeros(c,m*n);
x=zeros(1,m*n);
for i=1:m
    for j=1:n
        x(1,(i-1)*n+j)=imgray(i,j);
%         disp(x(1,i*j));
    end
end
v=[250.55 255.55 160.5 30.2 56.3];
 for i=1:c     
        sumd=zeros(1,m*n);
        for k=1:c
            sumd=sumd+((x-v(i))./(x-v(k))).^2;
        end
        u(i,:)=1./sumd;
 end
 minJ=+inf;
 cot=0;
 while cot<20
    cot=cot+1;
    for i=1:c
        v(i)=((u(i,:).^2)*x')/sum(u(i,:).^2);
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
    sumj=0;
    for k=1:c
        sumj=sumj+(u(k,:).^2)*((x-v(k)).^2)';
    end
   J=sumj;
    if minJ>J
        minJ=J;
        vmin=v;
        umin=u;
    end
 end
u=umin;
v=vmin;
% disp(v);
% f=double(imgray);
% for i=1:m
%     for j=1:n
% %         disp(u(:,i*j));
%         midv=abs(v-f(i,j));
%         cenk=find(midv==min(midv));
%         f(i,j)=v(cenk);
%     end
% end
% subplot(1,2,2),imshow(uint8(f)),title('传统FCM分割结果');