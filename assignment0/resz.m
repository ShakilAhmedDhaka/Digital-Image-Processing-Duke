im = double(rgb2gray(imread('../assets/lenna.png')));
wsize = 3;

row = floor(size(im,1)/3);
col = floor(size(im,2)/3);
new_im = ones(row,col);

for i=1:row
    for j=1:col
        upper_i = (i-1)*wsize + 1;
        lower_i = upper_i + wsize - 1;
        left_j = (j-1)*wsize + 1;
        right_j = left_j  + wsize - 1;
        patch = im(upper_i:lower_i, left_j:right_j);
        sm = sum(sum(patch));
        avg = sm / (wsize*wsize);
        new_im(i,j) = avg;
    end
end

imshow(new_im, []);