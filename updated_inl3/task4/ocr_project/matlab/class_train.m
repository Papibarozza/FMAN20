function classification_data = class_train(X, Y)
%CLASS_TRAIN Summary of this function goes here
%   Detailed explanation goes here
max_features = max(X,[],2);
X = X./max_features; %normalize
classification_data = {X Y max_features};
end