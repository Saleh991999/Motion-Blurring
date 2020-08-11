function f=myfspecial(sze,len,angle)
   %Parameters of Motion Blurring
   %H=myfspecial(sze,len,angle)
   %this function returns a filter to approximate, once convolved with an image, the linear motion of a camera
   %this function has three inputs:
   %sze is a vector of two elements and the default value ([3 3])
   %len specifies the length of the motion
   %angle specifies the angle of motion in degrees in a counter-clockwise direction
    if nargin ==2
        error('Not enough input arguments please enter three inputs(enter help for myfspecial)');
    else
  f = zeros(sze);
	f(floor(len/2)+1,1:len) = 1;   
	f = imrotate(f,angle,'bilinear','loose');
	f = f/sum(f(:)); 
    end
end