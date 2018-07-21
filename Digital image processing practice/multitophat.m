function fwth=multitophat(f,n)
fold=f;
b0=strel('disk',3);
for j=1:n
    f=imerode(f,b0);
end
for i=1:n
    f=imdilate(f,b0);
end
fwth=imsubtract(fold,f);