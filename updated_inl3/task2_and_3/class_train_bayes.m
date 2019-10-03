function classification_data = class_train_bayes(X, Y)
% IMPLEMENT TRAINING OF YOUR CHOSEN MACHINE LEARNING MODEL HERE
class1_data = X(:,Y == -1);
class2_data = X(:,Y == 1);

class1_cov = cov(class1_data');
class2_cov = cov(class2_data');

mean_class1 = mean(class1_data,2);
mean_class2 = mean(class2_data,2);
classification_data = {mean_class1 mean_class2 diag(class1_cov) diag(class2_cov)};
end

