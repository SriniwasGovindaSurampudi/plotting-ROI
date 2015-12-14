function [  ] = plot_roi( coord_mat,ind,d )% 192*3 , 192*5
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% idx = randperm(dim);
% coord_mat = coord_mat(idx,:)
% W = similarity(coord_mat(1:d,1:3));
% ind = nearest_neighbors(W,min(d,5));
scatter3(coord_mat(:,1),coord_mat(:,2),coord_mat(:,3),0.5,[rand(1),rand(1),rand(1)]);
join_voxels(coord_mat,ind,min(d,5));%% 192*3 , 192*5, 5
end

