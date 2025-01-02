%{
catECO.m
Purpose: Concatenates all UVL ECO mat files into one mat file. 

Requires:
<glidername>E<X>UVL.mat

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

%}

file_names = {'RamsesD3UVL.mat', 'ModenaD1UVL.mat', 'RamsesD4UVL.mat', 'RamsesD5UVL.mat', 'RamsesD6UVL.mat', 'AngusD1UVL.mat', 'RamsesD7UVL.mat'};



time_all = [];
lat_all = [];
lon_all = [];
depth_all = [];

upperChlor_all = [];
upperCDOM_all = [];
upperScatter_all = [];
upperDepth_all = [];

lowerChlor_all = [];
lowerCDOM_all = [];
lowerScatter_all = [];
lowerDepth_all = [];

%salupper_all = [r1.block_upperSal, r2.block_upperSal];

for i = 1:numel(file_names)
    data = load(file_names{i});
    time_all = [time_all, data.eblock_time];
    lat_all = [lat_all, data.eblock_lat];
    lon_all = [lon_all, data.eblock_lon];
    depth_all = [depth_all, data.eblock_depth];

    upperChlor_all = [upperChlor_all, data.block_upperChlor];
    upperCDOM_all = [upperCDOM_all, data.block_upperCDOM];
    upperScatter_all = [upperScatter_all, data.block_upperScatter];
    upperDepth_all = [upperDepth_all, data.block_upperDepth];

    lowerChlor_all = [lowerChlor_all, data.block_lowerChlor];
    lowerCDOM_all = [lowerCDOM_all, data.block_lowerCDOM];
    lowerScatter_all = [lowerScatter_all, data.block_lowerScatter];
    lowerDepth_all = [lowerDepth_all, data.block_lowerScatter];
end



save('ecoDFULL.mat', 'time_all', 'lat_all', 'lon_all', 'depth_all', 'upperChlor_all', 'upperCDOM_all', 'upperDepth_all', ...
    'upperScatter_all', 'lowerChlor_all', 'lowerCDOM_all', 'lowerScatter_all', 'lowerDepth_all')
