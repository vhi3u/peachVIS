%{
zoneSortECO.m
Purpose: Divides glider data into zones to analyze MAB/SAB influence; for
ECO.

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
eco = load('ecoFULL.mat');

sortNoVis;


hold on;



for i = 1:numel(az_array)
    % Calculate new coordinates 1 km away from the original position along the given azimuth
    [lat, lon] = reckon(hatt_lat, hatt_lon, i * step_size, AZ);
    
    % Store the calculated latitude and longitude values
    latitudes(i) = lat;
    longitudes(i) = lon;
    
    % Calculate coordinates 1 km away from the original position, 90 degrees from the azimuth
    [lat2, lon2] = reckon(lat, lon, .75, (AZ+270));
    
    % Store the calculated latitude and longitude values for the new points
    b_latitudes(i) = lat2;
    b_longitudes(i) = lon2;
    
    % Plot the line connecting the original point and the new point
end

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

z1 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z2 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z3 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z4 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z5 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z6 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z7 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z8 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
z9 = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
zA = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);
zB = struct('upperChlor_all', [], 'upperCDOM_all', [], 'upperScatter_all', [], 'lowerChlor_all', [], 'lowerCDOM_all', [], 'lowerScatter_all', []);


for i = 1:length(eco.lat_all)

    point_lat = eco.lat_all(i);
    point_lon = eco.lon_all(i);

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
    eval([zone_index '.upperChlor_all = [', zone_index, '.upperChlor_all, eco.upperChlor_all(i)];']);
    eval([zone_index '.upperCDOM_all = [', zone_index, '.upperCDOM_all, eco.upperCDOM_all(i)];']);
    eval([zone_index '.upperScatter_all = [', zone_index, '.upperScatter_all, eco.upperScatter_all(i)];']);
    eval([zone_index '.lowerChlor_all = [', zone_index, '.lowerChlor_all, eco.lowerChlor_all(i)];']);
    eval([zone_index '.lowerCDOM_all = [', zone_index, '.lowerCDOM_all, eco.lowerCDOM_all(i)];']);
    eval([zone_index '.lowerScatter_all = [', zone_index, '.lowerScatter_all, eco.lowerScatter_all(i)];']);
end

polyshapes = {zone1, zone2, zone3, zone4, zone5, zone6, zone7, zone8, zone9, zoneA, zoneB};
zoneNames = {'Zone 1', 'Zone 2', 'Zone 3', 'Zone 4', 'Zone 5', 'Zone 6', 'Zone 7', 'Zone 8', 'Zone 9', 'Zone A', 'Zone B'};

plot_bath;
for i = 1:length(polyshapes)
    plot(polyshapes{i});
    
   [xc,yc] = centroid(polyshapes{i});
   text(xc,yc, zoneNames{i}, 'HorizontalAlignment','center', 'VerticalAlignment','middle');

end
plot(eco.lon_all, eco.lat_all, '.');
            