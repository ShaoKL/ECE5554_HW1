function [mag, theta] = gradientMagnitude(im, sigma)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

% smooth image first
filter = fspecial('Gaussian', sigma*4+1, sigma);
im = imfilter(im, filter);

% initialize some variables used later
[ height, width, depth ] = size(im);
gradients = zeros(height,width,depth,2, 'single');

% first compute x and y gradients for each pixel for each r,g,b value
for color = 1:depth % REMINDER: CHANGE TO :depth
    gradients(1:height,1:width,color,1) = gauss_deriv_filter(im(1:height,1:width,color),sigma,'x', 0, 1);
    gradients(1:height,1:width,color,2) = gauss_deriv_filter(im(1:height,1:width,color),sigma,'y', 0, 1);
end

%  You will have Rx, Gx, Bx, take the L2-norm of them, you will get the x-gradient 
%  of this pixel. And then you do this for y-gradient.

new_gradients = zeros(height,width,2);
% x direction
for color = 1:depth
    new_gradients(1:height,1:width,1) = new_gradients(1:height,1:width,1) + gradients(1:height,1:width,color,1) .^ 2;
end
new_gradients(1:height,1:width,1) = new_gradients(1:height,1:width,1) .^ (0.5);
% y direction
for color = 1:depth
    new_gradients(1:height,1:width,2) = new_gradients(1:height,1:width,2) + gradients(1:height,1:width,color,2) .^ 2;
end
new_gradients(1:height,1:width,2) = new_gradients(1:height,1:width,2) .^ (0.5);

% finally, compute the mag and theta for each pixel
mag = zeros(height,width,'single');
theta = zeros(height,width,'single');
for row = 1:height
    for col = 1:width
        x = new_gradients(row,col,1);
        y = new_gradients(row,col,2);
        
        mag(row,col) = sqrt(x^2+y^2);
        theta(row,col) = atan2(-y,x);
    end
end








end

