function images_fft = convert_fft( images )
% convert each image in the image matrix to dct

    images_fft = zeros(size(images,1),8,8);
    for i=1:size(images,1)
        tim = zeros(8,8);
        tim(:,:) = images(i,:,:);
        images_fft(i,:,:) = floor(fft2(tim));
    end
end