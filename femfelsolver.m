imgs = load("femfel");
im1 = imgs.femfel1;
im2 = imgs.femfel2;
diff = abs(imgaussfilt(im1,4)-imgaussfilt(im2,4));
%s = 20
%mean_filt = cat(3,ones(s,s),ones(s,s),ones(s,s))./s^2;
%diff = imfilter(diff,mean_filt);
imagesc(diff)
%%
th = 70;
r_im = diff(:,:,1) > th;
b_im = diff(:,:,2) > th;
g_im = diff(:,:,3) > th;
threshed = bitor(bitor(r_im,g_im),b_im);
[rows,cols] = find(threshed == 1);
[IDX, C] = kmeans([cols rows],5);
%%
imshow(im1)
hold on;
for i = 1:5
    rectangle('Position',[C(i,:)-40 80 80],'EdgeColor','g','LineWidth',3)
end


