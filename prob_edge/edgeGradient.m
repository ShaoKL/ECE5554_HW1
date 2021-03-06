function bmap = edgeGradient(im);
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

sigma = 1;
[mag, thetas] = gradientMagnitude(im,sigma);
[rows, cols] = size(mag);

figure(); imshow(mag);

bmap = nonmax(mag,thetas);

% NOTE: must deal with edge cases later
% for x = 2:rows-1
%     for y = 2:cols-1
%         theta = thetas(x,y);
%         
% %         cp = mag(x,y);  % current pixel
% %         pp = 0.0;       % pixel in positive direction
% %         np = 0.0;       % pixel in negative direction
%         
% %         if theta < 0
% %             theta = -1 * theta;
% %         end
% %         
% %         if theta >= 0.0 && theta < pi/4
% %             theta = theta * 2;
% %             pp = cos(theta)*mag(y,x+1) + sin(theta)*mag(y+1,x+1);
% %             theta = theta - 2*pi;
% %             np = cos(theta)*mag(y,x-1) + sin(theta)*mag(y-1,x-1);
% %         elseif theta >= pi/4 && theta < pi/2
% %             theta = theta * 2;
% %             pp = sin(theta)*mag(y+1,x+1) -cos(theta)*mag(y+1,x);
% %             theta = theta - 2*pi;
% %             np = sin(theta)*mag(y-1,x-1) -cos(theta)*mag(y-1,x);
% %         elseif theta >= pi/pi && theta < 0.75*pi
% %             theta = theta * 2;
% %             pp = -cos(theta)*mag(y+1,x) - sin(theta)*mag(y+1,x-1);
% %             theta = theta - 2*pi;
% %             np = -cos(theta)*mag(y-1,x) - sin(theta)*mag(y-1,x+1);
% %         elseif theta >= 0.75*pi && theta <= pi
% %             theta = theta * 2;
% %             pp = -sin(theta)*mag(y+1,x-1) + cos(theta)*mag(y,x-1);
% %             theta = theta - 2*pi;
% %             np = -sin(theta)*mag(y-1,x+1) + cos(theta)*mag(y,x+1);
% %         else
% %             disp('edgeGradient: theta not accepted.');
% %         end
%         
% %         theta = round(theta / (pi/4)) * (pi/4);
% %         theta = int32(round(theta,2)*10);
% %         zero = 0;
% %         pi_4 = int32(round(pi/4,2)*10);
% %         pi_2 = int32(round(pi/2,2)*10);
% %         pi_34 = int32(round(3*pi/4,2)*10);
% %         pii = int32(round(pi)*10);
% %         if theta == zero
% %             pp = mag(y,x+1);
% %             np = mag(y,x-1);
% %         elseif theta == pi_4
% %             pp = mag(y+1,x+1);
% %             np = mag(y-1,x-1);
% %         elseif theta == pi_2
% %             pp = mag(y+1,x);
% %             np = mag(y-1,x);
% %         elseif theta == 3pi_4
% %             pp = mag(y+1,x-1);
% %             np = mag(y,x-1);
% %         elseif theta == pii
% %             pp = mag(y,x-1);
% %             np = mag(y,x+1);
% %         elseif theta == -pi_4
% %             pp = mag(y-1,x+1);
% %             np = mag(y+1,x-1);
% %         elseif theta == -pi_2
% %             pp = mag(y-1,x);
% %             np = mag(y+1,x);
% %         elseif theta == -pi_34
% %             pp = mag(y-1,x-1);
% %             np = mag(y+1,x+1);
% %         elseif theta == -pii
% %             pp = mag(y,x-1);
% %             np = mag(y,x+1);
% %         else
% %             disp('edgeGradient: theta not accepted.');
% %             theta
% %         end
% %             
% %         
% %         
% %         
% %         if cp > pp && cp > np
% %             bmap(x,y) = 0;
% %         end
%         
%         
%         
%         
% %         elseif theta >= -pi && theta < -0.75*pi
% %         elseif theta >= -0.75*pi && theta < -pi/2
% %         elseif theta >= -pi/2 && theta < -pi/4
% %         elseif theta >= -pi/4 && theta < 0.0
%                     
%         
%         
%         
%         
%         
%     end
% end



end

