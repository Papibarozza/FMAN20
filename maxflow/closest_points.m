function [p1,p2,idx1,idx2] = closest_points(coords)
nmbr_points = size(coords,1);
prevdist = 100000;
for i = 1:nmbr_points
    p_curr = coords(i,:);
    for j = 1:nmbr_points
        if( (i==j) == 0)
            p_comp = coords(j,:);
            dist = norm((p_curr-p_comp),2);
            if(dist < prevdist)
                prevdist = dist;
                p1 = p_curr;
                p2 = p_comp;
                idx1 = i;
                idx2  = j;
            end
        end
    end
end

end

