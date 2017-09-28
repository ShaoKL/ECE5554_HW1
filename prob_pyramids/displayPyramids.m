function displayPyramids(G, L)
% Displays intensity and fft images of pyramids
% assumes the FIRST element in the G, L array is the original image
% also assumes that the images are not the same size and are presented in
% the following order: original, original/2, original/4, original/8, etc..

g_length = (size(G));
g_length = g_length(2);
im = G{1,1};
[height, width] = size(im);
new_frame = zeros(height, width * g_length, 'single');

curr_x = 1;

for i = 1:g_length
    im = G{1,i};
    % up-sample the image as necessary
    for j=1:(i-1)
        im = upsample(im);
    end
    
    % now add the image to the new frame
    xs = curr_x;
    xe = curr_x + width - 1;
    new_frame(1:height,xs:xe) = im(1:height,1:width);
    curr_x = curr_x + width;
end

imwrite(new_frame, 'GPyramid.jpg', 'quality', 100);


end