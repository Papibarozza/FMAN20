function [S] = im2segment(im)
% [S] = im2segment(im)

nrofsegments = 5;
m = size(im,1)
n = size(im,2)
im_segment = imcomplement(im(:,1:50));
segment_width = 30;
S{1} = [imcomplement(im(:,1:50)) zeros(m,n-50)]
for k = 2:(nrofsegments)
    figure(k);
    padding_left=50+(k-2)*segment_width;
    padding_right=n-(padding_left+segment_width)-1;
    im_segment = [zeros(m,padding_left) imcomplement(im(:,padding_left:padding_left+segment_width)) zeros(m,padding_right)]./255;
    show(uint8(im_segment))
    S{k}= im_segment
end
