function images_dct = convert_dct( images )
% convert each image in the image matrix to dct

    images_dct = zeros(size(images,1),8,8);
    for i=1:size(images,1)
        tim = zeros(8,8);
        tim(:,:) = images(i,:,:);
        images_dct(i,:,:) = floor(dct2(tim));
    end
end