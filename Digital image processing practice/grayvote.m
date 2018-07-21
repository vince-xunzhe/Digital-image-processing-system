im=imread('02.tif');
imgray=rgb2gray(im);
f=im2uint8(imgray);
[m,n]=size(f);
vote=zeros(m,n);
figure(1),imshow(f);
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
figure,imshow(uint8(vote));
img=uint8(vote);
% j=wiener2(img,[3 3]);
% figure,imshow(j);
% h=[0 1 0;
%     1 0 1;
%     0 1 0];
% q=h/4;
% u=imfilter(img,q);
% figure,imshow(u);
% cc=medfilt2(img);
figure,imshow(cc);
%  gim=im2double(img);
% [Eim,Oim,Aim]=spatialgabor(gim,3,90,0.5,0.5,1);%90-vertical===0-horizontal
%  figure, imshow(uint8(Aim));
