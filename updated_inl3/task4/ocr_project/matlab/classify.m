function y = classify(x, classification_data)
%CLASSIFY Summary of this function goes here
%   Detailed explanation goes here

X = classification_data{1};
Y = classification_data{2};
norm_factor = classification_data{3};
pred = k_nearest_neighbour(x./norm_factor,X,Y,5);
voters = most_common(pred);
if(length(voters)==1)
    y = voters;
else
    y = voters(randi(length(voters)));
end
assert(length(y) == 1, 'The output should only be one class label.')

