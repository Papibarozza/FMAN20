x = 0:0.25:1;
y = 0:0.25:1;
f = (ones(1,length(y))-y)'*x
f =round((f*255)./16)/16
show(f)
