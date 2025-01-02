%{
r7ecothird.m
Purpose: same as thirdECO but for Ramses 7 and Modena 1 deployments 

Requires:
Glider Deployment ECO .mat
eco_seven

Authors: Victor Nguyen 
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

%}

eco = load('Modena_Deployment1_ECO_L1.mat');
eco_seven;


[profile_index, profile_direction] = findProfiles(eco.depth, 'stall', 1.5, 'inversion', 1.5, 'interrupt', inf);


for i = 1:max(profile_index)
   
    j = find(profile_index == i);
    if (~isempty(max(eco.depth(j))))
    depth_avg(i) = max(eco.depth(j))+3;
    if (i > 5 && 0.8*mean(depth_avg(i-4:i-1), 'omitnan')>depth_avg(i))
        depth_avg(i) = nan;
    end
    else depth_avg(i) = nan;
    end

    iu = find(eco.depth(j) < depth_avg(i) / 3);
    
    upperChlor_avg(i) = mean(eco.chlor(j(iu)), 'omitnan');
    upperCDOM_avg(i) = mean(eco.cdom(j(iu)), 'omitnan');
    upperScatter_avg(i) = mean(eco.scatter(j(iu)), 'omitnan');
    upperDepth_avg(i) = mean(eco.depth(j(iu)), 'omitnan');


    il = find(eco.depth(j) > depth_avg(i) * 2/3);
    lowerChlor_avg(i) = mean(eco.chlor(j(il)), 'omitnan');
    lowerCDOM_avg(i) = mean(eco.cdom(j(il)), 'omitnan');
    lowerScatter_avg(i) = mean(eco.scatter(j(il)), 'omitnan');
    lowerDepth_avg(i) = mean(eco.depth(j(il)), 'omitnan');

    time_avg(i) = mean(eco.ptime_datenum(j), 'omitnan');
    lat_avg(i) = mean(eco.gpsLat(j), 'omitnan');
    lon_avg(i) = mean(eco.gpsLon(j), 'omitnan');

end

% ib = find(depth_avg < 15);
% depth_avg(ib) = nan;