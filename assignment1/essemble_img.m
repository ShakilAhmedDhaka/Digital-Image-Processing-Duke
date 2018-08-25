function img_essembled = essemble_img( images, row, col )
% esssemble previous splitted up image segements back to whole image

    img_essembled = zeros(row, col);
    for k=1:size(images,1)
        j = (rem(k,col/8)-1)*8 + 1;
        if j < 0
            j = (floor(col/8) - 1) * 8 + 1;
        end
        i = floor((k-1)/(row/8))*8 +1;
        img_essembled(i:i+7, j:j+7) = images(k,:,:);
        %fprintf("%d %d %d\n", i, j, k);
    end

end