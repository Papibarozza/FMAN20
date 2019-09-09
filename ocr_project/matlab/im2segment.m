%function [S] = im2segment(im)
% [S] = im2segment(im)

%I = imread('..\datasets\short1\im9.jpg');
I = im10;
%imshow(I);
BW = (I<130);
%imshow(double(BW))
cut = 50;
first = [BW(:,1:cut) zeros(31,461-cut)]
figure(1)
imshow(double(BW(:,1:cut)))
figure(2)
segment = uint8(first).*double(im10;
imshow(double(segment))