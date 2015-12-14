close
clear
clc
addpath(genpath('/Users/govinda/Desktop/IIIT_H/I_Semester/RAship/RA_project/Cognitive_Science/fMRI/softwares/spm12'));
addpath(genpath('/Users/govinda/Desktop/IIIT_H/I_Semester/RAship/RA_project/project'));
addpath(genpath('/Users/govinda/Desktop/IIIT_H/I_Semester/RAship/RA_project/Spectral_Analysis/Heat_Kernels/codes'));
directory = dir('/Users/govinda/Desktop/IIIT_H/I_Semester/RAship/RA_project/Cognitive_Science/fMRI/Functional_ROIs/*.nii');
cd /Users/govinda/Desktop/IIIT_H/I_Semester/RAship/RA_project/Cognitive_Science/fMRI/Functional_ROIs/
total_voxels = 0;
coordinates_all = [];
Coordinates_mean = zeros(size(directory,1),4);
ROI_data = cell(3,size(directory,1));
all_rois=figure;
meants_file = csvread('./all_90_ts.csv');
meants_file = meants_file(:,1:127);
%for time = 1 : 127
figure(all_rois);
for i = 1 : size(directory,1)
    coord_mat = coordinates(directory(i).name);    
    dim = size(coord_mat,1);
    idx = randperm(dim);
    coord_mat = coord_mat(idx,:);
    ROI_data{1,i} = coord_mat;
    
    dim = round(dim/5);
    coord = coord_mat(1:dim,:);
    Coordinates_mean(i,:) = mean(coord);
    ROI_data{2,i} = coord;
    coordinates_all = [coordinates_all;ROI_data{2,i}];

    W = similarity(coord(:,1:3));
    ROI_data{3,i} = W;
    total_voxels = total_voxels + size(coord_mat,1);
    colour = [rand(1),rand(1),rand(1)];
 
%     scatter3(coord(:,1),coord(:,2),coord(:,3),10,colour,'filled');
%     hold on
end
s = size(coordinates_all,1);
idx = randperm(s);
coordinates_all = coordinates_all(idx,:);
sred = round(s/10);
figure;
scatter3(coordinates_all(1:sred,1),coordinates_all(1:sred,2),coordinates_all(1:sred,3),10,'filled');
coordinates_brain = coordinates_all(1:sred,:);