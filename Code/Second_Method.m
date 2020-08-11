% Code with source code of function (fspecial)
clc;
clear;
close all;

originalimage=imread('try.jpg');

H =myfspecial([5 5],40,45); 
MotionBlur = imfilter(originalimage,H,'replicate');

subplot(1,2,1)
imshow(originalimage);
title('Original image');
subplot(1,2,2)
imshow(MotionBlur);
title('Blurred image');
sgtitle('Motion blurrring')

%%source code of special

function f=myfspecial(sze,len,angle)
    f = zeros(sze); %%sze default ([3 3])
	f(floor(len/2)+1,1:len) = 1;   

	f = imrotate(f,angle,'bilinear','loose');
	f = f/sum(f(:));
end
