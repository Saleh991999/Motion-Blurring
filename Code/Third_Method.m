clc;
clear ;
close all;
%%input
Originalimage=imread('try.jpg') ;
%%process
H=myfspecial([5 5],60,45);    %%Define the parameters of blurring

R = Originalimage(:, :, 1);
G = Originalimage(:, :, 2);                 % Extract colours from image as conv2 (2D) CAN'T DEAL WITH 3 coulrs
B = Originalimage(:, :, 3) ;      

bluredR = conv2(R,H);       %Conv2D with every colour 
bluredG = conv2(G, H);
bluredB = conv2(B, H);

% REcombine colours to get RGB photo .
MotionBlur = cat(3, bluredR, bluredG, bluredB);
MotionBlur= uint8(MotionBlur);
%%output
subplot(1,2,1);
imshow(Originalimage);
title('Original image');
subplot(1,2,2);
imshow(MotionBlur);
title('Blurred image');
sgtitle('Motion blurrring');
imwrite(MotionBlur,'the blurred image.jpg');


function f=myfspecial(sze,len,angle)
    f = zeros(sze);                        %%sze default ([3 3])
	f(floor(len/2)+1,1:len) = 1;   

	f = imrotate(f,angle,'bilinear','loose');
	f = f/sum(f(:));
end