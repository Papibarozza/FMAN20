data = load('heart_data.mat')
im = data.im;
%%
[mean(data.chamber_values) std(data.chamber_values)]
[mean(data.background_values) std(data.background_values)]
norm_chmbr = -log10(normpdf(im,mean(data.chamber_values),std(data.chamber_values)));
norm_bg = -log10(normpdf(im,mean(data.background_values),std(data.background_values)));
T = sparse([norm_chmbr(:) norm_bg(:)]);
%%
lambda = 3;
I = double(im)/255;
[M N] =size(I);
n = M*N; %
Neighbors = edges4connected(M,N);
i=Neighbors(:,1);
j=Neighbors(:,2);
A = sparse(i,j,lambda,n,n);
tic
[E Theta] = maxflow(A,T);
Theta = reshape(Theta,M,N);
Theta = double(Theta);
toc

imshow(Theta)

[rows,cols] = find(Theta == 1);
L = bwlabel(Theta,8);
[IDX, C] = kmeans([cols rows],3);
[p1,p2]= closest_points(C);

lab_p1 =  L(uint8(p1(1)),uint8(p1(2)));
lab_p2 =  L(uint8(p2(1)),uint8(p2(2)));
new = (L==lab_p1)+(L==lab_p2);
imshow(im)
hold on;
visboundaries(new,'LineStyle',':','LineWidth',2,'Color','g')


