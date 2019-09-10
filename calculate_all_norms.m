data = load('assignment1bases.mat');
total_err = 0;
total_err2=0;
basis = data.bases{3};
for k = 1:400
    img = data.stacks{1}(:,:,k);
    img2 = data.stacks{2}(:,:,k);
    [proj, err] = project_img(img,basis);
    [proj2, err2] = project_img(img2,basis);
    total_err = total_err+err;
    total_err2 = total_err2+err2;
end

mean_err1 = total_err/400
mean_err2 = total_err2/400
%%
g=3;
base = data.bases{g};
for k = 1:4
    subplot(2,2,k)
    colormap(gray);
    imagesc((base(:,:,k)));
    title("b"+string(k));
end
saveas(gcf,"B"+string(g),'eps');
close all;
%%
g=2;
stack = data.stacks{g};
for k = 1:4
    subplot(2,2,k)
    colormap(gray);
    imagesc((stack(:,:,k)));
    title("img"+string(k));
end
saveas(gcf,"S"+string(g),'eps');


%%
ps=@(u,v) sum(sum(u.*v))/norm(v,'fro')^2
colormap(gray);
p1 = 1/3*[0 1 0;1 1 1;1 0 1;1 1 1];
p2 = 1/3*[1 1 1;1 0 1; -1 -1 -1; 0 -1 0];
p3 = 1/2*[1 0 -1; 1 0 -1; 0 0 0; 0 0 0];
p4 = 1/2*[0 0 0;0 0 0;1 0 -1;1 0 -1];
f = [-2 6 3;13 7 5; 7 1 8;-3 4 4];
imagesc(f)
coeffs = [ps(f,p1) ps(f,p2) ps(f,p3) ps(f,p4)]
projected_image = coeffs(1)*p1+coeffs(2)*p2+coeffs(3)*p3+coeffs(4)*p4
imagesc(projected_image)
error = norm(f-projected_image,'fro')
