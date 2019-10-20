function [most_common_elements] = most_common(x)
x = double(x);
m = mode(x);    % ->   m=1
occurence = sum(x==m);
x(x==m) = NaN ;
most_common_elements = [m];
same_mode = m;
while(1==1)
    new_mode = mode(x);
    new_occurence = sum(x==new_mode);
    if (new_occurence < occurence )
        break
    else
        most_common_elements = [most_common_elements new_mode];
        x(x==new_mode) = NaN ;
    end
   
end
  
end