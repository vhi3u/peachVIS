%{
peachSortGraphs.m
Purpose: Creates histograms of CTD upper and lower values. Run zoneSort.m first.  

Requires:
zoneSort.m


Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

Zones 1, A, and B omitted due to lack of data values within the zone. See
zoneSort.m

%}


num_bins = 20;

figure;


% subplot(4, 3, 1);
% histogram(z1.upperSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone 1\nCount: %d Mean: %.2f STD: %.2f', length(z1.upperSal_all), mean(z1.upperSal_all, 'omitnan'), std(z1.upperSal_all, 'omitnan')));
% xlabel('Upper Salinity');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 2\nCount: %d Mean: %.2f STD: %.2f', length(z2.upperSal_all), mean(z2.upperSal_all, 'omitnan'), std(z2.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 3\nCount: %d Mean: %.2f STD: %.2f', length(z3.upperSal_all), mean(z3.upperSal_all, 'omitnan'), std(z3.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 4\nCount: %d Mean: %.2f STD: %.2f', length(z4.upperSal_all), mean(z4.upperSal_all, 'omitnan'), std(z4.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 5\nCount: %d Mean: %.2f STD: %.2f', length(z5.upperSal_all), mean(z5.upperSal_all, 'omitnan'), std(z5.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 6\nCount: %d Mean: %.2f STD: %.2f', length(z6.upperSal_all), mean(z6.upperSal_all, 'omitnan'), std(z6.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 7\nCount: %d Mean: %.2f STD: %.2f', length(z7.upperSal_all), mean(z7.upperSal_all, 'omitnan'), std(z7.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 8\nCount: %d Mean: %.2f STD: %.2f', length(z8.upperSal_all), mean(z8.upperSal_all, 'omitnan'), std(z8.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.upperSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 9\nCount: %d Mean: %.2f STD: %.2f', length(z9.upperSal_all), mean(z9.upperSal_all, 'omitnan'), std(z9.upperSal_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

% subplot(4, 3, 10);
% histogram(zA.upperSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone A\nCount: %d Mean: %.2f STD: %.2f', length(zA.upperSal_all), mean(zA.upperSal_all, 'omitnan'), std(zA.upperSal_all, 'omitnan')));
% xlabel('Upper Salinity');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.upperSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone B\nCount: %d Mean: %.2f STD: %.2f', length(zB.upperSal_all), mean(zB.upperSal_all, 'omitnan'), std(zB.upperSal_all, 'omitnan')));
% xlabel('Upper Salinity');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Upper Salinity for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_UpperSal_dist_new.png', '-m3', '-nocrop');



figure;

% subplot(4, 3, 1);
% histogram(z1.lowerSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone 1\nCount: %d Mean: %.2f STD: %.2f', length(z1.lowerSal_all), mean(z1.lowerSal_all, 'omitnan'), std(z1.lowerSal_all, 'omitnan')));
% xlabel('Lower Salinity');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 2\nCount: %d Mean: %.2f STD: %.2f', length(z2.lowerSal_all), mean(z2.lowerSal_all, 'omitnan'), std(z2.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 3\nCount: %d Mean: %.2f STD: %.2f', length(z3.lowerSal_all), mean(z3.lowerSal_all, 'omitnan'), std(z3.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 4\nCount: %d Mean: %.2f STD: %.2f', length(z4.lowerSal_all), mean(z4.lowerSal_all, 'omitnan'), std(z4.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 5\nCount: %d Mean: %.2f STD: %.2f', length(z5.lowerSal_all), mean(z5.lowerSal_all, 'omitnan'), std(z5.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 6\nCount: %d Mean: %.2f STD: %.2f', length(z6.lowerSal_all), mean(z6.lowerSal_all, 'omitnan'), std(z6.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 7\nCount: %d Mean: %.2f STD: %.2f', length(z7.lowerSal_all), mean(z7.lowerSal_all, 'omitnan'), std(z7.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 8\nCount: %d Mean: %.2f STD: %.2f', length(z8.lowerSal_all), mean(z8.lowerSal_all, 'omitnan'), std(z8.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.lowerSal_all, num_bins, 'BinLimits', [29 37], 'Normalization','pdf');
title(sprintf('Zone 9\nCount: %d Mean: %.2f STD: %.2f', length(z9.lowerSal_all), mean(z9.lowerSal_all, 'omitnan'), std(z9.lowerSal_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

% subplot(4, 3, 10);
% histogram(zA.lowerSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone A\nCount: %d Mean: %.2f STD: %.2f', length(zA.lowerSal_all), mean(zA.lowerSal_all, 'omitnan'), std(zA.lowerSal_all, 'omitnan')));
% xlabel('Lower Salinity');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.lowerSal_all, num_bins, 'BinLimits', [29 37]);
% title(sprintf('Zone B\nCount: %d Mean: %.2f STD: %.2f', length(zB.lowerSal_all), mean(zB.lowerSal_all, 'omitnan'), std(zB.lowerSal_all, 'omitnan')));
% xlabel('Lower Salinity');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Lower Salinity for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_LowerSal_dist_new.png', '-m3', '-nocrop');




figure;

% subplot(4, 3, 1);
% histogram(z1.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone 1\nCount: %d Mean: %.2f STD: %.2f', length(z1.upperDens_all), mean(z1.upperDens_all, 'omitnan'), std(z1.upperDens_all, 'omitnan')));
% xlabel('Upper Density');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 2\nCount: %d Mean: %.2f STD: %.2f', length(z2.upperDens_all), mean(z2.upperDens_all, 'omitnan'), std(z2.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 3\nCount: %d Mean: %.2f STD: %.2f', length(z3.upperDens_all), mean(z3.upperDens_all, 'omitnan'), std(z3.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 4\nCount: %d Mean: %.2f STD: %.2f', length(z4.upperDens_all), mean(z4.upperDens_all, 'omitnan'), std(z4.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 5\nCount: %d Mean: %.2f STD: %.2f', length(z5.upperDens_all), mean(z5.upperDens_all, 'omitnan'), std(z5.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 6\nCount: %d Mean: %.2f STD: %.2f', length(z6.upperDens_all), mean(z6.upperDens_all, 'omitnan'), std(z6.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 7\nCount: %d Mean: %.2f STD: %.2f', length(z7.upperDens_all), mean(z7.upperDens_all, 'omitnan'), std(z7.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 8\nCount: %d Mean: %.2f STD: %.2f', length(z8.upperDens_all), mean(z8.upperDens_all, 'omitnan'), std(z8.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 9\nCount: %d Mean: %.2f STD: %.2f', length(z9.upperDens_all), mean(z9.upperDens_all, 'omitnan'), std(z9.upperDens_all, 'omitnan')));
xlabel('Upper Density');
ylabel('Frequency');

% subplot(4, 3, 9);
% histogram(zA.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone A\nCount: %d Mean: %.2f STD: %.2f', length(zA.upperDens_all), mean(zA.upperDens_all, 'omitnan'), std(zA.upperDens_all, 'omitnan')));
% xlabel('Upper Density');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.upperDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone B\nCount: %d Mean: %.2f STD: %.2f', length(zB.upperDens_all), mean(zB.upperDens_all, 'omitnan'), std(zB.upperDens_all, 'omitnan')));
% xlabel('Upper Density');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Upper Density for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_UpperDens_dist', '-m3', '-nocrop');





figure;

% subplot(4, 3, 1);
% histogram(z1.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone 1\nCount: %d Mean: %.2f STD: %.2f', length(z1.lowerDens_all), mean(z1.lowerDens_all, 'omitnan'), std(z1.lowerDens_all, 'omitnan')));
% xlabel('Lower Density');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 2\nCount: %d Mean: %.2f STD: %.2f', length(z2.lowerDens_all), mean(z2.lowerDens_all, 'omitnan'), std(z2.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 3\nCount: %d Mean: %.2f STD: %.2f', length(z3.lowerDens_all), mean(z3.lowerDens_all, 'omitnan'), std(z3.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 4\nCount: %d Mean: %.2f STD: %.2f', length(z4.lowerDens_all), mean(z4.lowerDens_all, 'omitnan'), std(z4.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 5\nCount: %d Mean: %.2f STD: %.2f', length(z5.lowerDens_all), mean(z5.lowerDens_all, 'omitnan'), std(z5.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 6\nCount: %d Mean: %.2f STD: %.2f', length(z6.lowerDens_all), mean(z6.lowerDens_all, 'omitnan'), std(z6.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 7\nCount: %d Mean: %.2f STD: %.2f', length(z7.lowerDens_all), mean(z7.lowerDens_all, 'omitnan'), std(z7.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 8\nCount: %d Mean: %.2f STD: %.2f', length(z8.lowerDens_all), mean(z8.lowerDens_all, 'omitnan'), std(z8.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
title(sprintf('Zone 9\nCount: %d Mean: %.2f STD: %.2f', length(z9.lowerDens_all), mean(z9.lowerDens_all, 'omitnan'), std(z9.lowerDens_all, 'omitnan')));
xlabel('Lower Density');
ylabel('Frequency');

% subplot(4, 3, 10);
% histogram(zA.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone A\nCount: %d Mean: %.2f STD: %.2f', length(zA.lowerDens_all), mean(zA.lowerDens_all, 'omitnan'), std(zA.lowerDens_all, 'omitnan')));
% xlabel('Lower Density');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.lowerDens_all, num_bins, 'BinLimits', [1019 1027]);
% title(sprintf('Zone B\nCount: %d Mean: %.2f STD: %.2f', length(zB.lowerDens_all), mean(zB.lowerDens_all, 'omitnan'), std(zB.lowerDens_all, 'omitnan')));
% xlabel('Lower Density');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Lower Density for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_LowerDens_dist', '-m3', '-nocrop');
