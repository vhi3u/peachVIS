%{
zoneSort.m
Purpose: Divides glider data into zones to analyze MAB/SAB influence

Requires:
peachFULLc.mat
load_gebco_2014.m
plot_bath.m
sortNoVis.m

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

%}
% Sorts full PEACH file into zones indicated by figure. 

load_gebco_2014;
% bathSpace_test2;
ctd = load('peachFULLc.mat');

% Create the coordinate points that will make up corners of zone polyshape
sortNoVis;

hold on;


% Define zones using polyshape function
zone1 = polyshape([lonU6i, lonU6, lonU5, lonU5i], [latU6i, latU6, latU5, latU5i]);
zone2 = polyshape([lonU5i, lonU5, lonU4, lonU4i], [latU5i, latU5, latU4, latU4i]);
zone3 = polyshape([lonU4i, lonU4, lonU3, lonU3i], [latU4i, latU4, latU3, latU3i]);
zone4 = polyshape([lonU3i, lonU3, lonU2, lonU2i], [latU3i, latU3, latU2, latU2i]);
zone5 = polyshape([lonU2i, lonU2, lonU, hatt_lon], [latU2i, latU2, latU, hatt_lat]);
zone6 = polyshape([hatt_lon, lonU, lonC], [hatt_lat, latU, latC]);

zone7 = polyshape([hatt_lon, lonC, b_longitudes(1), longitudes(1)], [hatt_lat, latC, b_latitudes(1), latitudes(1)]);
zone8 = polyshape([longitudes(1), longitudes(2), b_longitudes(2), b_longitudes(1)], [latitudes(1), latitudes(2), b_latitudes(2), b_latitudes(1)]);
zone9 = polyshape([longitudes(2), longitudes(3), b_longitudes(3), b_longitudes(2)], [latitudes(2), latitudes(3), b_latitudes(3), b_latitudes(2)]);
zoneA = polyshape([longitudes(3), longitudes(4), b_longitudes(4), b_longitudes(3)], [latitudes(3), latitudes(4), b_latitudes(4), b_latitudes(3)]);
zoneB = polyshape([longitudes(4), longitudes(5), b_longitudes(5), b_longitudes(4)], [latitudes(4), latitudes(5), b_latitudes(5), b_latitudes(4)]);

% Define structure to store values inside each zone
z1 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z2 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z3 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z4 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z5 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z6 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z7 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z8 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
z9 = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
zA = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);
zB = struct('upperTemp_all', [], 'upperSal_all', [], 'upperDens_all', [], 'upperDepth_all', [], 'lowerTemp_all', [], 'lowerSal_all', [], 'lowerDens_all', [], 'lowerDepth_all', [], 'time_all', [], 'lat_all', [], 'lon_all', [], 'depth_all', []);


% Assign values based on lon and lat to correspond to proper zone

for i = 1:length(ctd.lat_all)

    point_lat = ctd.lat_all(i);
    point_lon = ctd.lon_all(i);

    if isinterior(zone1, point_lon, point_lat)
        zone_index = 'z1';
    elseif isinterior(zone2, point_lon, point_lat)
        zone_index = 'z2';
    elseif isinterior(zone3, point_lon, point_lat)
        zone_index = 'z3';
    elseif isinterior(zone4, point_lon, point_lat)
        zone_index = 'z4';
    elseif isinterior(zone5, point_lon, point_lat)
        zone_index = 'z5';
    elseif isinterior(zone6, point_lon, point_lat)
        zone_index = 'z6';
    elseif isinterior(zone7, point_lon, point_lat)
        zone_index = 'z7';
    elseif isinterior(zone8, point_lon, point_lat)
        zone_index = 'z8';
    elseif isinterior(zone9, point_lon, point_lat)
        zone_index = 'z9';
    elseif isinterior(zoneA, point_lon, point_lat)
        zone_index = 'zA';
    elseif isinterior(zoneB, point_lon, point_lat)
        zone_index = 'zB';
        
    else
        continue;
    end
    
    % Append data for the current point to the corresponding zone
    eval([zone_index '.upperTemp_all = [', zone_index, '.upperTemp_all, ctd.upperTemp_all(i)];']);
    eval([zone_index '.upperSal_all = [', zone_index, '.upperSal_all, ctd.upperSal_all(i)];']);
    eval([zone_index '.upperDens_all = [', zone_index, '.upperDens_all, ctd.upperDens_all(i)];']);
    eval([zone_index '.upperDepth_all = [', zone_index, '.upperDepth_all, ctd.upperDepth_all(i)];']);
    eval([zone_index '.lowerTemp_all = [', zone_index, '.lowerTemp_all, ctd.lowerTemp_all(i)];']);
    eval([zone_index '.lowerSal_all = [', zone_index, '.lowerSal_all, ctd.lowerSal_all(i)];']);
    eval([zone_index '.lowerDens_all = [', zone_index, '.lowerDens_all, ctd.lowerDens_all(i)];']);
    eval([zone_index '.lowerDepth_all = [', zone_index, '.lowerDepth_all, ctd.lowerDepth_all(i)];']);
    eval([zone_index '.time_all = [', zone_index, '.time_all, ctd.time_all(i)];']);
    eval([zone_index '.lat_all = [', zone_index, '.lat_all, ctd.lat_all(i)];']);
    eval([zone_index '.lon_all = [', zone_index, '.lon_all, ctd.lon_all(i)];']);
    eval([zone_index '.depth_all = [', zone_index, '.depth_all, ctd.depth_all(i)];']);
end

% Create figure to show different zones 
polyshapes = {zone1, zone2, zone3, zone4, zone5, zone6, zone7, zone8, zone9, zoneA, zoneB};
zoneNames = {'Zone 1', 'Zone 2', 'Zone 3', 'Zone 4', 'Zone 5', 'Zone 6', 'Zone 7', 'Zone 8', 'Zone 9', 'Zone A', 'Zone B'};

plot_bath;
for i = 1:length(polyshapes)
    plot(polyshapes{i});
    
   [xc,yc] = centroid(polyshapes{i});
   text(xc,yc, zoneNames{i}, 'HorizontalAlignment','center', 'VerticalAlignment','middle');

end

% Overlay full peach flight lon/lat data. 
plot(ctd.lon_all, ctd.lat_all, '.');
%export_fig ('/Users/victornguyen/Downloads/peachZONE', '-m3', '-nocrop');