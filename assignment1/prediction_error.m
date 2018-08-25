function pred_err = prediction_error(img, varargin)
    
    
    default_pred_range = 'left_pixel';
    default_coeff = 1;
    p = inputParser;
    addOptional(p, 'pred_range', default_pred_range);
    parse(p,img,varargin{:});
    pred_range = p.Results.pred_range;
    
    
    row = size(img,1);
    col = size(img,2);
    pred_img = uint8(zeros(size(img)));
    %if strcmp(pred_range, 'left_pixel') == 1
    pred_img(:,2:col) = img(:,1:col-1);
    %end
    
    pred_err = img - pred_img;
    
end