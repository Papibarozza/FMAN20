function y = classify(x, classification_data)
%CLASSIFY Summary of this function goes here
%   Detailed explanation goes here

X = classification_data{1};
Y = classification_data{2};
pred = k_nearest_neighbour(x,X,Y,5);
if(sum(pred == 1) > length(pred)/2)
    y = 1;
else
    y = -1;
end

end

