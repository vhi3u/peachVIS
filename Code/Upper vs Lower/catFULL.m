%{
catFULL.m
Purpose: Concatenates all UVL CTD mat files into one mat file. 

Requires:
<glidername><X>UVL.mat

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

%}

file_names = {'Ramses1UVL.mat', 'Ramses2UVL.mat', 'Ramses3UVL.mat', 'Modena1UVLc.mat', 'Ramses4UVL.mat', 'Ramses5UVL.mat', 'Ramses6UVL.mat', 'Angus1UVL.mat', 'Ramses7UVL.mat'};



time_all = [];
lat_all = [];
lon_all = [];
depth_all = [];

upperTemp_all = [];
upperSal_all = [];
upperDens_all = [];
upperDepth_all = [];

lowerTemp_all = [];
lowerSal_all = [];
lowerDens_all = [];
lowerDepth_all = [];


%salupper_all = [r1.block_upperSal, r2.block_upperSal];

for i = 1:numel(file_names)
    data = load(file_names{i});
    time_all = [time_all, data.cblock_time];
    lat_all = [lat_all, data.cblock_lat];
    lon_all = [lon_all, data.cblock_lon];
    depth_all = [depth_all, data.cblock_depth];

    upperTemp_all = [upperTemp_all, data.block_upperTemp];
    upperSal_all = [upperSal_all, data.block_upperSal];
    upperDens_all = [upperDens_all, data.block_upperDens];
    upperDepth_all = [upperDepth_all, data.block_upperDepth];

    lowerTemp_all = [lowerTemp_all, data.block_lowerTemp];
    lowerSal_all = [lowerSal_all, data.block_lowerSal];
    lowerDens_all = [lowerDens_all, data.block_lowerDens];
    lowerDepth_all = [lowerDepth_all, data.block_lowerDepth];
end


save('peachFULLc.mat', 'time_all', 'lat_all', 'lon_all', 'depth_all', 'upperTemp_all', 'upperSal_all', ...
    'upperDens_all', 'upperDepth_all', 'lowerTemp_all', 'lowerSal_all', 'lowerDens_all', 'lowerDepth_all')
`