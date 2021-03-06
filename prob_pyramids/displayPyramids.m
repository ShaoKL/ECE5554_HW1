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

% initialize fft data %
fft = {};

for i = 1:g_length
    im = G{1,i};
    % up-sample the image as necessary
    for j=1:(i-1)
        im = upsample(im);
    end
    
    fft{i} = return_fft(im);
    
    % now add the image to the new frame
    xs = curr_x;
    xe = curr_x + width - 1;
    new_frame(1:height,xs:xe) = im(1:height,1:width);
    curr_x = curr_x + width;
end

% compute and write fft image %
[fft_h, fft_w, fft_d] = size(fft{1,1});
fft_frame = zeros(fft_h, fft_w * g_length, 3, 'single');
for i = 1:g_length
    im = fft{1,i};
    % perform zooming %
    for j = 1:(i-1)
        im = zoom_and_crop(im);
    end
    im = imresize(im, [fft_h,fft_w]);
    
    fft_frame(1:fft_h,1+fft_w*(i-1):i*fft_w,1:3) = im;
end


imwrite(new_frame, 'GPyramid.jpg', 'quality', 100);
imwrite(fft_frame, 'G_fft.jpg', 'quality', 100);


curr_x = 1;

fft = {};

for i = 1:g_length
    im = L{1,i};
    im = im + 0.5;  % used to add lighting so we can actually see the image
    % up-sample the image as necessary
    for j=1:(i-1)
        im = upsample(im);
    end
    
    fft{i} = return_fft(im);
    
    % now add the image to the new frame
    xs = curr_x;
    xe = curr_x + width - 1;
    new_frame(1:height,xs:xe) = im(1:height,1:width);
    curr_x = curr_x + width;
end

[fft_h, fft_w, fft_d] = size(fft{1,1});
fft_frame = zeros(fft_h, fft_w * g_length, 3, 'single');
for i = 1:g_length
    im = fft{1,i};
    
    % perform zooming %
    for j = 1:(i-1)
        im = zoom_and_crop(im);
    end
    im = imresize(im, [fft_h,fft_w]);
    fft_frame(1:fft_h,1+fft_w*(i-1):i*fft_w,1:3) = im;
end

imwrite(new_frame, 'LPyramid.jpg', 'quality', 100);
imwrite(fft_frame, 'L_fft.jpg', 'quality', 100);


end