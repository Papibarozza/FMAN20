x = 0:0.25:1;
y = 1:-0.25:0;
figure;
subplot(1,2,1)

f1 = (ones(1,length(y))-y)'*x
imshow(f1,'InitialMagnification','fit')
f2 =round((f1*256)./16)/16
subplot(1,2,2)
imshow(f2,'InitialMagnification','fit')

