function [  ] = join_voxels( coord_mat, ind, k)%% 192*3 , 192*5, 5
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    if size(coord_mat,1) == size(ind,1)
        for i = 1 : size(coord_mat,1)
            x1 = coord_mat(i,1)*ones(k,1);
            y1 = coord_mat(i,2)*ones(k,1);
            z1 = coord_mat(i,3)*ones(k,1);
            x2 = coord_mat(ind(i,:),1);
            y2 = coord_mat(ind(i,:),2);
            z2 = coord_mat(ind(i,:),3);
            line([x1;x2],[y1;y2],[z1;z2],'color',[1 1 0])
        end
    else
        disp('size does not match');
    end
    

end

