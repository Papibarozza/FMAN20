x = 0:0.25:1;
y = 0:0.25:1;
figure;
subplot(1,2,1)

f = (ones(1,length(y))-y)'*x
imshow(f,'InitialMagnification','fit')
f =round((f*255)./16)/16
subplot(1,2,2)
imshow(f,'InitialMagnification','fit')

