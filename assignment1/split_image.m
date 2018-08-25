function images = split_image( img )

    row = size(img, 1);
    col = size(img, 2);
    
    images = zeros(row/8 * col/8, 8, 8);
    
    for i=1:8:row
        for j=1:8:col
            indx = round(i/8)*floor(col/8) + floor(j/8 + 1);
            %display(indx);
            images(indx,:,:) = img(i:i+7,j:j+7);
        end
    end

end