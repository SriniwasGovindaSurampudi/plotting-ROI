function [ ind ] = nearest_neighbors( W,k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
ind = ones(size(W,1),k);
for i = 1 : size(W,1)
    [~,id] = sort(W(i,:),'descend');
    disp('ind size kshitij');
    disp(size(ind(i,:)));
    disp('id size pancholi');
    disp(size(id));
    disp(k);
    if k+1 <= size(id,2)
        
        ind(i,:) = id(2:(k+1))';
    end
end
end

