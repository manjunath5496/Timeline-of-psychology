function out = filterim( im, s )
%out = filterim(im, s) returns im convolved with a gaussian of std s,
%without image border artifacts

% Prellocates data
out = zeros(size(im));

% Gaussian filter with size(round(6*STD)), STD = s
filt = fspecial('gaussian', round(6*s), s); % Automatically sums to 1

% Filter using imfilter (image processing toolbox) using the 'replicate'
% flag.  this pads the image with mirror-image pixels to avoid image border
% artifacts
for rgb = 1:size(im, 3)
    out(:, :, rgb) = imfilter(im(:, :, rgb), filt, 'replicate');
end

end