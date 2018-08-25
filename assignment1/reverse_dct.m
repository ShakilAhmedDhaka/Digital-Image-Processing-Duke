function img_output = reverse_dct( img )
% reverse the dct, make the negetive values zero and round the result and then convert uint8

    img_output = zeros(size(img));
    for i=1:size(img,1)
        tim = zeros(8,8);
        tim(:,:) = img(i,:,:);
        tim = floor(idct2(tim));
        tim = max(0, tim);
        img_output(i,:,:) = uint8(tim);
    end

end