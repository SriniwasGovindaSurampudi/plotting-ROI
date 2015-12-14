function [ W_k ] = similarity( coord )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[v_1_x,v_1_y] = meshgrid(coord(:,1),coord(:,1));
[v_2_x,v_2_y] = meshgrid(coord(:,2),coord(:,2));
[v_3_x,v_3_y] = meshgrid(coord(:,3),coord(:,3));
W = (v_1_x - v_1_y).^2 + (v_2_x - v_2_y).^2 + (v_3_x - v_3_y).^2;
W(W == 0) = inf; W = exp(-W/25);
W_gauss = W;
% knn adjacency matrix
W_k = zeros(size(W_gauss));
k = round(log(size(W,1)));
[knn_idx,~] = knnsearch(coord,coord,'k',k+1);
for i =1:size(coord,1)
    for j = 2:k
        id = knn_idx(i,j);
        W_k(i,id) =  W_gauss(i,id);
    end
end
% ensures symmetry of neighbors
for i = 1 : size(W_k,1)
    for j = i+1 : size(W_k,2)
        if(~((W_k(i,j) ~= 0) && (W_k(j,i) ~= 0)))
            W_k(i,j) = W_k(i,j) + W_k(j,i);
            W_k(i,j) = W_k(j,i);
        end
    end
end
end

