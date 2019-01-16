
img = imread('w.JPG');
img = imresize(img, 0.2);
cform = makecform('srgb2lab'); 
imgLAB = applycform(img, cform); 
ab = double(imgLAB(:,:,2:3)); 
rows = size(ab,1);
cols = size(ab,2); 
ab = reshape(ab, rows*cols, 2); 
cluster = 2; 
tic;
[idx center] = kmeans(ab, cluster, 'distance', 'sqEuclidean', 'Replicates', 5); 
toc;
label = reshape(idx, rows, cols); 
figure; imshow(label, []); 
