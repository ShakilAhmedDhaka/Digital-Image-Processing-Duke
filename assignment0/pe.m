im_dir = '../assets';
im_color = imread(fullfile(im_dir, 'lenna.png'));
im = rgb2gray(im_color);   
imshow(im);

pw = 6;


im_new = floor(im / 2^(8-pw+1));
im_new = im_new * 2^(8-pw+1);

imshow(im_new);