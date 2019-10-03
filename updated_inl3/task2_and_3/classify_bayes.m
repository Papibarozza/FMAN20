function y = classify_bayes(x, classification_data)
    mu_1 = classification_data{1}';
    mu_2 = classification_data{2}';
    cov_1= classification_data{3}'./100;
    cov_2 = classification_data{4}'./100;
    [argvalue, argmax] = max([mvnpdf(x,mu_1,cov_1) mvnpdf(x,mu_2,cov_2)]);
    if(argmax == 2)
       y = 1;
    else
       y = -1;
    end
    y = [mvnpdf(x,mu_1,cov_1) mvnpdf(x,mu_2,cov_2)]
end

