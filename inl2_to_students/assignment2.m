f = [1 4 6 8 7 5];
g = @(x,i)(i+1-x)/i
g(2,1)

%%
class1 = [0.4003,0.3988,0.3998,0.3997,0.4010,0.3995,0.3991];
class2 = [0.2554,0.3139,0.2627,0.3802,0.3287,0.3160,0.2924];
class3 = [0.5632,0.7687,0.0524,0.7586,0.4243,0.5005,0.6769];
classes = {class1,class2,class3}

%for i=[1,2,3]
    %scatter(classes{i}(1:4),zeros(1,4),[],i*0.3*ones(1,4),'filled','d');
    %scatter(classes{i}(5:end),zeros(size(classes{i}(5:end))),[],i*0.3*ones(1,3));
    %hold on;
%end
%%
%Gaussian classifier
correctly_classified = 0
for i = 1:1:3
    for j = 1:1:7
        x = classes{i}(j);
        clf_probability = [normpdf(x,0.4,0.01) normpdf(x,0.3,0.05) normpdf(x,0.5,0.2)];
        [argvalue, argmax] = max(clf_probability);
        if(argmax == i)
            correctly_classified=correctly_classified+1;
        end
    end
end
correctly_classified/21
%%


