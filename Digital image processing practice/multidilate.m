function b=multidilate(f,k)
fold=f;
b0=strel('disk',3);
[m,n]=size(f);
argpixels=zeros(1,20);
argpixels1=zeros(1,20);
argpixels2=zeros(1,20);
argdwth=zeros(1,20);
argdbth=zeros(1,20);
for i=1:20
    f=mutiltophat(fold,i);
    argpixels(i)=imarg(f);
end
fwr=max(argpixels);
for i=1:20
    f1=imbothat(f1,b0);
    argpixels1(i)=imarg(f1);
end
fbr=max(argpixels1);



    
