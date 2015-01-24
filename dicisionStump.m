function [emin, thresh_indx, h_opt] = dicisionStump(trainX,trainY,threshold,u)
    len = length(trainY);
    
    S=[-1,1];
    emin=1; thresh_indx = [1,1,1,1];
    h_opt = trainY;
    for i = 1:len
        for j = 1:2
            for s = 1:2 
            thresh = threshold(i,j);
            h = S(s)*sign(trainX(:,j) - thresh);
            e = sum((h ~= trainY).*u);
            if e < emin
                emin = e;
                thresh_indx = [i,j,thresh,s];
                h_opt = h;
            end
            end
        end
    end
    
end