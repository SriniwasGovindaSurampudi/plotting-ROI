function [ coord_mat ] = coordinates( name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 V_hdr = spm_data_hdr_read(name);
 coord_mat = [];
 for z = 1 : V_hdr.dim(3)
     V_data = spm_data_read(V_hdr,'slice',z);
     
     [x,y] = find(V_data > 0);
     if(~isempty(x))
         v = zeros(length(x),1);
         % pixel value in v
         for i = 1 : length(x)
            v(i) = V_data(x(i),y(i));
         end
         coord_mat = [coord_mat;[x,y,z*ones(length(x),1),v]];
     end
 end
coord_mat = coord_mat + [0.5*randn(size(coord_mat,1),3),zeros(size(coord_mat,1),1)];
end

