%{
thirdCTD.m
Purpose: Upper and lower third split for CTD. 

Requires:
modify ctd to load correct file. 
wdepthtest

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Modify wdepthtest first before running. 
Created: 

%}

ctd = load('Ramses_Deployment2_CTD_L1.mat');
wdepthtest;

wdepthctd = interp1(flight.ptime_datenum, wdepthi, ctd.ptime_datenum);

[profile_index, profile_direction] = findProfiles(ctd.depth, 'stall', 1.5, 'inversion', 1.5, 'interrupt', inf);

for i = 1:max(profile_index)
    j = find(profile_index == i);
    depth_avg(i) = mean(wdepthctd(j));
    iu = find(ctd.depth(j) < depth_avg(i) / 3);
    
    cupperTemp_avg(i) = mean(ctd.temp(j(iu)), 'omitnan');
    cupperSal_avg(i) = mean(ctd.salinCorrected(j(iu)), 'omitnan');
    cupperDens_avg(i) = mean(ctd.densCorrected(j(iu)), 'omitnan'); 
    cupperDepth_avg(i) = mean(ctd.depth(j(iu)), 'omitnan');


    il = find(ctd.depth(j) > depth_avg(i) * 2/3);
    clowerTemp_avg(i) = mean(ctd.temp(j(il)), 'omitnan');
    clowerSal_avg(i) = mean(ctd.salinCorrected(j(il)), 'omitnan');
    clowerDens_avg(i) = mean(ctd.densCorrected(j(il)), 'omitnan');
    clowerDepth_avg(i) = mean(ctd.depth(j(il)), 'omitnan');

    ctime_avg(i) = mean(ctd.ptime_datenum(j), 'omitnan');
    clat_avg(i) = mean(ctd.gpsLat(j), 'omitnan');
    clon_avg(i) = mean(ctd.gpsLon(j), 'omitnan');
    %cdepth_avg(i) = mean(ctd.depth(j));

end