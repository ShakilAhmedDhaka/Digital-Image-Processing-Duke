function img_compressed = compress_image( img, varargin )
    
    default_scale = 1;
    default_transform = 'dct';
    
    p = inputParser;
    addOptional(p,'scale',default_scale);
    addOptional(p,'transform',default_transform);
    parse(p,img,varargin{:});
    scale = p.Results.scale;
    transform = p.Results.transform;
    
    
    row = size(img,1);
    col = size(img,2);

    images = split_image(img);
    if strcmp(transform,'fft') == 1
        images_transformed = convert_fft(images);
    else
        images_transformed = convert_dct(images);
    end
    
    quantize_kernel = [16,11,10,16,24,40,51,61;...
    12,12,14,19,26,58,60,55;...
    14,13,16,24,40,57,69,56;...
    14,17,22,29,51,87,80,62;...
    18,22,37,56,68,109,103,77;...
    24,35,55,64,81,104,113,92;...
    49,64,78,87,103,121,120,101;...
    72,92,95,98,112,100,103,99;];


    quantize_kernel = quantize_kernel * scale;

    images_transformed_kernelized = zeros(size(images_transformed));
    for i=1:size(images_transformed,1)
        tim = zeros(8,8);
        tim(:,:) = images_transformed(i,:,:);
        images_transformed_kernelized(i,:,:) = floor(floor(tim ./ quantize_kernel) .* quantize_kernel);
    end
     
    if strcmp(transform, 'fft') == 1
        images_transform_reversed = reverse_fft(images_transformed_kernelized);
    else
        images_transform_reversed = reverse_dct(images_transformed_kernelized);
    end
    img_compressed = essemble_img(images_transform_reversed, row, col);
end