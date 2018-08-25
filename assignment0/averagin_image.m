im = rgb2gray(imread('../assets/lenna.png'));
new_im = im;
wsize = 20;

k = ones(wsize, wsize);

for i=1:size(im,1) - wsize+1
    for j=1:size(im,2) - wsize+1
        patch = im(i:i+wsize-1,j:j+wsize-1);
        sm = sum(sum((double(patch) .* k))) ;
        avg = sm / sum(k(:));
        new_im(i+floor(wsize/2),j+floor(wsize/2)) = avg;
    end
end


imshow(new_im);
%%
imshow(imrotate(im, 90));