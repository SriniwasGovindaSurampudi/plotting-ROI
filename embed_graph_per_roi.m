function [  ] = embed_graph_per_roi( W, coord,original )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%coord = coord';
figure(original)
for j = 1 : size(W,1)
    ind = find(~isnan(W(j,:)) & (W(j,:) > 0));
    x1 = coord(j,1)*ones(length(ind),1);
    y1 = coord(j,2)*ones(length(ind),1);
    z1 = coord(j,3)*ones(length(ind),1);
    x2 = coord(ind,1);
    y2 = coord(ind,2);
    z2 = coord(ind,3);
    line([x1;x2],[y1;y2],[z1;z2],'color',[0.5,0.5,0.5,0.25]);
end

end

