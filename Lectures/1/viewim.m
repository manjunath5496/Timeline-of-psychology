function viewim (im, q )
%viewim(im, [q]) displays an image within a given quantile of its dynamic
%range
%
%   viewim(im) == view_hdr(im, .025)
%   viewim(im, q) where q is a scaler == view_hdr(im, [q 1-q])
%   viewim(im, [qmin qmax]) scales the image within the quantiles

%% Parse input
if nargin == 1
    q = 0.025;
end
if length(q) == 1
    q(2) = 1-q(1);
end

%% Find quantiles and values
range = im(isfinite(im(:)));

val = quantile(range, q(1:2));

im = max(im, val(1));
im = min(im, val(2));

%% Scale and show
im = (im-val(1))/(val(2)-val(1));

imshow(im);
end
