function [ projected_image,error_norm ] = project_img( image,basis )

%PROJECT_IMG Accepts an image and a basis tensor and returns the projected
%image unto this basis and the error norm between the image and its
%projection.

proj_scalar=@(u,v) sum(sum(u.*v))/norm(v,'fro');
b1 = basis(:,:,1);
b2 = basis(:,:,2);
b3 = basis(:,:,3);
b4 = basis(:,:,4);
coefficients = [ proj_scalar(image,b1) proj_scalar(image,b2) proj_scalar(image,b3) proj_scalar(image,b4)];
%Unreadable line thanks to matlab.. However, it maps the image matrix on
%the coefficients so we get the image's projection on each base matrix.
%Then we sum them to get the final projection.
projected_image = sum(bsxfun(@times,basis,reshape(coefficients,1,1,numel(coefficients))),3);
error_norm = norm(image-projected_image,'fro');

end

