%{
thirdECO.m
Purpose: Upper and lower third split for ECO. 

Requires:
ccplot
eco_seven
modify eco to load correct file. 
wdepthtest

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Modify wdepthtest first before running. 
Created: 

%}

eco = load('Ramses_Deployment3_ECO_L1.mat');
eco_seven;

%get wdepthi and flight.ptime_datenum
% make sure to change wdepthtest flight number
wdepthtest;

wdeptheco = interp1(flight.ptime_datenum, wdepthi, eco.ptime_datenum);

[profile_index, profile_direction] = findProfiles(eco.depth, 'stall', 1.5, 'inversion', 1.5, 'interrupt', inf);

for i = 1:max(profile_index)
    j = find(profile_index == i);
    depth_avg(i) = mean(wdeptheco(j), 'omitnan');
    iu = find(eco.depth(j) < depth_avg(i) / 3);
    
    upperChlor_avg(i) = mean(baseChlor(j(iu)), 'omitnan');
    upperCDOM_avg(i) = mean(baseCDOM(j(iu)), 'omitnan');
    upperScatter_avg(i) = mean(baseScatter(j(iu)), 'omitnan'); 
    upperDepth_avg(i) = mean(eco.depth(j(iu)), 'omitnan');



    il = find(eco.depth(j) > depth_avg(i) * 2/3);
    lowerChlor_avg(i) = mean(baseChlor(j(il)), 'omitnan');
    lowerCDOM_avg(i) = mean(baseCDOM(j(il)), 'omitnan');
    lowerScatter_avg(i) = mean(baseScatter(j(il)), 'omitnan');
    lowerDepth_avg(i) = mean(eco.depth(j(il)), 'omitnan');


    time_avg(i) = mean(eco.ptime_datenum(j), 'omitnan');
    lat_avg(i) = mean(eco.gpsLat(j), 'omitnan');
    lon_avg(i) = mean(eco.gpsLon(j), 'omitnan');

end



% figure
% plot(time_avg, upperScatter_avg);
% hold on
% plot(time_avg, lowerScatter_avg);

