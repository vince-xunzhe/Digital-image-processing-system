clear;
clc;

A = rgb2gray(imread('1.JPG'));
B = rgb2gray(imread('2.JPG'));
figure, imshowpair(A,B);

%optimizer.InitialRadius = 0.009;
%optimizer.Epsilon = 1.5e-4;
%optimizer.GrowthFactor = 1.01;
%optimizer.MaximumIterations = 300;

[optimizer, metric] = imregconfig('multimodal')

B_ = imregister(B, A, 'affine', optimizer, metric);
figure, imshowpair(B_, A);
title('Default registration');

optimizer.InitialRadius = optimizer.InitialRadius/3.5;
movingRegisteredAdjustedInitialRadius = imregister(B, A, 'affine', optimizer, metric);
figure, imshowpair(movingRegisteredAdjustedInitialRadius, A);
title('Adjusted InitialRadius');

optimizer.MaximumIterations = 300;
movingRegisteredAdjustedInitialRadius300 = imregister(B, A, 'affine', optimizer, metric);
figure, imshowpair(movingRegisteredAdjustedInitialRadius300, A);
title(' Adjusted InitialRadius, MaximumIterations.');

tformSimilarity = imregtform(B, A, 'similarity', optimizer, metric);
Rfixed = imref2d(size(A));
movingRegisteredRigid = imwarp(B,tformSimilarity,'OutputView',Rfixed);
figure, imshowpair(movingRegisteredRigid, A);
title('Registration based on similarity transformation model.');

movingRegisteredAffineWithIC = imregister(B,A,'affine',optimizer,metric,'InitialTransformation',tformSimilarity);
figure, imshowpair(movingRegisteredAffineWithIC,A);
title('Registration from affine model based on similarity initial condition.');



