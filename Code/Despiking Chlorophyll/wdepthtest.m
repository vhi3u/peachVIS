%{
wdepthtest.m
Purpose: water depth data from Flight files.

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

modify line 14 with correct file name.
Created: 2024

%}

flight = load('Ramses_Deployment3_Flight_L1.mat');


wdepth = flight.depth + flight.altitude;

% only use this variable when glider is diving, based on pitch

ib1 = find(flight.pitch > -20);

% also appears that altitude signal is odd at times, want to use only those
% times when altitude is decreasing (maybe even fairly strongly?)s

dadt = gradient(flight.altitude);
ib2 = find(dadt>-0.2);

% last, the glider sat at depth a lot, want to eliminate times when depth
% not increasing as during a dive

dddt = gradient(flight.depth);
ib3 = find(dddt<0.2);

% % Handle potential empty arrays to avoid errors
% if isempty(ib1)
%     ib1 = [];
% end
% if isempty(ib2)
%     ib2 = [];
% end
% if isempty(ib3)
%     ib3 = [];
% end

iba = union(ib1, ib2);
ib = union(iba,ib3);

% ib = ib(ib > 0);

wdepthc = wdepth;
wdepthc(ib)= NaN;

ig = find(~isnan(wdepthc));
wdepthi = interp1(flight.ptime_datenum(ig), wdepthc(ig), flight.ptime_datenum);

% figure;
% % 
% ccplot(eco.ptime_datenum, -eco.depth, eco.chlor, [0 5], '.',10);
% hold on
% plot(flight.ptime_datenum, -wdepthi, 'r');
% datetick
% caxis([0 5]);
% colorbar;
% title('Ramses Deployment 3');