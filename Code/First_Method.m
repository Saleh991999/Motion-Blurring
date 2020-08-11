% Code with ready functions

clc;
clear;
close all;

Originalimage=imread('try.jpg');

H = fspecial('motion',40,45); %define the parameters of the Motion Blurring(len,angle)
%defaults: len=9 , angle=0

MotionBlur = imfilter(Originalimage,H,'replicate'); %do motion blurring for image

subplot(1,2,1)
imshow(Originalimage);
title('Original image');
subplot(1,2,2)
imshow(MotionBlur);
title('Blurred image');
sgtitle('Motion blurrring')
