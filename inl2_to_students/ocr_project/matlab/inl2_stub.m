datadir = '..\datasets\short1';

a = dir(datadir);

file = 'im1';

fnamebild = [datadir filesep file '.jpg'];
%fnamebild = '../datasets/short1/im1.jpg'
fnamefacit = [datadir filesep file '.txt'];

bild = imread(fnamebild);
fid = fopen(fnamefacit);
facit = fgetl(fid);
fclose(fid);

S = im2segment(bild);
BW = S{1};
%imshow(BW)
x = segment2features(BW)
acc = zeros(5,6);
for k = 1:1:5
    acc(k,:)= segment2features(S{k});
end
acc

