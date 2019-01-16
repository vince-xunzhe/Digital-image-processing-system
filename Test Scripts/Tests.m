clc;
clear;
close all;

tic;
img = imread('z.JPG');
%img = imread('Urben Sombrero.JPG');
img = imresize(img, 1);

R=img(:,:,1);%R
B=img(:,:,3);%B
I_A = R-B;
bw = imbinarize(I_A, 'global');

se = strel('disk',15);
openbw = imclose(bw,se);
toc;

figure,
subplot(1,3,1),imshow(I_A);title('R-B');
subplot(1,3,2),imshow(bw),title('Binarized');
subplot(1,3,3),imshow(openbw),title('Close');



% windowSize = 3;
% sigma = 1;
% gausFilter = fspecial('gaussian', [windowSize,windowSize], sigma);
% img= imfilter(img, gausFilter, 'replicate');
% 
% Lab = colorspace('RGB->Lab',img);
% Luv = colorspace('RGB->Luv',img);
% 
% figure,subplot(1,4,1), imshow(img);title('RGB Colorspace');
% subplot(1,4,2),imshow(img1(:,:,1));title('Channel 1');
% subplot(1,4,3),imshow(img1(:,:,2));title('Channel 2');
% subplot(1,4,4),imshow(img1(:,:,3));title('Channel 3');
% 
% figure,subplot(1,4,1), imshow(img);title('Lab Colorspace');
% subplot(1,4,2),imshow(Lab(:,:,1));title('Channel 1');
% subplot(1,4,3),imshow(Lab(:,:,2));title('Channel 2');
% subplot(1,4,4),imshow(Lab(:,:,3));title('Channel 3');
% 
% figure,subplot(1,4,1), imshow(img);title('Luv Colorspace');
% subplot(1,4,2),imshow(Luv(:,:,1));title('Channel 1');
% subplot(1,4,3),imshow(Luv(:,:,2));title('Channel 2');
% subplot(1,4,4),imshow(Luv(:,:,3));title('Channel 3');

