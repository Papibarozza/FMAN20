datadir = '../datasets/home3';
name = '/im1.jpg'
im = imread([datadir name]);
imshow(im);
seg = im2segment(imgaussfilt(im,0.5));
seg1 = seg{1};
figure
imshow(seg1)
