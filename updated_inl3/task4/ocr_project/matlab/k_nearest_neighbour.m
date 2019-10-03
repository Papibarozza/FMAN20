function prediction = k_nearest_neighbour(x, X_train,Y,k)
class_norm = size(X_train,2);
for i = 1:1:size(X_train,2)
    class_norm(i) = norm(X_train(:,i)-x);
end
[val ind] = sort(class_norm,'ascend');
prediction = Y(ind(1:5));
    
end

