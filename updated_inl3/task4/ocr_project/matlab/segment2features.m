function features = segment2features(BW)
s = regionprops(BW,'centroid');
s = cat(1,s.Centroid);
x_center = round(s(:,1));
BW = BW(:,(x_center-20):x_center+20); %Crop to normalize position and decrease image to process.
f = regionprops(BW,{'Perimeter','MajorAxisLength','Eccentricity','MinorAxisLength','ConvexArea','Solidity'});
features = [f.Perimeter f.MajorAxisLength f.Eccentricity f.MinorAxisLength f.ConvexArea f.Solidity];